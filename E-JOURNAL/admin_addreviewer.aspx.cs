using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class admin_addreviewer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        Label1.Text = "atleast 6 characters";
        Label3.Text = "atleast 6 characters";
        Label1.ForeColor = Color.Gray;
        Label3.ForeColor = Color.Gray;
        Image1.Visible = false;
        Label4.Visible = false;
        DropDownList1.SelectedIndex = 0;
        TextBox1.Focus();
    }
    bool checklength(string s, int n)
    {
        if (s.Length < n)
            return false;
        else
            return true;
    }
    bool checkavailable(string s)
    {
        con.Close();
        con.Open();
        SqlCommand com = new SqlCommand("select * from REVIEWER_MASTER where rloginname ='" + s + "'", con);
        try
        {
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
                return false;
            else
                return true;
        }
        catch (Exception ex)
        {
            Response.Write("bool checkavailable : " + ex.Message);
            return false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (checklength(TextBox1.Text, 6))
        {
            if (checkavailable(TextBox1.Text))
            {
                Label1.Text = "atleast 6 characters";
                Label1.ForeColor = Color.Gray;
                Image1.Visible = true;
                TextBox2.Focus();
            }
            else
            {
                TextBox1.Text = "";
                Image1.Visible = false;
                Label1.Text = "login name is not available";
                Label1.ForeColor = Color.Red;
                TextBox1.Focus();
            }
        }
        else
        {
            Image1.Visible = false;
            Label1.Text = "atleast 6 characters";
            Label1.ForeColor = Color.Red;
            TextBox1.Text = "";
            TextBox1.Focus();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        bool ok = true;
        //login name
        if (checklength(TextBox1.Text, 6))
        {
            if (checkavailable(TextBox1.Text))
            {
                Label1.Text = "atleast 6 characters";
                Label1.ForeColor = Color.Gray;
                Image1.Visible = true;
            }
            else
            {
                Image1.Visible = false;
                Label1.Text = "login name is not available";
                Label1.ForeColor = Color.Red;
                ok = false;
            }
        }
        else
        {
            Image1.Visible = false;
            Label1.Text = "atleast 6 characters";
            Label1.ForeColor = Color.Red;
            ok = false;
        }
        //password
        if (checklength(TextBox2.Text, 6) == false)
        {
            Label3.ForeColor = Color.Red;
            ok = false;
        }
        if (ok == true)
        {
            Random rnd = new Random();
            string revid = "";
            do
            {
                revid = generateid("rev" + rnd.Next(1, 99999).ToString());
            } while (revid == "");
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into REVIEWER_MASTER values (@revid,@rloginname,@rpassword,' ',' ',' ',' ',' ',@remail,' ',' ',' ',0,' ',' ',' ',' ',@rareacheck,'True')", con);
            cmd.Parameters.AddWithValue("@revid", revid);
            cmd.Parameters.AddWithValue("@rloginname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@rpassword", TextBox2.Text);
            cmd.Parameters.AddWithValue("@remail", TextBox3.Text);
            cmd.Parameters.AddWithValue("@rareacheck", DropDownList1.SelectedValue);
            try
            {
                cmd.ExecuteNonQuery();
                sendmail(TextBox1.Text, TextBox2.Text, DropDownList1.SelectedValue, TextBox3.Text);
                Label4.Visible = true;
            }
            catch (Exception ex)
            {
                Response.Write("Submit operation : " + ex.Message);
            }
        }
        else
            TextBox1.Focus();
    }
    string generateid(string id)
    {
        con.Close();
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from REVIEWER_MASTER where revid ='" + id + "'", con);
            SqlDataReader dr1 = cmd.ExecuteReader();
            if (dr1.Read())
                return "";
            else
                return id;
        }
        catch (Exception ex)
        {
            Response.Write("generateid() :" + ex.Message);
            return "";
        }
    }
    void sendmail(string login, string pass, string subject, string email)
    {
        string subj = "Selected for the post of reviewer @ DJM";
        string body = "Congratulations. You are selected as a reviewer at Digi Journal Mart Website for the subject - area " + subject + ". Your Login name = " + login + " and Password = " + pass + ". You are requested to kindly update your profile at the earliest at http://localhost:49297/E-JOURNAL/djm_home.aspx";
        try
        {
            MailMessage msg = new MailMessage("digijournalmart@gmail.com", email, subj, body);
            SmtpClient cm = new SmtpClient();
            System.Net.NetworkCredential nc = new System.Net.NetworkCredential("digijournalmart@gmail.com", "pinkinath");
            cm.DeliveryMethod = SmtpDeliveryMethod.Network;
            cm.EnableSsl = true;
            cm.UseDefaultCredentials = false;
            cm.Credentials = nc;
            cm.Host = "smtp.gmail.com";
            cm.Port = 25;
            cm.Send(msg);
        }
        catch (SmtpException ex)
        {
            Response.Write("sendmail() :" + ex.Message);
        }
    }
}
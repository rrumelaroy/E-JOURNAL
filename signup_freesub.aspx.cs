using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Drawing;

public partial class signup_freesub : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default2.aspx");
    }
    public bool checklength(string s, int n)
    {
        if (s.Length < n)
            return false;
        else
            return true;
    }
    public bool checkavailable(string s)
    {
        con.Close();
        con.Open();
        SqlCommand com = new SqlCommand("select * from FREE_SUBSCRIBER_MASTER where floginname='"+s+"'",con);
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (checklength(TextBox1.Text,6))
        {
            if (checkavailable(TextBox1.Text))
            {
                Label3.Text = "atleast 6 characters";
                Label3.ForeColor = Color.Gray;
                Image1.Visible = true;
                TextBox2.Focus();
            }
            else
            {
                TextBox1.Text = "";
                Image1.Visible = false;
                Label3.Text = "login name is not available";
                Label3.ForeColor = Color.Red;
                TextBox1.Focus();
            }
        }
        else
        {
            Image1.Visible =false;
            Label3.Text = "atleast 6 characters";
            Label3.ForeColor = Color.Red;
            TextBox1.Text = "";
            TextBox1.Focus();
        }
    }
    public void refresh()
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        Image1.Visible = false;
        Label3.Text = "atleast 6 characters";
        Label3.ForeColor = Color.Gray;
        Label11.ForeColor = Color.Gray;
        Label12.Visible = false;
        Label13.Visible = false;
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        refresh();
        TextBox1.Focus();
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        bool ok = true;
        if (checklength(TextBox1.Text, 6))
        {
            if (checkavailable(TextBox1.Text))
            {
                Label3.Text = "atleast 6 characters";
                Label3.ForeColor = Color.Gray;
                Image1.Visible = true;
            }
            else
            {
                Image1.Visible = false;
                Label3.Text = "login name is not available";
                Label3.ForeColor = Color.Red;
                TextBox1.Focus();
                ok = false;
            }
        }
        else
        {
            Image1.Visible = false;
            Label3.Text = "atleast 6 characters";
            Label3.ForeColor = Color.Red;
            TextBox1.Focus();
            ok = false;
        }
        if (checklength(TextBox2.Text, 6) == false)
        {
            Label11.ForeColor = Color.Red;
            ok = false;
            TextBox2.Focus();
        }
        if (TextBox2.Text.Equals(TextBox3.Text) == false)
        {
            Label12.Visible = true;
            ok = false;
            TextBox3.Focus();
        }
        string c = Session["captcha"].ToString();
        if (TextBox6.Text.Equals(c) == false)
        {
            Label13.Visible = true;
            Response.Write(c);
            ok = false;
            TextBox6.Focus();
        }
        if (ok == true)
        {
            Random rnd = new Random();
            string freesubid = "";
            do
            {
                freesubid = generateid("fsub" + rnd.Next(1, 99999).ToString());
            } while (freesubid == "");
            //SqlTransaction trn = con.BeginTransaction("trn1");
            con.Close();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("insert into FREE_SUBSCRIBER_MASTER values(@fsubid,@floginname,@fpassword,@fqn,@fans,@femail,'True',0,@lastvisit)", con);
            cmd1.Parameters.AddWithValue("@fsubid", freesubid);
            cmd1.Parameters.AddWithValue("@floginname", TextBox1.Text);
            cmd1.Parameters.AddWithValue("@fpassword", TextBox2.Text);
            cmd1.Parameters.AddWithValue("fqn", DropDownList1.SelectedValue);
            cmd1.Parameters.AddWithValue("@fans", TextBox4.Text);
            cmd1.Parameters.AddWithValue("@femail", TextBox5.Text);
            cmd1.Parameters.AddWithValue("@lastvisit", DateTime.Now);
            //cmd1.Transaction = trn;
            try
            {
                cmd1.ExecuteNonQuery();
                sendmail(TextBox1.Text, TextBox2.Text, TextBox5.Text);
                Session.Add("type", "freesubscriber");
                Session.Add("pk", freesubid);
                Response.Redirect("subscriber_home.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("submit operation : "+ ex.Message);
            }
        }
        else
            TextBox1.Focus();
    }
    void sendmail(string lname,string pass,string email)
    {
        string subj = "Your free subscriber has been created.";
        string body = "Congratulations on creating a brand new free subscriber account in Digi Journal Mart website. Your Login name = " + lname + " and Password = " + pass;
        try
        {
            MailMessage msg = new MailMessage("digijournalmart@gmail.com",email,subj,body);
            SmtpClient cm = new SmtpClient();
            System.Net.NetworkCredential nc = new System.Net.NetworkCredential("digijournalmart@gmail.com","pinkinath");
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
            Response.Write("sendmail() :"+ ex.Message);
        }
    }
    string generateid(string id)
    {
        con.Close();
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from FREE_SUBSCRIBER_MASTER where fsubid='" + id + "'", con);
            SqlDataReader dr1 = cmd.ExecuteReader();
            if (dr1.Read())
                return "";
            else
                return id;
        }
        catch(Exception ex)
        {
            Response.Write("generateid() :" + ex.Message);
            return "";
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Add("type", "freesubscriber");
        Response.Redirect("djm_home.aspx");
    }
}
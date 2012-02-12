using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Net.Mail;

public partial class signup_writer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownList3.SelectedValue = "India";
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
        SqlCommand com = new SqlCommand("select * from AUTHOR_MASTER where aloginname='" + s + "'", con);
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
        if (checklength(TextBox1.Text, 6))
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
            Image1.Visible = false;
            Label3.Text = "atleast 6 characters";
            Label3.ForeColor = Color.Red;
            TextBox1.Text = "";
            TextBox1.Focus();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool ok = true;
        //firstname
        if (TextBox6.Text == "")
        {
            Label30.Visible = true;
            ok = false;
        }
        //login name
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
        //password
        if (checklength(TextBox2.Text, 6) == false)
        {
            Label31.ForeColor = Color.Red;
            ok = false;
        }
        //confirm password
        if (TextBox2.Text.Equals(TextBox3.Text) == false)
        {
            Label32.Visible = true;
            ok = false;
        }
        //highest qualification
        if (TextBox18.Text == "")
        {
            Label34.Visible = true;
            ok = false;
        }
        //designation
        if (TextBox19.Text == "")
        {
            Label35.Visible = true;
            ok = false;
        }
        //organization
        if (TextBox20.Text == "")
        {
            Label36.Visible = true;
            ok = false;
        }
        //captcha
        string c = Session["captcha"].ToString();
        if (TextBox21.Text.Equals(c) == false)
        {
            Label37.Visible = true;
            ok = false;
        }
        if (ok == true)
        {
            Random rnd = new Random();
            string authorid = "";
            do
            {
                authorid = generateid("auth" + rnd.Next(1, 99999).ToString());
            } while (authorid == "");
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into AUTHOR_MASTER values (@authid,@aloginname,@apassword,@atitle,@afirstname,@asurname,@asecurityqn,@aans,@aemail,@aaddress,@acity,@astate,@azipcode,@acountry,@ahighqual,@adesig,@aorganization,NULL,'False')", con);
            cmd.Parameters.AddWithValue("@authid", authorid);
            cmd.Parameters.AddWithValue("@aloginname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@apassword", TextBox2.Text);
            cmd.Parameters.AddWithValue("@atitle", DropDownList2.SelectedValue);
            cmd.Parameters.AddWithValue("@afirstname", TextBox6.Text);
            cmd.Parameters.AddWithValue("@asurname", TextBox7.Text);
            cmd.Parameters.AddWithValue("@asecurityqn", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@aans", TextBox4.Text);
            cmd.Parameters.AddWithValue("@aemail", TextBox5.Text);
            cmd.Parameters.AddWithValue("@aaddress", TextBox8.Text);
            cmd.Parameters.AddWithValue("@acity", TextBox9.Text);
            cmd.Parameters.AddWithValue("@astate", TextBox10.Text);
            cmd.Parameters.AddWithValue("@azipcode", TextBox11.Text);
            cmd.Parameters.AddWithValue("@acountry", DropDownList3.SelectedValue);
            cmd.Parameters.AddWithValue("@ahighqual", TextBox18.Text);
            cmd.Parameters.AddWithValue("@adesig", TextBox19.Text);
            cmd.Parameters.AddWithValue("@aorganization", TextBox20.Text);
            try
            {
                cmd.ExecuteNonQuery();
                sendmail(DropDownList2.SelectedValue, TextBox6.Text, TextBox5.Text);
                Label38.Visible = true;
                Label38.Focus();
            }
            catch (Exception ex)
            {
                Response.Write("Submit operation : " + ex.Message);
            }
        }
        else
            DropDownList2.Focus();
    }
    string generateid(string id)
    {
        con.Close();
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from AUTHOR_MASTER where authid='" + id + "'", con);
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
    void sendmail(string title, string firstname, string email)
    {
        string subj = "Your account request has been sent.";
        string body = title + " " + firstname + ", your DJM Author account request has been sent successfully. Activation of your account will be sent through email.";
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
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DropDownList2.SelectedIndex = 0;
        TextBox6.Text = "";
        Label30.Visible = false;
        TextBox7.Text = "";
        TextBox1.Text = "";
        Image1.Visible = false;
        Label3.Text = "atleast 6 characters";
        Label3.ForeColor = Color.Gray;
        TextBox2.Text = "";
        Label31.ForeColor = Color.Gray;
        TextBox3.Text = "";
        Label32.Visible = false;
        DropDownList1.SelectedIndex = 0;
        TextBox4.Text = "";
        TextBox8.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
        DropDownList3.SelectedValue = "India";        
        TextBox5.Text = "";
        TextBox18.Text = "";
        Label34.Visible = false;
        TextBox19.Text = "";
        Label35.Visible = false;
        TextBox20.Text = "";
        Label36.Visible = false;
        TextBox21.Text = "";
        Label37.Visible = false;
        Label38.Visible = false;
        DropDownList2.Focus();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Add("type", "author");
        Response.Redirect("djm_home.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Drawing;

public partial class djm_home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        div1.Visible = false;
        con.Open();
        Label1.Text = "";
        Label2.Text = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        DropDownList1.SelectedIndex = 0;
        TextBox1.Focus();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("signup_freesub.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if((TextBox1.Text=="")&&(TextBox2.Text==""))
        {
            Label1.Text="Name and Password cannot be empty";
            TextBox1.Focus();
        }
        else if ((TextBox1.Text == "") && (TextBox2.Text != ""))
        {
            Label1.Text = "Login Name cannot be empty.";
            TextBox1.Focus();
        }
        else if ((TextBox1.Text != "") && (TextBox2.Text == ""))
        {
            Label1.Text = "Password cannot be empty.";
            TextBox1.Focus();
        }
        else
        {
            if (DropDownList1.SelectedValue == "Free Subscriber")
                verify_freesub(TextBox1.Text, TextBox2.Text);
            else if (DropDownList1.SelectedValue == "Author")
                verify_author(TextBox1.Text, TextBox2.Text);
            else if (DropDownList1.SelectedValue == "Paid Subscriber")
                verify_paidsub(TextBox1.Text, TextBox2.Text);
            else if (DropDownList1.SelectedValue == "Reviewer")
                verify_reviewer(TextBox1.Text, TextBox2.Text);
            else
                verify_admin(TextBox1.Text, TextBox2.Text);
        }
    }
    void verify_admin(string log, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select adminid from ADMINISTRATOR_MASTER where adminname='" + TextBox1.Text + "' and adminpass ='" + TextBox2.Text + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session.Add("pk", dr[0].ToString());
                Session.Add("type", "administrator");
                Response.Redirect("admin_home.aspx");
            }
            else
                Label1.Text = "No such user exists.";
        }
        catch (Exception ex)
        {
            Response.Write("verify_admin() : " + ex.Message);
        }
    }
    void verify_freesub(string log, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select fsubid from FREE_SUBSCRIBER_MASTER where facctype = 'True' and floginname='" + TextBox1.Text + "' and fpassword='" + TextBox2.Text + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session.Add("pk", dr[0].ToString());
                Session.Add("type", "freesubscriber");
                Response.Redirect("subscriber_home.aspx");
            }
            else
                Label1.Text = "No such user exists.";
        }
        catch (Exception ex)
        {
            Response.Write("verify_freesub() : " + ex.Message);
        }
    }
    void verify_reviewer(string log, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select revid from REVIEWER_MASTER where raccstatus = 'True' and rloginname='" + TextBox1.Text + "' and rpassword='" + TextBox2.Text + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session.Add("pk", dr[0].ToString());
                Session.Add("type", "reviewer");
                Response.Redirect("review_home.aspx");
            }
            else
                Label1.Text = "No such user exists.";
        }
        catch (Exception ex)
        {
            Response.Write("verify_reviewer() : " + ex.Message);
        }
    }
    void verify_paidsub(string log, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select psubid from PAID_SUBSCRIBER_MASTER where pacctype = 'True' and ploginname='" + TextBox1.Text + "' and ppassword='" + TextBox2.Text + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session.Add("pk", dr[0].ToString());
                Session.Add("type", "paidsubscriber");
                Response.Redirect("subscriber_home.aspx");
            }
            else
                Label1.Text = "No such user exists.";
        }
        catch (Exception ex)
        {
            Response.Write("verify_paidsub() : " + ex.Message);
        }
    }
    void verify_author(string log, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select authid from AUTHOR_MASTER where aaccstatus = 'True' and aloginname='" + TextBox1.Text + "' and apassword='" + TextBox2.Text + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session.Add("pk", dr[0].ToString());
                Session.Add("type", "author");
                Response.Redirect("author_home.aspx");
            }
            else
                Label1.Text = "No such user exists.";
        }
        catch (Exception ex)
        {
            Response.Write("verify_author() : " + ex.Message);
        }
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        Response.Redirect("signup_freesub.aspx");
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        TextBox3.Text = TextBox1.Text;
        div1.Visible = true;
        TextBox3.Focus();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        bool ok = true;
        if (TextBox3.Text.Equals(""))
            ok = false;
        string captcha = Session["captcha"].ToString();
        if (TextBox4.Text.Equals(captcha) == false)
            ok = false;
        //Label2.Text = TextBox3.Text + " and " + DropDownList2.SelectedValue;
        if (ok == true)
        {
            con.Close();
            con.Open();
            string st="";
            if (DropDownList2.SelectedValue.Equals("Free Subscriber"))
                st = "SELECT fpassword, femail FROM FREE_SUBSCRIBER_MASTER WHERE floginname = '" + TextBox3.Text + "'";
            else if (DropDownList2.SelectedValue.Equals("Paid Subscriber"))
                st = "SELECT ppassword, pemail FROM PAID_SUBSCRIBER_MASTER WHERE ploginname = '" + TextBox3.Text + "'";
            else if (DropDownList2.SelectedValue.Equals("Author"))
                st = "SELECT apassword, aemail FROM AUTHOR_MASTER WHERE aloginname = '" + TextBox3.Text + "'";
            else if (DropDownList2.SelectedValue.Equals("Reviewer"))
                st = "SELECT rpassword, remail FROM REVIEWER_MASTER WHERE rloginname = '" + TextBox3.Text + "'";
            else
                st = "SELECT adminpass, adminemail FROM ADMINISTRATOR_MASTER WHERE adminname = '" + TextBox3.Text + "'";
            SqlCommand cmd = new SqlCommand(st, con);
            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                if (dr.Read())
                    sendmail(TextBox3.Text, dr[0].ToString(), dr[1].ToString());
                else
                {
                    Label2.Text = "no data found";
                    ok = false;
                }
            }
            catch(Exception ex)
            {
                Response.Write("SEND PASSWORD : "+ex.Message);
            }
        }
    }
    void sendmail(string login, string pass, string email)
    {
        string subj = "DJM Password Recovery desk";
        string body = "Dear DJM User, your Login-Name is : "+ login + " and password is : " + pass + ".Thank you for using the password recovery option.";
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
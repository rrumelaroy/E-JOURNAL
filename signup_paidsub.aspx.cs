using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Net.Mail;

public partial class signup_paidsub : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox17.Text = DateTime.Now.ToString("dd-MM-yyyy");
        DropDownList4.SelectedValue = "India";
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox17.Text = Calendar1.SelectedDate.ToString("dd-MM-yyyy");
        Calendar1.Visible = false;
        TextBox18.Focus();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
        TextBox18.Focus();
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
        SqlCommand com = new SqlCommand("select * from PAID_SUBSCRIBER_MASTER where ploginname='" + s + "'", con);
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
            Label26.Visible = true;
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
            Label27.ForeColor = Color.Red;
            ok = false;
            TextBox2.Focus();
        }
        //confirm password
        if (TextBox2.Text.Equals(TextBox3.Text) == false)
        {
            Label28.Visible = true;
            ok = false;
            TextBox3.Focus();
        }
        //draft number
        if (TextBox15.Text == "")
        {
            Label32.Visible = true;
            ok = false;
        }
        //bank name
        if (TextBox16.Text == "")
        {
            Label30.Visible = true;
            ok = false;
        }
        //captcha
        string c = Session["captcha"].ToString();
        if (TextBox18.Text.Equals(c) == false)
        {
            Label31.Visible = true;
            Response.Write(c);
            ok = false;
        }
        if (ok == true)
        {
            Random rnd = new Random();
            string paidsubid = "";
            do
            {
                paidsubid = generateid("psub" + rnd.Next(1, 99999).ToString());
            } while (paidsubid == "");
            con.Close();
            con.Open();
            SqlTransaction trn = con.BeginTransaction("trn1");
            SqlCommand cmd = new SqlCommand("insert into PAID_SUBSCRIBER_MASTER values(@psubid,@ploginname,@ppassword,@ptitle,@pfirstname,@psurname,@psecurityqn,@pans,@pemail,@paddress,@pcity,@pstate,@pzipcode,@pcountry,NULL,NULL,NULL,'False')", con);
            cmd.Parameters.AddWithValue("@psubid", paidsubid);
            cmd.Parameters.AddWithValue("@ploginname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@ppassword", TextBox2.Text);
            cmd.Parameters.AddWithValue("@ptitle", DropDownList2.SelectedValue);
            cmd.Parameters.AddWithValue("@pfirstname", TextBox6.Text);
            cmd.Parameters.AddWithValue("@psurname", TextBox7.Text);
            cmd.Parameters.AddWithValue("@psecurityqn", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@pans", TextBox4.Text);
            cmd.Parameters.AddWithValue("@pemail", TextBox5.Text);
            cmd.Parameters.AddWithValue("@paddress", TextBox8.Text);
            cmd.Parameters.AddWithValue("@pcity", TextBox9.Text);
            cmd.Parameters.AddWithValue("@pstate", TextBox10.Text);
            cmd.Parameters.AddWithValue("@pzipcode", TextBox11.Text);
            cmd.Parameters.AddWithValue("@pcountry", DropDownList4.SelectedValue);
            SqlCommand cmd1 = new SqlCommand("insert into PAID_SUBSCRIBER_DRAFT_MASTER values(@psubid,@psubmitdate,@pschemeid,@pddnumber,@pddbank,@pddmakedate,'pending')", con);
            cmd1.Parameters.AddWithValue("@psubid", paidsubid);
            cmd1.Parameters.AddWithValue("@psubmitdate", DateTime.Now);
            cmd1.Parameters.AddWithValue("@pschemeid", DropDownList3.SelectedValue);
            cmd1.Parameters.AddWithValue("@pddnumber", Convert.ToInt32(TextBox15.Text));
            cmd1.Parameters.AddWithValue("@pddbank", TextBox16.Text);
            cmd1.Parameters.AddWithValue("@pddmakedate", Convert.ToDateTime(TextBox17.Text));
            cmd.Transaction = trn;
            cmd1.Transaction = trn;
            try
            {
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                sendmail(DropDownList2.SelectedValue, TextBox6.Text, TextBox5.Text);
                Label33.Visible = true;
                Label33.Focus();
                trn.Commit();
            }
            catch (Exception ex)
            {
                Response.Write("submit operation : " + ex.Message);
                trn.Rollback();
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
            SqlCommand cmd = new SqlCommand("select * from PAID_SUBSCRIBER_MASTER where psubid='" + id + "'", con);
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
        string body = title+" "+firstname+", your Paid DJM subscriber account request has been sent successfully. You are requested to the send the draft by speed post within 7 days to ADDRESS :- DJM Office, KIIT University, Bhubaneswar, Odisha-751024";
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
        TextBox6.Text = "";
        Label26.Visible = false;
        TextBox7.Text = "";
        TextBox1.Text = "";
        Image1.Visible = false;
        Label3.Text = "atleast 3 characters";
        Label3.ForeColor = Color.Gray;
        TextBox2.Text = "";
        Label27.ForeColor = Color.Gray;
        TextBox3.Text = "";
        Label28.Visible = false;
        DropDownList1.SelectedIndex = 0;
        TextBox4.Text = "";
        TextBox8.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
        DropDownList4.SelectedValue = "India";
        TextBox5.Text = "";
        TextBox15.Text = "";
        TextBox16.Text = "";
        TextBox17.Text = DateTime.Now.ToString("dd-MM-yyyy");
        Label32.Visible = false;
        Label30.Visible = false;
        Calendar1.Visible = false;
        TextBox18.Text = "";
        Label31.Visible = false;
        TextBox6.Focus();
        Label33.Visible = false;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Add("type", "paidsubscriber");
        Response.Redirect("djm_home.aspx");
    }
}
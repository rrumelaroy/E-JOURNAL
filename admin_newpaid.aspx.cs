using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class admin_newpaid : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void desclick(object sender, EventArgs e)
    {
        LinkButton c = (LinkButton)sender;
        HiddenField1.Value = c.ValidationGroup;
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT ptitle, pfirstname, psurname FROM PAID_SUBSCRIBER_MASTER WHERE psubid = '" + HiddenField1.Value + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        try
        {
            if (dr.Read())
            {
                Label1.Text = "What action would you like to take on " + dr[0].ToString() + " " + dr[1].ToString() + " " + dr[2].ToString() + " account request ?";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
        div1.Visible = true;
        LinkButton1.Focus();
    }    
    void update_paidsub(string pk, string schemeid, DateTime validaccdate)
    {
        con.Open();
        SqlCommand cmd1 = new SqlCommand("UPDATE PAID_SUBSCRIBER_MASTER SET pcurrschid = @pcurrschid, pactivedate = @pactivedate, pdeactivedate = @pdeactivedate, pacctype = @pacctype WHERE psubid = '" + pk + "'", con);
        cmd1.Parameters.AddWithValue("@pcurrschid",schemeid);
        cmd1.Parameters.AddWithValue("@pactivedate",DateTime.Now);
        cmd1.Parameters.AddWithValue("@pdeactivedate",validaccdate);
        cmd1.Parameters.AddWithValue("@pacctype", true);
        SqlCommand cmd2 = new SqlCommand("UPDATE PAID_SUBSCRIBER_DRAFT_MASTER SET pddstatus = 'recieved' WHERE psubid = '" + pk + "'", con);
        try
        {
            cmd1.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("updateauthor :" + ex.Message);
        }
        con.Close();
    }
    void acceptmail(string title, string name, string login, string pass, string email, DateTime validaccdate)
    {
        string subj = "DJM Paid Subscriber Account has been created.";
        string body = "Congratulations, " + title + name + " your Paid Subscriber account has been created on Digi Journal Mart website. Your Login name = " + login + " and Password = " + pass + ". Your account will be active till date " + validaccdate.ToString("dd-MM-yyyy") +".";
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
            Response.Write("acceptmail() :" + ex.Message);
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_newpaid.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("UPDATE PAID_SUBSCRIBER_DRAFT_MASTER SET pddstatus = 'not recieved' WHERE psubid = '" + HiddenField1.Value + "'", con);
        try
        {
            //Response.Write("hiii");
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
        Response.Redirect("admin_newpaid.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        con.Open();
        string email = "", login = "", pass = "", title = "", name = "", schemeid = "", duration = "";
        DateTime validaccdate = DateTime.Now;
        SqlCommand cmd1 = new SqlCommand("SELECT pschemeid FROM PAID_SUBSCRIBER_DRAFT_MASTER WHERE psubid ='" + HiddenField1.Value + "'", con);
        try
        {
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
                schemeid = dr1[0].ToString();
        }
        catch (Exception ex)
        {
            Response.Write("FETCH SCHEME ID :" + ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd2 = new SqlCommand("SELECT schduration FROM SCHEME_MASTER WHERE schemeid = '" + schemeid + "'", con);
        try
        {
            SqlDataReader dr2 = cmd2.ExecuteReader();
            if (dr2.Read())
                duration = dr2[0].ToString();
        }
        catch (Exception ex)
        {
            Response.Write("FETCH DURATION :" + ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT ploginname, ppassword, ptitle, pfirstname, pemail FROM PAID_SUBSCRIBER_MASTER WHERE psubid = '" + HiddenField1.Value + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                login = dr[0].ToString();
                pass = dr[1].ToString();
                title = dr[2].ToString();
                name = dr[3].ToString();
                email = dr[4].ToString();
                if (duration == "monthly")
                    validaccdate = DateTime.Now.AddMonths(1);
                else if (duration == "yearly")
                    validaccdate = DateTime.Now.AddYears(1);
                else
                    validaccdate = DateTime.Now.AddMonths(6);
            }
        }
        catch (Exception ex)
        {
            Response.Write("select operation:" + ex.Message);
            //trn.Rollback();
        }
        con.Close();
        update_paidsub(HiddenField1.Value, schemeid, validaccdate);
        acceptmail(title, name, login, pass, email, validaccdate);
        Response.Redirect("admin_newpaid.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class admin_newauthor : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT atitle, afirstname, asurname FROM AUTHOR_MASTER WHERE authid = '" + HiddenField1.Value + "'", con);
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
    void updateauthor(string pk)
    {
        con.Close();
        con.Open();
        SqlCommand cmd1 = new SqlCommand("UPDATE AUTHOR_MASTER SET astartdate = @astartdate, aaccstatus = @aaccstatus WHERE authid = '" + pk + "'", con);
        cmd1.Parameters.AddWithValue("@astartdate", DateTime.Now);
        cmd1.Parameters.AddWithValue("@aaccstatus", true);
        try
        {
            cmd1.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("updateauthor :" + ex.Message);
        }
    }
    void acceptmail(string title, string name, string login, string pass, string email)
    {
        string subj = "DJM Author Account has been created.";
        string body = "Congratulations, " +title+name+" your author account has been created on Digi Journal Mart website. Your Login name = " + login + " and Password = " + pass;
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
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        con.Open();
        string email = "", login = "", pass = "", title = "", name = "";
        SqlCommand cmd = new SqlCommand("SELECT aloginname, apassword, atitle, afirstname, aemail FROM AUTHOR_MASTER WHERE authid = '" + HiddenField1.Value + "'", con);
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
            }
        }
        catch (Exception ex)
        {
            Response.Write("select operation:" + ex.Message);
        }
        con.Close();
        updateauthor(HiddenField1.Value);
        acceptmail(title, name, login, pass, email);
        Response.Redirect("admin_newauthor.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_newauthor.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("UPDATE AUTHOR_MASTER SET astartdate = @astartdate WHERE authid = '" + HiddenField1.Value + "'", con);
        cmd.Parameters.AddWithValue("@astartdate", DateTime.Now);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
        Response.Redirect("admin_newauthor.aspx");
    }
}
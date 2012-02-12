using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;

public partial class admin_disable_paidsub : System.Web.UI.Page
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
                Label2.Text = "Are you sure, you want to disable " + dr[0].ToString() + " " + dr[1].ToString() + " " + dr[2].ToString() + "'s Account ?";
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
    void regretmail(string login, string email)
    {
        string subj = "DJM Paid Subscriber Account is deactivated.";
        string body = login + ", we are very sorry to say that your Paid Subscriber Account has been deactivated on Digi Journal Mart website.";
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
            Response.Write("regretmail() :" + ex.Message);
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_disable_paidsub.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        con.Open();
        string email = "", login = "";
        SqlCommand cmd = new SqlCommand("SELECT ptitle, pfirstname, psurname, pemail FROM PAID_SUBSCRIBER_MASTER WHERE psubid = '" + HiddenField1.Value + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                login = dr[0].ToString() + " " + dr[1].ToString() + " " + dr[2].ToString();
                email = dr[3].ToString();
            }
        }
        catch (Exception ex)
        {
            Response.Write("select loginname and email:" + ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd1 = new SqlCommand("UPDATE PAID_SUBSCRIBER_MASTER SET pacctype = @pacctype WHERE psubid = '" + HiddenField1.Value + "'", con);
        cmd1.Parameters.AddWithValue("@pacctype", false);
        try
        {
            cmd1.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("updating status : " + ex.Message);
        }
        con.Close();
        regretmail(login, email);
        Response.Redirect("admin_disable_paidsub.aspx");
    }
}
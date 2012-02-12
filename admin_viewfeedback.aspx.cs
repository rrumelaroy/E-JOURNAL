using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class admin_viewfeedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_viewfeedback.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Label5.Visible = true;
            TextBox1.Focus();
        }
        else
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE VIEWER_FEEDBACK_MASTER SET vanstype = @vanstype, vadminresponse = @vadminresponse WHERE vfeedid = '" + HiddenField1.Value + "'", con);
            cmd.Parameters.AddWithValue("@vadminresponse", TextBox1.Text);
            cmd.Parameters.AddWithValue("@vanstype", true);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                Response.Write("RESPONSE : " + ex.Message);
            }
            con.Close();
            responsemail(Label1.Text, Label4.Text, TextBox1.Text, HiddenField2.Value);
            Response.Redirect("admin_viewfeedback.aspx");
        }
    }
    void responsemail(string name, string feed, string response, string email)
    {
        string subj = "Response to the Feedback sent @ Digi Journal Mart";
        string body = "Dear, " + name + " the response to your feedback :- "+ feed + " is -> "+ response +".";
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
    protected void desclick(object sender, EventArgs e)
    {
        LinkButton c = (LinkButton)sender;
        string pk = c.ValidationGroup;
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT vfeedid, vname, vemail, vsubject, vfeedback FROM VIEWER_FEEDBACK_MASTER WHERE vfeedid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                HiddenField1.Value = dr[0].ToString();
                Label1.Text = dr[1].ToString();
                HiddenField2.Value = dr[2].ToString();
                Label3.Text = dr[3].ToString();
                Label4.Text = dr[4].ToString();
            }
        }
        catch (Exception ex)
        {
            Response.Write("DISPLAY DATA : " + ex.Message);
        }
        con.Close();
        div1.Visible = true;
        TextBox1.Focus();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM VIEWER_FEEDBACK_MASTER WHERE vfeedid = '" + HiddenField1.Value + "'", con);
        try
        {
            cmd.ExecuteNonQuery();
            
        }
        catch (Exception ex)
        {
            Response.Write("reject feedback:" + ex.Message);
        }
        con.Close();
        Response.Redirect("admin_viewfeedback.aspx");
    }
}
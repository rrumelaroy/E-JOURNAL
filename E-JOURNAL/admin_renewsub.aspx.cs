using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_renewsub : System.Web.UI.Page
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
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_renewsub.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("UPDATE PAID_SUBSCRIBER_DRAFT_MASTER SET pddstatus = 'rejected' WHERE psubid = '" + HiddenField1.Value + "'", con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Redirect("REJECT SUBSCRIPTION : " + ex.Message);
        }
        con.Close();
        Response.Redirect("admin_renewsub.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string type = "";
        string date1="";
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT p.psubmitdate, s.schduration FROM SCHEME_MASTER s, PAID_SUBSCRIBER_DRAFT_MASTER p WHERE s.schemeid = p.pschemeid AND p.pddstatus = 'pending' AND p.psubid = '" + HiddenField1.Value + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        try
        {
            if(dr.Read())
            {
                date1=dr[0].ToString();
                type = dr[0].ToString();
            }
        }
        catch(Exception ex)
        {
            Response.Write("ACCEPT SUBSCRIPTION : "+ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd1 = new SqlCommand("UPDATE PAID_SUBSCRIBER_MASTER SET pdeactivedate = @pdeactivedate WHERE psubid = '" + HiddenField1.Value + "'", con);
        if (type == "monthly")
            cmd1.Parameters.AddWithValue("@pdeactivedate", DateTime.Now.AddMonths(1));
        else if (type == "yearly")
            cmd1.Parameters.AddWithValue("@pdeactivedate", DateTime.Now.AddYears(1));
        else
            cmd1.Parameters.AddWithValue("@pdeactivedate", DateTime.Now.AddMonths(6));
        try
        {
            cmd1.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd2 = new SqlCommand("UPDATE PAID_SUBSCRIBER_DRAFT_MASTER SET pddstatus = 'recieved' WHERE psubid = '" + HiddenField1.Value + "'", con);
        cmd1.Parameters.AddWithValue("@psubmitdate", Convert.ToDateTime(date1));
        try
        {
            cmd2.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        Response.Redirect("admin_renewsub.aspx");
    }
}
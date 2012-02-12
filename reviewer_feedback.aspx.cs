using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class reviewer_feedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void desclick(object sender, EventArgs e)
    {
        LinkButton l = (LinkButton)sender;
        string pk = l.ValidationGroup;
        HiddenField1.Value = pk;
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT paperid FROM PAPER_REVIEWING_DETAIL WHERE feedbackid = '" + pk + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        try
        {
            if (dr.Read())
            {
                Session.Add("journal", dr[0].ToString());
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
        div1.Visible = true;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Add("feedbackid", HiddenField1.Value);
        Response.Redirect("reviewer_fillfeedback.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("reviewer_workdetail.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("reviewer_feedback.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class author_correctjournal : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("author_loadjournal.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("author_journalstatus.aspx");
    }
    protected void desclick(object sender, EventArgs e)
    {
        LinkButton l = (LinkButton)sender;
        string pk = l.ValidationGroup;
        HiddenField1.Value = pk;
        Session.Add("journal", pk);
        div1.Visible = true;
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("author_correctjournal.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("UPDATE PAPER_MASTER SET paperstatus = 'rejected' WHERE paperid = '" + HiddenField1.Value + "'", con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("REJECTING JOURNAL : " + ex.Message);
        }
        Response.Redirect("author_correctjournal.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Add("paper", HiddenField1.Value);
        Response.Redirect("author_correctjournal1.aspx");
    }
}
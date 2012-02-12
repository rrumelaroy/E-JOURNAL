using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_delscheme : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        modform.Visible = false;
    }
    protected void desclick(object sender, EventArgs e)
    {
        LinkButton l = (LinkButton)sender;
        string pk = l.ValidationGroup;
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM SCHEME_MASTER WHERE schemeid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                HiddenField1.Value = dr[0].ToString();
                Label1.Text = dr[2].ToString();
                Label2.Text = dr[1].ToString();
                Label3.Text = dr[3].ToString();
            }
        }
        catch (Exception ex)
        {
            Response.Write("DISPLAY DATA : " + ex.Message);
        }
        con.Close();
        modform.Visible = true;
        LinkButton1.Focus();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        bool ok = true;
        con.Open();
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM PAID_SUBSCRIBER_DRAFT_MASTER WHERE pddstatus = 'pending' AND pschemeid = '" + HiddenField1.Value + "'", con);
        SqlDataReader dr = cmd1.ExecuteReader();
        try
        {
            if (dr.Read())
            {
                ok = false;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
        if (ok == false)
            Label6.Visible = true;
        else
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM SCHEME_MASTER WHERE schemeid = '" + HiddenField1.Value + "'", con);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("DELETE SCHEME : " + ex.Message);
            }
            con.Close();
            Response.Redirect("admin_delscheme.aspx");
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_delscheme.aspx");
    }
}
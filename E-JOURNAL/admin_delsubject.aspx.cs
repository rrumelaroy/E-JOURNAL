using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_delsubject : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("SELECT * FROM SUBJECT_MASTER WHERE subjid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                HiddenField1.Value = dr[0].ToString();
                Label1.Text = dr[1].ToString();
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
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM PAPER_MASTER WHERE subjarea = '" + Label1.Text + "'", con);
        SqlDataReader dr = cmd1.ExecuteReader();
        try
        {
            if (dr.Read())
            {
                ok = false;
                Label6.Visible = true;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM REVIEWER_MASTER WHERE rareacheck = '" + Label1.Text + "'", con);
        SqlDataReader dr1 = cmd2.ExecuteReader();
        try
        {
            if (dr1.Read())
            {
                ok = false;
                Label6.Visible = true;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
        if (ok == true)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM SUBJECT_MASTER WHERE subjid = '" + HiddenField1.Value + "'", con);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("DELETE SUBJECT :" + ex.Message);
            }
            con.Close();
            Response.Redirect("admin_delsubject.aspx");
        }
        else
            Label6.Visible = true;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_delsubject.aspx");
    }
}
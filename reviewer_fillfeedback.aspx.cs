using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class reviewer_fillfeedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    string pk;
    protected void Page_Load(object sender, EventArgs e)
    {
        pk = Session["feedbackid"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT a.atitle, a.afirstname, a.asurname, p.papertitle FROM AUTHOR_MASTER a, PAPER_MASTER p, PAPER_REVIEWING_DETAIL r WHERE a.authid = p.authid AND p.paperid = r.paperid AND r.feedbackid = '" + pk + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        try
        {
            if (dr.Read())
            {
                Label2.Text = dr[0].ToString() + " " + dr[1].ToString() + " " + dr[2].ToString();
                Label3.Text = dr[3].ToString();
            }
            else
                Response.Write("data does not exists.");
        }
        catch (Exception ex)
        {
            Response.Write("FILL LABELS : " + ex.Message);
        }
        con.Close();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("reviewer_feedback.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (TextBox3.Text.Trim() == "")
            Label7.Visible = true;
        else
        {
            Label7.Visible = false;
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO FEEDBACK_MASTER VALUES (@feedbackid, @content_idea, @content_struct, @content_detail, @content_sufficient, @pre_voice, @pre_style, @pre_error, @res_varried, @res_accurate, @res_incorp, @res_biblio, @strength, @weakness, @summary)", con);
            try
            {
                cmd.Parameters.AddWithValue("@feedbackid",pk);
                cmd.Parameters.AddWithValue("@content_idea",DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@content_struct",DropDownList2.SelectedValue);
                cmd.Parameters.AddWithValue("@content_detail",DropDownList3.SelectedValue);
                cmd.Parameters.AddWithValue("@content_sufficient",DropDownList4.SelectedValue);
                cmd.Parameters.AddWithValue("@pre_voice",DropDownList5.SelectedValue);
                cmd.Parameters.AddWithValue("@pre_style",DropDownList6.SelectedValue);
                cmd.Parameters.AddWithValue("@pre_error",DropDownList7.SelectedValue);
                cmd.Parameters.AddWithValue("@res_varried",DropDownList8.SelectedValue);
                cmd.Parameters.AddWithValue("@res_accurate",DropDownList9.SelectedValue);
                cmd.Parameters.AddWithValue("@res_incorp",DropDownList10.SelectedValue);
                cmd.Parameters.AddWithValue("@res_biblio",DropDownList11.SelectedValue);
                cmd.Parameters.AddWithValue("@strength",TextBox1.Text);
                cmd.Parameters.AddWithValue("@weakness",TextBox2.Text);
                cmd.Parameters.AddWithValue("@summary", TextBox3.Text);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("SUBMIT FEEDBACK : " + ex.Message);
            }
            con.Close();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("UPDATE PAPER_REVIEWING_DETAIL SET papreviewstatus = 'reviewed' WHERE feedbackid = '" + pk + "'", con);
            try
            {
                cmd1.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Redirect("update paper_reviewing_detail : " + ex.Message);
            }
            Response.Redirect("reviewer_feedback.aspx");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("reviewer_workdetail.aspx");
    }
}
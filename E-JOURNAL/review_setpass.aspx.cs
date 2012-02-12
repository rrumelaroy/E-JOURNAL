using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class review_setpass : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    string pk;
    protected void Page_Load(object sender, EventArgs e)
    {
        pk = Session["pk"].ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Label11.Visible = false;
        Label12.ForeColor = Color.Gray;
        Label13.Visible = false;
        Label14.Visible = false;
        Image1.Visible = false;
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox1.Focus();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (review_chkpass(pk, TextBox1.Text) == true)
        {
            Image1.Visible = true;
            Label11.Visible = false;
            Label14.Visible = false;
            if (checklength(TextBox2.Text, 6) == true)
            {
                Label12.ForeColor = Color.Gray;
                if (TextBox2.Text.Equals(TextBox3.Text) == true)
                {
                    Label13.Visible = false;
                    review_pass(pk, TextBox2.Text);
                    Label14.Visible = true;
                }
                else
                    Label13.Visible = true;
            }
            else
                Label12.ForeColor = Color.Red;
        }
        else
            Label11.Visible = true;
    }
    void review_pass(string pk, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("update REVIEWER_MASTER set rpassword='" + pass + "' where revid='" + pk + "'", con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("review_setpass() : " + ex.Message);
        }
    }
    bool checklength(string s, int n)
    {
        if (s.Length < n)
            return false;
        else
            return true;
    }
    bool review_chkpass(string pk, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from REVIEWER_MASTER where revid='" + pk + "' and rpassword='" + pass + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
                return true;
            else
                return false;
        }
        catch (Exception ex)
        {
            Response.Write("review_chkpass() : " + ex.Message);
            return false;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("review_profile.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class admin_setpass : System.Web.UI.Page
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
        if (admin_chkpass(pk, TextBox1.Text) == true)
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
                    admin_setpassword(pk, TextBox2.Text);
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
    void admin_setpassword(string pk, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("update ADMINISTRATOR_MASTER set adminpass ='" + pass + "' where adminid ='" + pk + "'", con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("admin_setpass() : " + ex.Message);
        }
    }
    bool checklength(string s, int n)
    {
        if (s.Length < n)
            return false;
        else
            return true;
    }
    bool admin_chkpass(string pk, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from ADMINISTRATOR_MASTER where adminid ='" + pk + "' and adminpass ='" + pass + "'", con);
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
            Response.Write("admin_chkpass() : " + ex.Message);
            return false;
        }
    }
}
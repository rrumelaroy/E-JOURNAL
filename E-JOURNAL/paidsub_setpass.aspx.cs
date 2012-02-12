using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class paidsub_setpass : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    string type, pk;
    protected void Page_Load(object sender, EventArgs e)
    {
        type = Session["type"].ToString();
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
        if (type == "freesubscriber")
        {
            if (fsub_chkpass(pk, TextBox1.Text) == true)
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
                        fsub_setpass(pk, TextBox2.Text);
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
        else if (type == "author")
        {
            if (author_chkpass(pk, TextBox1.Text) == true)
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
                        author_setpass(pk, TextBox2.Text);
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
        else if (type == "paidsubscriber")
        {
            if (paidsub_chkpass(pk, TextBox1.Text) == true)
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
                        psub_setpass(pk, TextBox2.Text);
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
    }
    void fsub_setpass(string pk, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("update FREE_SUBSCRIBER_MASTER set fpassword='" + pass + "' where fsubid='" + pk + "'", con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("fsub_setpass() : " + ex.Message);
        }
    }
    void author_setpass(string pk, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("update AUTHOR_MASTER set apassword='" + pass + "' where authid='" + pk + "'", con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("author_setpass() : " + ex.Message);
        }
    }
    void psub_setpass(string pk, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("update PAID_SUBSCRIBER_MASTER set ppassword='" + pass + "' where psubid='" + pk + "'", con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("paidsub_setpass() : " + ex.Message);
        }
    }
    bool checklength(string s, int n)
    {
        if (s.Length < n)
            return false;
        else
            return true;
    }
    bool fsub_chkpass(string pk, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from FREE_SUBSCRIBER_MASTER where fsubid='" + pk + "' and fpassword='" + pass + "'", con);
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
            Response.Write("fsub_chkpass() : " + ex.Message);
            return false;
        }
    }
    bool author_chkpass(string pk, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from AUTHOR_MASTER where authid='" + pk + "' and apassword='" + pass + "'", con);
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
            Response.Write("author_chkpass() : " + ex.Message);
            return false;
        }
    }
    bool paidsub_chkpass(string pk, string pass)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from PAID_SUBSCRIBER_MASTER where psubid='" + pk + "' and ppassword='" + pass + "'", con);
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
            Response.Write("paidsub_chkpass() : " + ex.Message);
            return false;
        }
    }
}
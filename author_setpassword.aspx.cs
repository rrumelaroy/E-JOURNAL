﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;

public partial class author_setpass : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    string type, pk;
    protected void Page_Load(object sender, EventArgs e)
    {
        type = Session["type"].ToString();
        pk = Session["pk"].ToString();
    }
    protected void Button1_Click(object sender, EventArgs e)
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
                    setpass(pk, TextBox2.Text);
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
    bool checklength(string s, int n)
    {
        if (s.Length < n)
            return false;
        else
            return true;
    }
    void setpass(string pk, string pass)
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
}
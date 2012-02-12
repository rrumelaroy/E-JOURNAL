using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;

public partial class admin_processreviewed2 : System.Web.UI.Page
{
    List<string> lst = new List<string>();
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void desclick(object sender, EventArgs e)
    {
        LinkButton c = (LinkButton)sender;
        HiddenField1.Value = c.ValidationGroup;
        div1.Visible = true;
        LinkButton1.Focus();
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_processreviewed2.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Label3.Visible = true;
            TextBox1.Focus();
        }
        else
        {
            Label3.Visible = false;
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE PAPER_MASTER SET paperstatus = 'rejected', adminremark = @adminremark WHERE paperid = '" + HiddenField1.Value + "'", con);
            cmd.Parameters.AddWithValue("@adminremark", TextBox1.Text);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("rejected paper : " + ex.Message);
            }
            con.Close();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("SELECT feedbackid FROM PAPER_REVIEWING_DETAIL WHERE NOT papreviewstatus = 'evaluated' AND paperid = '" + HiddenField1.Value + "'", con);
            SqlDataReader dr = cmd1.ExecuteReader();
            lst.Clear();
            try
            {
                while (dr.Read())
                {
                    lst.Add(dr[0].ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write("STORE FEEDBACKID : " + ex.Message);
            }
            con.Close();
            foreach (string s in lst)
                update_papreview(s);
            Response.Redirect("admin_processreviewed2.aspx");
        }
    }
    void update_papreview(string feedback)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("UPDATE PAPER_REVIEWING_DETAIL SET papreviewstatus = 'evaluated' WHERE feedbackid = '" + feedback + "'", con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("update paper_reviewing : " + ex.Message);
        }
        con.Close();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Label3.Visible = true;
            TextBox1.Focus();
        }
        else
        {
            Label3.Visible = false;
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE PAPER_MASTER SET paperstatus = 'sent for correction', adminremark = @adminremark WHERE paperid = '" + HiddenField1.Value + "'", con);
            cmd.Parameters.AddWithValue("@adminremark", TextBox1.Text);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("sent for correction paper : " + ex.Message);
            }
            con.Close();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("SELECT feedbackid FROM PAPER_REVIEWING_DETAIL WHERE NOT papreviewstatus = 'evaluated' AND paperid = '" + HiddenField1.Value + "'", con);
            SqlDataReader dr = cmd1.ExecuteReader();
            lst.Clear();
            try
            {
                while (dr.Read())
                {
                    lst.Add(dr[0].ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write("STORE FEEDBACKID : " + ex.Message);
            }
            con.Close();
            foreach (string s in lst)
                update_papreview(s);
            Response.Redirect("admin_processreviewed2.aspx");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Trim() == "")
        {
            Label3.Visible = true;
            TextBox1.Focus();
        }
        else
        {
            Label3.Visible = false;
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE PAPER_MASTER SET paperstatus = 'pending', adminremark = @adminremark WHERE paperid = '" + HiddenField1.Value + "'", con);
            cmd.Parameters.AddWithValue("@adminremark", TextBox1.Text);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("accept paper : " + ex.Message);
            }
            con.Close();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("SELECT feedbackid FROM PAPER_REVIEWING_DETAIL WHERE NOT papreviewstatus = 'evaluated' AND paperid = '" + HiddenField1.Value + "'", con);
            SqlDataReader dr = cmd1.ExecuteReader();
            lst.Clear();
            try
            {
                while (dr.Read())
                {
                    lst.Add(dr[0].ToString());
                }
            }
            catch (Exception ex)
            {
                Response.Write("STORE FEEDBACKID : " + ex.Message);
            }
            con.Close();
            foreach (string s in lst)
            {

                update_papreview(s);
            }
            Response.Redirect("admin_processreviewed2.aspx");
        }
    }
}
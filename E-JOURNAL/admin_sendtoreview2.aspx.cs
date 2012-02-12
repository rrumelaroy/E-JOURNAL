using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class admin_sendtoreview2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void desclick(object sender, EventArgs e)
    {
        LinkButton c = (LinkButton)sender;
        HiddenField1.Value = c.ValidationGroup;
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT subjarea FROM PAPER_MASTER WHERE paperid = '" + HiddenField1.Value + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                HiddenField2.Value = dr[0].ToString();
            }
        }
        catch (Exception ex)
        {
            Response.Write("GO FOR REVIEW : " + ex.Message);
        }
        con.Close();
        Session.Add("journal", HiddenField1.Value);
        div1.Visible = true;
        LinkButton1.Focus();
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_sendtoreview2.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        div2.Visible = true;
        TextBox1.Focus();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (CheckBoxList1.Items.Count == 0)
        {
            Label6.Text = "No reviewer available to select";
            Label6.ForeColor = Color.Red;
        }
        else
        {
            bool ok = false;
            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                    ok = true;
            }
            if (ok == false)
            {
                Label6.Text = "( Select at least 1 reviewer )";
                Label6.ForeColor = Color.Red;
            }
            else
            {
                Label6.Text = "( Select at least 1 reviewer )";
                Label6.ForeColor = Color.Gray;
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    if (CheckBoxList1.Items[i].Selected)
                    {
                        Random rnd = new Random();
                        string feedbackid = "";
                        do
                        {
                            feedbackid = generateid("feed" + rnd.Next(1, 99999).ToString());
                        } while (feedbackid == "");
                        con.Close();
                        con.Open();
                        SqlCommand cmd = new SqlCommand("UPDATE PAPER_MASTER SET paperstatus = 'rereviewing' WHERE paperid = '" + HiddenField1.Value + "'", con);
                        try
                        {
                            cmd.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            Response.Write("UPDATE PAPER_MASTER : " + ex.Message);
                        }
                        addfeedback(feedbackid, HiddenField1.Value, CheckBoxList1.Items[i].Value);
                    }
                }
                Response.Redirect("admin_sendtoreview2.aspx");
            }
        }
    }
    void addfeedback(string feedid, string paper, string reviewer)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO PAPER_REVIEWING_DETAIL VALUES (@feedbackid, @paperid, @revid, @datereview, @papreviewstatus)", con);
        cmd.Parameters.AddWithValue("@feedbackid", feedid);
        cmd.Parameters.AddWithValue("@paperid", paper);
        cmd.Parameters.AddWithValue("@revid", reviewer);
        cmd.Parameters.AddWithValue("@datereview", DateTime.Now);
        cmd.Parameters.AddWithValue("@papreviewstatus", "not reviewed");
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("INSERT PAPER_REVIEWING : " + ex.Message);
        }
    }
    string generateid(string id)
    {
        con.Close();
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from PAPER_REVIEWING_DETAIL where feedbackid ='" + id + "'", con);
            SqlDataReader dr1 = cmd.ExecuteReader();
            if (dr1.Read())
                return "";
            else
                return id;
        }
        catch (Exception ex)
        {
            Response.Write("generateid() :" + ex.Message);
            return "";
        }
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_sendtoreview2.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text.Trim() == "")
            Label8.Visible = true;
        else
        {
            Label8.Visible = false;
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE PAPER_MASTER SET adminremark = @adminremark, paperstatus = 'rejected' WHERE paperid = '" + HiddenField1.Value + "'", con);
            cmd.Parameters.AddWithValue("@adminremark", TextBox1.Text);
            try
            {
                cmd.ExecuteNonQuery();
                Response.Redirect("admin_sendtoreview2.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("REJECT PAPER " + ex.Message);
            }
        }
    }
    
}
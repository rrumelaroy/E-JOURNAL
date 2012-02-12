using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class author_home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string pk = Session["pk"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT atitle, afirstname, asurname, astartdate FROM AUTHOR_MASTER where authid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Label1.Text = "Welcome " + dr[0].ToString() + " " + dr[1].ToString() + " " + dr[2].ToString();
                Label2.Text = "Account Activation Date : " + Convert.ToDateTime(dr[3].ToString()).ToString("dd-MM-yyyy");
            }
        }
        catch (Exception ex)
        {
            Response.Write("welcome msg : " + ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM PAPER_MASTER WHERE authid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
            {
                if (Convert.ToInt32(dr1[0].ToString()) == 0)
                {
                    Label l = new Label();
                    l.Text = "You have not submitted a single journal till date.";
                    HyperLink h = new HyperLink();
                    h.Text = "Click Here";
                    h.ForeColor = Color.Blue;
                    h.NavigateUrl = "author_loadjournal.aspx";
                    Label l1 = new Label();
                    l1.Text = " to submit your first journal.";
                    div1.Controls.Add(l);
                    div1.Controls.Add(h);
                    div1.Controls.Add(l1);
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM PAPER_MASTER WHERE paperstatus = 'sent for correction' AND authid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr2 = cmd2.ExecuteReader();
            if (dr2.Read())
            {
                if (Convert.ToInt32(dr2[0].ToString()) > 0)
                {
                    Label l2 = new Label();
                    l2.Text = "You have been asked to correct " + dr2[0].ToString() + " number of journal(s).";
                    HyperLink h1 = new HyperLink();
                    h1.Text = "Click Here";
                    h1.ForeColor = Color.Blue;
                    h1.NavigateUrl = "author_correctjournal.aspx";
                    Label l3 = new Label();
                    l3.Text = " to correct them now.";
                    div1.Controls.Add(l2);
                    div1.Controls.Add(h1);
                    div1.Controls.Add(l3);
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        con.Close();
    }
    
}
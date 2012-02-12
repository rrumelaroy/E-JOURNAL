using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class review_home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string pk = Session["pk"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT rtitle, rfirstname, rsurname, rareacheck FROM REVIEWER_MASTER where revid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Label1.Text = "Welcome " + dr[0].ToString() + " " + dr[1].ToString() + " " + dr[2].ToString();
                Label2.Text = "Your Subject Area is " + dr[3].ToString();
            }
        }
        catch (Exception ex)
        {
            Response.Write("welcome msg : " + ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM PAPER_REVIEWING_DETAIL WHERE papreviewstatus = 'not reviewed' AND revid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
            {
                if (Convert.ToInt32(dr1[0].ToString()) > 0)
                {
                    Label l = new Label();
                    l.Text = "You have been asked to give feedback on " + dr1[0].ToString() + " number of journal(s). ";
                    HyperLink h = new HyperLink();
                    h.Text = "Click Here";
                    h.ForeColor = Color.Blue;
                    h.NavigateUrl = "reviewer_feedback.aspx";
                    Label l1 = new Label();
                    l1.Text = " to fill and submit feedback on them.";
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
    }
}
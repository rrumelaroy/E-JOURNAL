using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class admin_home : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM PAID_SUBSCRIBER_MASTER p, PAID_SUBSCRIBER_DRAFT_MASTER d, SCHEME_MASTER s WHERE d.pschemeid = s.schemeid AND d.pddstatus = 'pending' AND p.pactivedate IS NULL AND p.psubid = d.psubid", con);
        SqlDataReader dr = cmd.ExecuteReader();
        try
        {
            if (dr.Read())
            {
                if (Convert.ToInt32(dr[0].ToString()) > 0)
                {
                    Label l = new Label();
                    l.Text = "You have recieved " + dr[0].ToString() + " new Paid Subscriber Account request(s). ";
                    HyperLink h = new HyperLink();
                    h.Text = "Click Here";
                    h.ForeColor = Color.Blue;
                    h.NavigateUrl = "admin_newpaid.aspx";
                    Label l1 = new Label();
                    l1.Text = " to process their request.";
                    div1.Controls.Add(l);
                    div1.Controls.Add(h);
                    div1.Controls.Add(l1);
                    div1.Controls.Add(new LiteralControl("<br />"));
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("new paid subscriber " + ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM [AUTHOR_MASTER] WHERE ([astartdate] IS NULL)", con);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        try
        {
            if (dr1.Read())
            {
                if (Convert.ToInt32(dr1[0].ToString()) > 0)
                {
                    Label l2 = new Label();
                    l2.Text = "You have recieved " + dr1[0].ToString() + " new Author Account request(s). ";
                    HyperLink h1 = new HyperLink();
                    h1.Text = "Click Here";
                    h1.ForeColor = Color.Blue;
                    h1.NavigateUrl = "admin_newauthor.aspx";
                    Label l3 = new Label();
                    l3.Text = " to process their request.";
                    div1.Controls.Add(l2);
                    div1.Controls.Add(h1);
                    div1.Controls.Add(l3);
                    div1.Controls.Add(new LiteralControl("<br />"));
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("new author" + ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM PAID_SUBSCRIBER_MASTER p, PAID_SUBSCRIBER_DRAFT_MASTER d, SCHEME_MASTER s WHERE d.pschemeid = s.schemeid AND d.pddstatus = 'pending' AND p.pactivedate IS NOT NULL AND p.psubid = d.psubid AND pacctype = 'True'", con);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        try
        {
            if (dr2.Read())
            {
                if (Convert.ToInt32(dr2[0].ToString()) > 0)
                {
                    Label l4 = new Label();
                    l4.Text = "You have recieved " + dr2[0].ToString() + " request(s) for renewing Paid Subscriber Account(s). ";
                    HyperLink h2 = new HyperLink();
                    h2.Text = "Click Here";
                    h2.ForeColor = Color.Blue;
                    h2.NavigateUrl = "admin_renewsub.aspx";
                    Label l5 = new Label();
                    l5.Text = " to process their request.";
                    div1.Controls.Add(l4);
                    div1.Controls.Add(h2);
                    div1.Controls.Add(l5);
                    div1.Controls.Add(new LiteralControl("<br />"));
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("renew" + ex.Message);
        }
        con.Close();
        div1.Controls.Add(new LiteralControl("<br />"));
        review_job();
        con.Open();
        SqlCommand cmd4 = new SqlCommand("SELECT COUNT(*) FROM PAPER_MASTER p, AUTHOR_MASTER a WHERE p.authid = a.authid AND p.paperstatus = 'resubmitted'", con);
        SqlDataReader dr4 = cmd4.ExecuteReader();
        try
        {
            if (dr4.Read())
            {
                if (Convert.ToInt32(dr4[0].ToString()) > 0)
                {
                    Label l8 = new Label();
                    l8.Text = "You have recieved " + dr4[0].ToString() + " request(s) for sending journal(s) for re-reviewing. ";
                    HyperLink h4 = new HyperLink();
                    h4.Text = "Click Here";
                    h4.ForeColor = Color.Blue;
                    h4.NavigateUrl = "admin_sendtoreview2.aspx";
                    Label l9 = new Label();
                    l9.Text = " to process the request(s).";
                    div1.Controls.Add(l8);
                    div1.Controls.Add(h4);
                    div1.Controls.Add(l9);
                    div1.Controls.Add(new LiteralControl("<br />"));
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("re-reviewing" + ex.Message);
        }
        con.Close();
        int count = 0;
        con.Open();
        SqlCommand cmd5 = new SqlCommand("SELECT DISTINCT r.paperid, p.papertitle, p.subjarea, a.afirstname, COUNT(r.paperid) AS Expr1, DATEDIFF(day, r.datereview, { fn CURDATE() }) AS DATE1 FROM PAPER_REVIEWING_DETAIL AS r INNER JOIN PAPER_MASTER AS p ON r.paperid = p.paperid INNER JOIN AUTHOR_MASTER AS a ON p.authid = a.authid WHERE (NOT (r.papreviewstatus = 'evaluated')) AND (p.paperstatus = 'reviewing') GROUP BY r.paperid, p.papertitle, p.subjarea, a.afirstname, r.datereview", con);
        SqlDataReader dr5 = cmd5.ExecuteReader();
        try
        {
            while (dr5.Read())
            {
                count++;
            }
                if (count > 0)
                {
                    Label l10 = new Label();
                    l10.Text = "" + count + " number of journal(s) are waiting for your decision. ";
                    HyperLink h5 = new HyperLink();
                    h5.Text = "Click Here";
                    h5.ForeColor = Color.Blue;
                    h5.NavigateUrl = "admin_processreviewed1.aspx";
                    Label l11 = new Label();
                    l11.Text = " to assess the reviewer's feedback and give your decision.";
                    div1.Controls.Add(l10);
                    div1.Controls.Add(h5);
                    div1.Controls.Add(l11);
                    div1.Controls.Add(new LiteralControl("<br />"));
                }
            
        }
        catch (Exception ex)
        {
            Response.Write("process - reviewed " + ex.Message);
        }
        con.Close();
        count = 0;
        con.Open();
        SqlCommand cmd6 = new SqlCommand("SELECT DISTINCT r.paperid, p.papertitle, p.subjarea, a.afirstname, COUNT(r.paperid) AS Expr1, DATEDIFF(day, r.datereview, { fn CURDATE() }) AS DATE1 FROM PAPER_REVIEWING_DETAIL AS r INNER JOIN PAPER_MASTER AS p ON r.paperid = p.paperid INNER JOIN AUTHOR_MASTER AS a ON p.authid = a.authid WHERE (NOT (r.papreviewstatus = 'evaluated')) AND (p.paperstatus = 'rereviewing') GROUP BY r.paperid, p.papertitle, p.subjarea, a.afirstname, r.datereview", con);
        SqlDataReader dr6 = cmd6.ExecuteReader();
        try
        {
            while (dr6.Read())
            {
                count++;
            }
            if (count > 0)
            {
                Label l12 = new Label();
                l12.Text = "" + count + " number of journal(s) were sent for re-reviewing. ";
                HyperLink h6 = new HyperLink();
                h6.Text = "Click Here";
                h6.ForeColor = Color.Blue;
                h6.NavigateUrl = "admin_processreviewed2.aspx";
                Label l13 = new Label();
                l13.Text = " to assess the reviewer's feedback and give your decision.";
                div1.Controls.Add(l12);
                div1.Controls.Add(h6);
                div1.Controls.Add(l13);
                div1.Controls.Add(new LiteralControl("<br />"));
            }

        }
        catch (Exception ex)
        {
            Response.Write("process - reviewed " + ex.Message);
        }
        con.Close();
        div1.Controls.Add(new LiteralControl("<br />"));
        con.Open();
        SqlCommand cmd7 = new SqlCommand("SELECT COUNT(*) FROM [VIEWER_FEEDBACK_MASTER] WHERE ([vanstype] = @vanstype)", con);
        cmd7.Parameters.AddWithValue("@vanstype", false);
        SqlDataReader dr7 = cmd7.ExecuteReader();
        try
        {
            if (dr7.Read())
            {
                if (Convert.ToInt32(dr7[0].ToString()) > 0)
                {
                    Label l14 = new Label();
                    l14.Text = "You have recieved " + dr7[0].ToString() + " number of viewer's feedback(s). ";
                    HyperLink h7 = new HyperLink();
                    h7.Text = "Click Here";
                    h7.ForeColor = Color.Blue;
                    h7.NavigateUrl = "admin_viewfeedback.aspx";
                    Label l15 = new Label();
                    l15.Text = " give response to those feedback(s).";
                    div1.Controls.Add(l14);
                    div1.Controls.Add(h7);
                    div1.Controls.Add(l15);
                    div1.Controls.Add(new LiteralControl("<br />"));
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("process - reviewed " + ex.Message);
        }
        con.Close();
    }
    void review_job()
    {
        con.Open();
        SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) FROM PAPER_MASTER p, AUTHOR_MASTER a WHERE p.authid = a.authid AND p.paperstatus = 'submitted'", con);
        SqlDataReader dr3 = cmd3.ExecuteReader();
        try
        {
            if (dr3.Read())
            {
                if (Convert.ToInt32(dr3[0].ToString()) > 0)
                {
                    Label l6 = new Label();
                    l6.Text = "You have recieved " + dr3[0].ToString() + " request(s) for sending journal(s) for reviewing. ";
                    HyperLink h3 = new HyperLink();
                    h3.Text = "Click Here";
                    h3.ForeColor = Color.Blue;
                    h3.NavigateUrl = "admin_sendtoreview1.aspx";
                    Label l7 = new Label();
                    l7.Text = " to process the request(s).";
                    div1.Controls.Add(l6);
                    div1.Controls.Add(h3);
                    div1.Controls.Add(l7);
                    div1.Controls.Add(new LiteralControl("<br />"));
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("reviewing" + ex.Message);
        }
        con.Close();
    }
}
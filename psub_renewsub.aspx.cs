using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class psub_renewsub : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    string pk;
    protected void Page_Load(object sender, EventArgs e)
    {
        pk = Session["pk"].ToString();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM PAID_SUBSCRIBER_MASTER WHERE DATEDIFF(day,GETDATE(),pdeactivedate) > 7 AND pacctype = 'True' AND psubid = '" + pk + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        try
        {
            if (dr.Read())
                Label2.Text = "Sorry, You are allowed to subscribe before 7 days of account deactivation - date.";
            else
                Label2.Text = "";
        }
        catch (Exception ex)
        {
            Response.Write("CHECKING DATE " + ex.Message);
        }
        con.Close();
        TextBox3.Text = DateTime.Now.ToString("dd-MM-yyyy");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox3.Text = Calendar1.SelectedDate.ToString("dd-MM-yyyy");
        Calendar1.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("psub_renewsub.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool ok = true;
        if (Label2.Text != "")
            ok = false;
        if (TextBox2.Text == "")
        {
            Label3.Visible = true;
            ok = false;
        }
        else
            Label3.Visible = false;
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM PAID_SUBSCRIBER_DRAFT_MASTER WHERE pddstatus = 'pending' AND psubid = '" + pk + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        try
        {
            if (dr.Read())
            {
                ok = false;
                Label4.ForeColor = Color.Red;
                Label4.Text = "A Subscription is already been applied.";
            }
            else
                Label4.Text = "";
        }
        catch (Exception ex)
        {
            Response.Write("CHECK EXISTING SUBSCRIPTION : " + ex.Message);
        }
        con.Close();
        if (ok == true)
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("INSERT INTO PAID_SUBSCRIBER_DRAFT_MASTER VALUES (@psubid, @psubmitdate, @pschemeid, @pddnumber, @pddbank, @pddmakedate, @pddstatus)", con);
            cmd1.Parameters.AddWithValue("@psubid",pk);
            cmd1.Parameters.AddWithValue("@psubmitdate",DateTime.Now);
            cmd1.Parameters.AddWithValue("@pschemeid",DropDownList1.SelectedValue);
            cmd1.Parameters.AddWithValue("@pddnumber",TextBox1.Text);
            cmd1.Parameters.AddWithValue("@pddbank",TextBox2.Text);
            cmd1.Parameters.AddWithValue("@pddmakedate",Convert.ToDateTime(TextBox3.Text));
            cmd1.Parameters.AddWithValue("@pddstatus", "pending");
            try
            {
                cmd1.ExecuteNonQuery();
                Label4.ForeColor = Color.Green;
                Label4.Text = "Your Application for Subscription has been sent successfully.";
            }
            catch (Exception ex)
            {
                Response.Write("APPLY SUBSCRIPTION : " + ex.Message);
            }
        }
    }
}
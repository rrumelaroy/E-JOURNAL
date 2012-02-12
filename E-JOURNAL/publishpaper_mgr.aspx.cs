using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class publishpaper_mgr : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void OnCheckChangedEvent1(object sender, EventArgs e)
    {
        CheckBox c = (CheckBox)sender;
        string pid = c.ValidationGroup;
        HiddenField1.Value = pid;
        div2.Visible = true;
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("publishpaper_mgr.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM PAPER_PUBLISH_DETAIL WHERE paperid = '" + HiddenField1.Value + "'", con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("DELETE ENTRY : " + ex.Message);
        }
        con.Close();
        con.Open();
        SqlCommand cmd1 = new SqlCommand("UPDATE PAPER_MASTER SET paperstatus = 'pending' WHERE paperid = '" + HiddenField1.Value + "'", con);
        try
        {
            cmd1.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("UPDATE ENTRY : " + ex.Message);
        }
        Response.Redirect("publishpaper_mgr.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        div3.Visible = true;
        DropDownList1.Focus();
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("publishpaper_mgr.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        bool ok = true;
        DateTime dt = new DateTime(DateTime.Now.AddMonths(1).Year, DateTime.Now.AddMonths(1).Month, 1);
        DateTime dt2 = new DateTime(Convert.ToInt32(DropDownList2.SelectedValue), Convert.ToInt32(DropDownList1.SelectedValue), 1);
        if (dt2.CompareTo(dt) >= 0) ;
        else
        {
            Label3.ForeColor = Color.Red;
            Label3.Text = "Invalid Month and year";
            ok = false;
        }
        if (checkspace(dt2.Month, dt2.Year) == false)
        {
            ok = false;
            Label3.ForeColor = Color.Red;
            Label3.Text = "Sorry, No vaccancy left for publishing in this issue.";
        }
        if (ok == true)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE PAPER_PUBLISH_DETAIL SET publish_date = @publish_date WHERE paperid = '" + HiddenField1.Value + "'", con);
            cmd.Parameters.AddWithValue("@publish_date", dt2);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("UPDATE PUBLISHING DETAIL : " + ex.Message);
            }
            con.Close();
            Label3.ForeColor = Color.Green;
            Label3.Text = "The Paper is being published successfully.";
        }
    }
    public bool checkspace(int month, int year)
    {
        bool ok = false;
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM PAPER_PUBLISH_DETAIL WHERE DATEPART(month,publish_date) = @a AND DATEPART(year,publish_date) = @b", con);
        cmd.Parameters.AddWithValue("@a", month);
        cmd.Parameters.AddWithValue("@b", year);
        SqlDataReader dr = cmd.ExecuteReader();
        try
        {
            if (dr.VisibleFieldCount < 10)
                ok = true;
        }
        catch (Exception ex)
        {
            Response.Write("ROW COUNT : " + ex.Message);
        }
        con.Close();
        return ok;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class pendingpaper_mgr : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void OnCheckChangedEvent(object sender, EventArgs e)
    {
        CheckBox c = (CheckBox)sender;
        string pid = c.ValidationGroup;
        HiddenField1.Value = pid;
        div2.Visible = true;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("pendingpaper_mgr.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        bool ok = true;
        //DateTime dt = new DateTime(DateTime.Now.AddMonths(1).Year, DateTime.Now.AddMonths(1).Month, 1);
        DateTime dt = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
        DateTime dt2 = new DateTime(Convert.ToInt32(DropDownList2.SelectedValue), Convert.ToInt32(DropDownList1.SelectedValue), 1);
        if (dt2.CompareTo(dt) >= 0);
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
            SqlCommand cmd = new SqlCommand("INSERT INTO PAPER_PUBLISH_DETAIL VALUES(@paperid, @publish_date,0,0,0)", con);
            cmd.Parameters.AddWithValue("@paperid", HiddenField1.Value);
            cmd.Parameters.AddWithValue("@publish_date", dt2);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("INSERT PUBLISHING DETAIL : " + ex.Message);
            }
            con.Close();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("UPDATE PAPER_MASTER SET paperstatus = 'published' WHERE paperid = '" + HiddenField1.Value + "'", con);
            try
            {
                cmd1.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("UPDATE PAPER_MASTER : " + ex.Message);
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
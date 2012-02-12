using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = Session["type"].ToString();
        string pk = Session["pk"].ToString();
        if (type == "freesubscriber")
            logout_freesub(pk);
        else
            Response.Redirect("djm_home.aspx");
    }
    void logout_freesub(string pk)
    {
        int num = ret_fsubvisit(pk);
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("update FREE_SUBSCRIBER_MASTER set fnumvisit = @num where fsubid='" + pk + "'", con);
        SqlCommand cmd1 = new SqlCommand("update FREE_SUBSCRIBER_MASTER set flastvisit = @visit where fsubid='" + pk + "'", con);
        cmd.Parameters.AddWithValue("@num", num);
        cmd1.Parameters.AddWithValue("@visit", DateTime.Now);
        try
        {
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            con.Close();
            Response.Redirect("djm_home.aspx");
        }
        catch(Exception ex)
        {
            Response.Write("logout_freesub() : "+ex.Message);
        }
    }
    int ret_fsubvisit(string pk)
    {
        con.Close();
        con.Open();
        int num=0;
        SqlCommand cmd2 = new SqlCommand("select fnumvisit from FREE_SUBSCRIBER_MASTER where fsubid='" + pk + "'", con);
        try
        {
            SqlDataReader dr = cmd2.ExecuteReader();
            if (dr.Read())
                num=Convert.ToInt32(dr[0].ToString()) + 1;
            else
                Response.Write("Primary Key does not exists.");
            return num;
        }
        catch (Exception ex)
        {
            Response.Write("retfsubvisit() : " + ex.Message);
            return num;
        }

    }
}
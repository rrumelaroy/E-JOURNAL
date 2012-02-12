using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    string pk, type;
    protected void Page_Load(object sender, EventArgs e)
    {
        //con.Open();
        if (type == "freesubscriber")
            callfreesub(pk);
        else
            callpaidsub(pk);
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        pk = Session["pk"].ToString();
        type = Session["type"].ToString();
        if (type == "paidsubscriber")
            this.MasterPageFile = "paid_subs_master.master";
        else
            this.MasterPageFile = "free_subs_master.master";
    }
    void callfreesub(string pk)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select floginname, fnumvisit, flastvisit from FREE_SUBSCRIBER_MASTER where fsubid='"+pk+"'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Label1.Text = "Welcome  " + dr[0].ToString();
                Label2.Text = "Number of Visit(s) : " + dr[1].ToString();
                Label3.Text = "Date of Last Visit : " + Convert.ToDateTime(dr[2].ToString()).ToString("dd-MM-yyyy") ;
            }
            else
                Response.Write("Record does not exist.");
        }
        catch (Exception ex)
        {
            Response.Write("callfreesub() :" + ex.Message);
        }
    }
    void callpaidsub(string pk)
    {
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("select ptitle, pfirstname, psurname, pactivedate, pdeactivedate from PAID_SUBSCRIBER_MASTER where psubid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Label1.Text = "Welcome  " + dr[0].ToString() + " " + dr[1].ToString() + " "+ dr[2].ToString();
                Label2.Text = "Account Activation Date : " + Convert.ToDateTime(dr[3].ToString()).ToString("dd-MM-yyyy");
                Label3.Text = "Account Deactivation Date : " + Convert.ToDateTime(dr[4].ToString()).ToString("dd-MM-yyyy");
            }
            else
                Response.Write("Record does not exist.");
        }
        catch (Exception ex)
        {
            Response.Write("callpaidsub() :" + ex.Message);
        }
    }
}
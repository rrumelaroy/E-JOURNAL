using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_addscheme : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        bool ok = true;
        if (TextBox1.Text == "")
        {
            ok = false;
            Label1.Visible = true;
        }
        if (TextBox2.Text == "")
        {
            ok = false;
            Label4.Visible = true;
        }
        if (ok == true)
        {
            Label1.Visible = false;
            Label4.Visible = false;
            Random rnd = new Random();
            string schemeid = "";
            do
            {
                schemeid = generateid("sch" + rnd.Next(0, 99).ToString());
            } while (schemeid == "");
            con.Close();
            con.Open();
            SqlCommand cmd=new SqlCommand("INSERT INTO SCHEME_MASTER VALUES (@schemeid, @schduration, @schdescription, @schamount)",con);
            cmd.Parameters.AddWithValue("@schemeid",schemeid);
            cmd.Parameters.AddWithValue("@schduration",DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@schdescription",TextBox1.Text);
            cmd.Parameters.AddWithValue("@schamount",TextBox2.Text);
            try
            {
                cmd.ExecuteNonQuery();
                Response.Redirect("admin_addscheme.aspx");
            }
            catch(Exception ex)
            {
                Response.Write("ADD SCHEME: "+ex.Message);
            }
        }
    }
    string generateid(string id)
    {
        con.Close();
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from SCHEME_MASTER where schemeid='" + id + "'", con);
            SqlDataReader dr1 = cmd.ExecuteReader();
            if (dr1.Read())
                return "";
            else
                return id;
        }
        catch (Exception ex)
        {
            Response.Write("CHECK SCHEMEID : " + ex.Message);
            return "";
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        DropDownList1.SelectedIndex = 0;
        Label1.Visible = false;
        Label4.Visible = false;
        TextBox1.Focus();
    }
}
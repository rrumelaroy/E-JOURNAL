using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_modscheme : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        modform.Visible = false;
    }
    protected void desclick(object sender, EventArgs e)
    {
        LinkButton l = (LinkButton)sender;
        string pk = l.ValidationGroup;
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM SCHEME_MASTER WHERE schemeid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                HiddenField1.Value = dr[0].ToString();
                TextBox1.Text = dr[2].ToString();
                DropDownList1.SelectedValue = dr[1].ToString();
                TextBox2.Text = dr[3].ToString();
                modform.Visible = true;
                TextBox1.Focus();
            }
        }
        catch (Exception ex)
        {
            Response.Write("DISPLAY DATA : " + ex.Message);
        }
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
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE SCHEME_MASTER SET schduration = @schduration, schdescription = @schdescription, schamount = @schamount WHERE schemeid = '" + HiddenField1.Value + "'", con);
            cmd.Parameters.AddWithValue("@schduration", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@schdescription", TextBox1.Text);
            cmd.Parameters.AddWithValue("@schamount", TextBox2.Text);
            try
            {
                cmd.ExecuteNonQuery();
                Response.Redirect("admin_modscheme.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("UPDATING SCHEME : " + ex.Message);
            }
        }
        else
            TextBox1.Focus();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_modscheme.aspx");
    }
}
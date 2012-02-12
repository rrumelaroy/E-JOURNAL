using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_modsubject : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        modform.Visible = false;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_modsubject.aspx");
    }
    protected void desclick(object sender, EventArgs e)
    {
        LinkButton l = (LinkButton)sender;
        string pk = l.ValidationGroup;
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM SUBJECT_MASTER WHERE subjid = '" + pk + "'", con);
        try
        {
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                HiddenField1.Value = dr[0].ToString();
                TextBox1.Text = dr[1].ToString();
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
            Label1.Text = "cannot be empty";
        }
        else
        {
            con.Open();
            string name = "";
            SqlCommand cmd = new SqlCommand("SELECT subjname FROM SUBJECT_MASTER", con);
            try
            {
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    name = dr[0].ToString();
                    if (name.ToLower().Equals(TextBox1.Text.ToLower()) == true)
                    {
                        ok = false;
                        Label1.Text = "Already Present in the list.";
                        break;

                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("check subject :" + ex.Message);
            }
            con.Close();
        }
        if (ok == true)
        {
            con.Close();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("UPDATE SUBJECT_MASTER SET subjname = @subjname WHERE subjid = '" + HiddenField1.Value + "'", con);
            cmd1.Parameters.AddWithValue("@subjname", TextBox1.Text);
            try
            {
                cmd1.ExecuteNonQuery();
                Response.Redirect("admin_modsubject.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("MODIFYING SUBJECT : " + ex.Message);
            }
        }
        else
            TextBox1.Focus();
    }
}
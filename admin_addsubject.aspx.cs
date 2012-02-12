using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_addsubject : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("admin_addsubject.aspx");
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
            con.Close();
            con.Open();
            string name="";
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
        }
        if (ok == true)
        {
            Random rnd = new Random();
            string subjid = "";
            do
            {
                subjid = generateid("subj" + rnd.Next(0, 99).ToString());
            } while (subjid == "");
            con.Close();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("INSERT INTO SUBJECT_MASTER VALUES (@subjid, @subjname)", con);
            cmd1.Parameters.AddWithValue("@subjid", subjid);
            cmd1.Parameters.AddWithValue("@subjname", TextBox1.Text);
            try
            {
                cmd1.ExecuteNonQuery();
                Response.Redirect("admin_addsubject.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("ADDING SUBJECT : " + ex.Message);
            }
        }
    }
    string generateid(string id)
    {
        con.Close();
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from SUBJECT_MASTER where subjid ='" + id + "'", con);
            SqlDataReader dr1 = cmd.ExecuteReader();
            if (dr1.Read())
                return "";
            else
                return id;
        }
        catch (Exception ex)
        {
            Response.Write("CHECK SUBJID : " + ex.Message);
            return "";
        }
    }
}
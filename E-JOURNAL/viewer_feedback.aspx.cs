using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class viewer_feedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool ok = true;
        if (TextBox1.Text == "")
        {
            Label2.Visible = true;
            ok = false;
        }
        else
            Label2.Visible = false;
        if (TextBox4.Text == "")
        {
            Label3.Text = "cannot be empty";
            Label3.ForeColor = Color.Red;
            ok = false;
        }
        else
        {
            Label3.Text = "Maximum Word Limit 500 characters";
            Label3.ForeColor = Color.Gray;
        }
        string c = Session["captcha"].ToString();
        if (TextBox5.Text.Equals(c) == false)
        {
            Label4.Visible = true;
            ok = false;
        }
        else
            Label4.Visible = false;
        if (ok == true)
        {
            Random rnd = new Random();
            string feedbackid = "";
            do
            {
                feedbackid = generateid("vfeed" + rnd.Next(1, 99999).ToString());
            } while (feedbackid == "");
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into VIEWER_FEEDBACK_MASTER values (@vfeedid, @vname, @vemail, @vsubject, @vfeedback, 'False', @vadminresponse)", con);
            cmd.Parameters.AddWithValue("@vfeedid", feedbackid);
            cmd.Parameters.AddWithValue("@vname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@vemail",TextBox2.Text);
            cmd.Parameters.AddWithValue("@vsubject",TextBox3.Text);
            cmd.Parameters.AddWithValue("@vfeedback",TextBox4.Text);
            cmd.Parameters.AddWithValue("@vadminresponse", "");
            try
            {
                cmd.ExecuteNonQuery();
                Label5.Visible = true;
            }
            catch (Exception ex)
            {
                Response.Write("viewer feedback operation : " + ex.Message);
            }
        }
    }
    string generateid(string id)
    {
        con.Close();
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from VIEWER_FEEDBACK_MASTER where vfeedid ='" + id + "'", con);
            SqlDataReader dr1 = cmd.ExecuteReader();
            if (dr1.Read())
                return "";
            else
                return id;
        }
        catch (Exception ex)
        {
            Response.Write("generateid() :" + ex.Message);
            return "";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        Label2.Visible = false;
        Label4.Visible = false;
        Label5.Visible = false;
        Label3.Text = "Maximum Word Limit 500 characters";
        Label3.ForeColor = Color.Gray;
        TextBox1.Focus();
    }
}
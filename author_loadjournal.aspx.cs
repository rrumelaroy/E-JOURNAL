using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;

public partial class author_loadjournal : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        bool ok = true;
        if (TextBox1.Text == "")
        {
            Label2.Visible = true;
            ok = true;
        }
        else
            Label2.Visible = false;
        if (TextBox2.Text == "")
        {
            Label3.Text = "cannot be empty";
            Label3.ForeColor = Color.Red;
            ok = false;
        }
        else
        {
            Label3.Text = "maximum of 200-300 words";
            Label3.ForeColor = Color.Gray;
        }
        if (FileUpload1.PostedFile.ContentType == "application/pdf")
        {
            Label5.Visible = false;
        }
        else
        {
            Label5.Visible = true;
            ok = false;
        }
        if (ok == true)
        {
            Random rnd = new Random();
            string paperid = "";
            do
            {
                paperid = generateid("ppr" + rnd.Next(1, 99999).ToString());
            } while (paperid == "");
            con.Close();
            con.Open();
            string id=Session["pk"].ToString();
            SqlCommand cmd = new SqlCommand("INSERT INTO PAPER_MASTER VALUES (@paperid,@authid,@subjarea,@datesubmit,@papertitle,@abstract,'submitted','')", con);
            cmd.Parameters.AddWithValue("@paperid",paperid);
            cmd.Parameters.AddWithValue("@authid",id);
            cmd.Parameters.AddWithValue("@subjarea",DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@datesubmit",DateTime.Now);
            cmd.Parameters.AddWithValue("@papertitle",TextBox1.Text);
            cmd.Parameters.AddWithValue("@abstract", TextBox2.Text);
            try
            {
                cmd.ExecuteNonQuery();
                FileUpload1.SaveAs(Server.MapPath("JournalStore") + "\\" + paperid + ".pdf");
                Label6.Visible = true;
            }
            catch (Exception ex)
            {
                Response.Write("UPLOAD JOURNAL :" + ex.Message);
            }
        }
    }
    string generateid(string id)
    {
        con.Close();
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from PAPER_MASTER where paperid='" + id + "'", con);
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
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        DropDownList1.SelectedIndex = 0;
        TextBox1.Text = "";
        Label2.Visible = false;
        TextBox2.Text = "";
        Label3.Text = "maximum of 200-300 words";
        Label3.ForeColor = Color.Gray;
        FileUpload1.Dispose();
        Label5.Visible = false;
        Label6.Visible = false;
        DropDownList1.Focus();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("author_journalstatus.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("author_correctjournal.aspx");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

public partial class author_correctjournal1 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        HiddenField1.Value = Session["paper"].ToString();
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("author_loadjournal.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("author_journalstatus.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("author_correctjournal.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        bool ok = true;
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
            con.Open();
            string id = Session["pk"].ToString();
            SqlCommand cmd = new SqlCommand("UPDATE PAPER_MASTER SET abstract = @abstract, paperstatus = 'resubmitted' WHERE paperid = '" + HiddenField1.Value + "'", con);
            cmd.Parameters.AddWithValue("@abstract", TextBox2.Text);
            try
            {
                cmd.ExecuteNonQuery();
                FileUpload1.SaveAs(Server.MapPath("JournalStore") + "\\" + HiddenField1.Value + ".pdf");
            }
            catch (Exception ex)
            {
                Response.Write("UPLOAD JOURNAL :" + ex.Message);
            }
            con.Close();
            Response.Redirect("author_correctjournal.aspx");
        }
    }
}
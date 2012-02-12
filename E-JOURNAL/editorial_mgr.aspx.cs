using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class editorial_mgr : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (FormView1.DataItemCount == 1)
            Label3.Text = "The Editorial is already uploaded for the next month.";
        else
        {
            Label3.Text = "";
            div2.Visible = true;
            TextBox1.Focus();
        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        if (FormView1.DataItemCount == 0)
            Label3.Text = "Sorry, No Editorial article to remove.";
        else
        {
            Label3.Text = "";
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM EDITORIAL_MASTER WHERE emonth = @emonth AND eyear = @eyear", con);
            cmd.Parameters.AddWithValue("@emonth", DateTime.Now.AddMonths(1).ToString("MMMMMMMMM"));
            cmd.Parameters.AddWithValue("@eyear", Convert.ToInt32(DateTime.Now.AddMonths(1).Year));
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write("DELETE OPERATION : " + ex.Message);
            }
            con.Close();
            Response.Redirect("editorial_mgr.aspx");
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (FormView1.DataItemCount == 0)
            Label3.Text = "Sorry, No article Uploaded yet for making changes.";
        else
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT editid FROM EDITORIAL_MASTER WHERE emonth = @emonth AND eyear = @eyear", con);
            cmd.Parameters.AddWithValue("@emonth",DateTime.Now.AddMonths(1).ToString("MMMMMMMMM"));
            cmd.Parameters.AddWithValue("@eyear", Convert.ToInt32(DateTime.Now.AddMonths(1).Year));
            SqlDataReader dr = cmd.ExecuteReader();
            try
            {
                if (dr.Read())
                    HiddenField1.Value = dr[0].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("SELECT EDITORIAL ID : " + ex.Message);
            }
            div3.Visible = true;
            TextBox3.Focus();
        }
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("editorial_mgr.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        bool ok = true;
        if (TextBox1.Text == "")
        {
            ok = false;
            Label4.Visible = true;
        }
        else
            Label4.Visible = false;
        if (FileUpload1.PostedFile.ContentType == "application/pdf")
            Label5.Visible = false;
        else
        {
            ok = false;
            Label5.Visible = true;
        }
        if (TextBox6.Text == "")
        {
            Label7.Visible = true;
            ok = false;
        }
        else
            Label7.Visible = false;
        if (ok == true)
        {
            Random rnd = new Random();
            string editid = "";
            do
            {
                editid = generateid("edit" + rnd.Next(1, 99999).ToString());
            } while (editid == "");
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO EDITORIAL_MASTER VALUES(@editid, @emonth, @eyear, @etitle, @eeditortitle, @efirstname, @esurname, @eabouteditor)", con);
            cmd.Parameters.AddWithValue("@editid", editid);
            cmd.Parameters.AddWithValue("@emonth", DateTime.Now.AddMonths(1).ToString("MMMMMMMMM"));
            cmd.Parameters.AddWithValue("@eyear",DateTime.Now.AddMonths(1).Year);
            cmd.Parameters.AddWithValue("@etitle", TextBox1.Text);
            cmd.Parameters.AddWithValue("@eeditortitle", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@efirstname", TextBox6.Text);
            cmd.Parameters.AddWithValue("@esurname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@eabouteditor", TextBox7.Text);
            try
            {
                cmd.ExecuteNonQuery();
                FileUpload1.SaveAs(Server.MapPath("JournalStore") + "\\" + editid + ".pdf");
            }
            catch (Exception ex)
            {
                Response.Write("INSERT : " + ex.Message);
            }
            con.Close();
            Response.Redirect("editorial_mgr.aspx");            
        }
        else
            Response.Write("failure");
    }
    string generateid(string id)
    {
        con.Close();
        con.Open();
        try
        {
            SqlCommand cmd = new SqlCommand("select * from EDITORIAL_MASTER where editid = '" + id + "'", con);
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
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("editorial_mgr.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        bool ok = true;
        if (TextBox3.Text.Trim() == "")
        {
            ok = false;
            Label10.Visible = true;
        }
        else
            Label10.Visible = false;
        if (FileUpload2.PostedFile.ContentType == "application/pdf")
            Label11.Visible = false;
        else
        {
            ok = false;
            Label11.Visible = true;
        }
        if (TextBox4.Text.Trim() == "")
        {
            Label13.Visible = true;
            ok = false;
        }
        else
            Label13.Visible = false;
        if (ok == true)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE EDITORIAL_MASTER SET eeditortitle = @eeditortitle, etitle = @etitle, efirstname = @efirstname, esurname = @esurname, eabouteditor = @eabouteditor WHERE editid = '" + HiddenField1.Value + "'", con);
            cmd.Parameters.AddWithValue("@etitle", TextBox3.Text);
            cmd.Parameters.AddWithValue("@eeditortitle", DropDownList2.SelectedValue);
            cmd.Parameters.AddWithValue("@efirstname", TextBox4.Text);
            cmd.Parameters.AddWithValue("@esurname", TextBox5.Text);
            cmd.Parameters.AddWithValue("@eabouteditor", TextBox8.Text);
            try
            {
                cmd.ExecuteNonQuery();
                FileUpload2.SaveAs(Server.MapPath("JournalStore") + "\\" + HiddenField1.Value + ".pdf");
            }
            catch (Exception ex)
            {
                Response.Write("INSERT : " + ex.Message);
            }
            con.Close();
            Response.Redirect("editorial_mgr.aspx");
        }
    }
}
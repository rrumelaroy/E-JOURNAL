using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class author_journalstatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void desclick(object sender, EventArgs e)
    {
        LinkButton l = (LinkButton)sender;
        string pk = l.ValidationGroup;
        HiddenField1.Value = pk;
        Session.Add("journal", pk);
        div1.Visible = true;
        LinkButton1.Focus();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("author_journalstatus.aspx");
    }
}
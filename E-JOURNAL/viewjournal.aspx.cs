using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewjournal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string journal = Session["journal"].ToString();
        Response.Clear();
        Response.ContentType = "Application/pdf";
        Response.WriteFile("JournalStore\\" + journal + ".pdf");
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class publishing_mgr : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("pendingpaper_mgr.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("publishpaper_mgr.aspx");
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class free_subs_master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string s = Session["type"].ToString();
        if (s == "freesubscriber")
            div1.Attributes.Add("Class", "freesubbanner");
        else
            div1.Attributes.Add("Class", "paidsubbanner");
    }
}

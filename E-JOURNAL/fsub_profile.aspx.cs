using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class fsub_profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //FormView1.ChangeMode(FormViewMode.Edit);
        DetailsView1.ChangeMode(DetailsViewMode.Edit);
    }
}
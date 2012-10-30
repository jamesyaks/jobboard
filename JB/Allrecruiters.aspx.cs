using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JB
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Allrecruiters : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //constructor
            var rcl = new DlRecruiter();

            GridView1.DataSource = rcl.Getallrecwithjobs();
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var rcl2 = new DlRecruiter();
            GridView1.DataSource = rcl2.Getallrecwithjobs();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}
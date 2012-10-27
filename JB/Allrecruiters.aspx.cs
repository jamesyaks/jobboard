using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    public partial class Allrecruiters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //constructor
            CLRecruiterCl rcl = new CLRecruiterCl();
            
            GridView1.DataSource = rcl.getallrecwithjobs();
            GridView1.DataBind();

           
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CLRecruiterCl rcl2 = new CLRecruiterCl();
            GridView1.DataSource = rcl2.getallrecwithjobs();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();              

        }

     


      
    }
}
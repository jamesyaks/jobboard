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
    public partial class Logoff : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect( "/default.aspx");
        }
    }
}

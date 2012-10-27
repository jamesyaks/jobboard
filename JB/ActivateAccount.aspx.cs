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
    public partial class ActivateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //activate the account 
            if (Request.QueryString["usertype"] != null)
            {
                int usertype = Convert.ToInt16(Request.QueryString["usertype"]);
                string username = Request.QueryString["username"];
                string activation = Request.QueryString["activationid"];

                CLLogins cllog = new CLLogins();
                cllog.activate_acc(usertype, username, activation);

            }
            
        }
    }
}
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
    public partial class confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            reasonforwarded.Text = "Confirmation";

            try
            {
                textreason.Text = Session["reasons"].ToString();
            }
            catch { }

            int statuses = Convert.ToInt16(Request.QueryString["status"]);

            if (statuses == 0)
            {
                textreason.Text = "Application sucessfully submitted. Please check your emails to stay up to date.";
            }

            else if (statuses == 1 || statuses == 2)
            {
                textreason.Text = "Thank you for registering with us. Please check your email on how to activate your account.";
            }

            else if (statuses == 3)
            {
                textreason.Text = "Thank you for subscribing to our newsletter";
            }

            else if (statuses == 4)
            {
                textreason.Text = "Thank you for subscribing to jobs by email";
            }

            else
            {
            }
        }
    }
}
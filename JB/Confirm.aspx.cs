using System;
using System.Web.UI;

namespace JB
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class confirm : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            reasonforwarded.Text = "Confirmation";

            try
            {
                textreason.Text = Session["reasons"].ToString();
            }
            catch (Exception)
            {
            }

            int statuses = Convert.ToInt16(Request.QueryString["status"]);

            switch (statuses)
            {
                case 0:
                    textreason.Text = "Application sucessfully submitted. Please check your emails to stay up to date.";
                    break;
                case 2:
                case 1:
                    textreason.Text =
                        "Thank you for registering with us. Please check your email on how to activate your account.";
                    break;
                case 3:
                    textreason.Text = "Thank you for subscribing to our newsletter";
                    break;
                case 4:
                    textreason.Text = "Thank you for subscribing to jobs by email";
                    break;
                default:
                    break;
            }
        }
    }
}
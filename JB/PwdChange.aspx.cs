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
    public partial class PasswordResetForm : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //set up passwords
            //but check first if the login really exists

            int usertype = Convert.ToInt16(Request.QueryString["utype"]);


            if (Request.QueryString["keyid"] != null)
            {
                string keyid = Request.QueryString["keyid"];

                var clapslog = new DlLogins();
                if (keyid == clapslog.Getkeyuser(keyid, usertype))
                {
                    //change password user
                    if (usertype == 2)
                    {
                        clapslog.Chgpwdjswkey(keyid, TextBox1.Text);
                    }

                    //change admin password
                    if (usertype == 1)
                    {
                        clapslog.Chgpwdrecwkey(keyid, TextBox1.Text);
                    }
                }
            }
        }
    }
}
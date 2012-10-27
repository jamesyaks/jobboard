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
    public partial class PasswordResetForm : System.Web.UI.Page
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

            int usertype = Convert.ToInt16( Request.QueryString["utype"]);
           

            if (Request.QueryString["keyid"] != null)
            {
                string keyid = Request.QueryString["keyid"];

                CLLogins clapslog = new CLLogins();
                if(keyid == clapslog.getkeyuser(keyid, usertype))
                {
                    //change password user
                    if(usertype == 2)
                    {
                        clapslog.chgpwdjswkey(keyid, TextBox1.Text);
                    }

                    //change admin password
                    if(usertype ==1)
                    {
                        clapslog.chgpwdrecwkey(keyid, TextBox1.Text);
                    }

                    else{}

                }
            }
        }
    }
}
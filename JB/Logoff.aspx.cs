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
        string npath = System.Configuration.ConfigurationManager.AppSettings["httppaths"].ToString();
    

        //read cookie
        public string readjobcookie()
        {
            //Grab the cookie
            HttpCookie cookie = Request.Cookies["ahrcloud.com"];

            //Check to make sure the cookie exists
            if (null == cookie)
            {
                return null;
            }

            else
            {
                try
                {
                    //Write the cookie value
                    String strCookieValue = cookie.Value.ToString();
                    return strCookieValue;
                }
                catch
                {
                    Label1.Text = "You Have Logged off Sucessfully!!! if not automatically redirected please click";
                    LinkButton2.Visible = true;
                    LinkButton1.Visible = false;
                    Response.Redirect("Default.aspx");
                    return null;
                }
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
        
            HttpCookie myCookie = new HttpCookie("ahrcloud.com");
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);

            if (readjobcookie() == null)
            {
                Label1.Text = "You Have Logged off Sucessfully!!! if not automatically redirected please click";
                LinkButton2.Visible = true;
                LinkButton1.Visible = false;
               
                Response.Redirect("Default.aspx");
            }

            else
            {
                LinkButton2.Visible = false;
                LinkButton1.Visible = true;
                Image1.ImageUrl = "~/images/Delete.png";
                Label1.Text = "Cannot log you off!!!";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            HttpCookie myCookie = new HttpCookie("ahrcloud.com");
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect(npath + "/Default.aspx");
        }
    }
}

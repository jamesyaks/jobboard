using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JB.JobSeekers
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Myapplications : System.Web.UI.Page
    {
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
                //Write the cookie value
                String strCookieValue = cookie.Value.ToString();
                return strCookieValue;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        
            //read and validate login
            if (Session["cuserval"] != null)
            {
                if (Session["cuserval"].ToString() == readjobcookie())
                {

                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }

            else
            {
                Response.Redirect("login.aspx");
            }
            ////////////////////////////////////

            //bind grid
            CLMainpagepopulator cmpg = new CLMainpagepopulator();
            GridView1.DataSource = cmpg.getmyapps(Session["pusername"].ToString());
            GridView1.DataBind();


        }
        
        

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //rebind grid
            CLMainpagepopulator clmp = new CLMainpagepopulator();
            GridView1.DataSource = clmp.getmyapps(Session["pusername"].ToString());
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }
    }
}
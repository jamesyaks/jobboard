using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JB.Recruiters
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class RecApplication : System.Web.UI.Page
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
          
            if (Session["pusername"] != null)
            {
                //get employer id
                CLMainpagepopulator mpg = new CLMainpagepopulator();
                int emid = mpg.RecName(Session["pusername"].ToString());

                ClApps app = new ClApps();

                //bind to grid
                GridView1.DataSource = app.getApplication(emid);
                GridView1.DataBind();
            }
            
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {        
            //get employer id
            CLMainpagepopulator mpg = new CLMainpagepopulator();
            int emid = mpg.RecName(Session["pusername"].ToString());

            ClApps apps = new ClApps();
            GridView1.DataSource = apps.getApplication(emid);
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
                    e.Row.Attributes.Add("class", "gridrowdb");
                    break;
                default:
                    break;
            }

        }

       
    }
}
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
    public partial class RecUsers : System.Web.UI.Page
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

            CLRecruiterCl rcl = new CLRecruiterCl();
            GridView1.DataSource = rcl.RecUsers(Session["pusername"].ToString());
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            CLRecruiterCl rcl2 = new CLRecruiterCl();
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = rcl2.RecUsers(Session["pusername"].ToString());
            GridView1.DataBind();
        } 

        
    }
}

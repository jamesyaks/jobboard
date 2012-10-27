using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

namespace JB.Recruiters
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Rechome : System.Web.UI.Page
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

            //set zoom levels for all charts
            int xzoom = Convert.ToInt32(zoomer.SelectedItem.Value);

            Chart1.Width = xzoom;
            jobapps.Width = xzoom;
            jobpostedview.Width = xzoom;

            //get recruiter id
            CLMainpagepopulator clmpop = new CLMainpagepopulator();
            int rectempid = clmpop.RecName(Session["pusername"].ToString());

            //get jobviews
            ClJobviewdata cljview = new ClJobviewdata();
            Chart1.DataSource = cljview.getJobviewdata(rectempid);

            Chart1.Series["Series1"].YValueMembers = "jobviews";
            Chart1.Series["Series1"].XValueMember = "dateviewed";

            Chart1.Series["Series1"].MarkerStyle = MarkerStyle.Circle;
            Chart1.Series["Series1"].MarkerSize = 3;
            Chart1.Series["Series1"].MarkerColor = Color.Black;
            Chart1.Series["Series1"].ChartType = SeriesChartType.Line;
            
            Chart1.DataBind();


            //get applications made
            jobapps.DataSource = cljview.getappviewdata(rectempid);
            jobapps.Series["Series1"].YValueMembers = "jobviews";
            jobapps.Series["Series1"].XValueMember = "dateviewed";

            jobapps.Series["Series1"].MarkerStyle = MarkerStyle.Circle;
            jobapps.Series["Series1"].MarkerSize = 3;
            jobapps.Series["Series1"].MarkerColor = Color.Black;
            jobapps.Series["Series1"].ChartType = SeriesChartType.Line;
           
            
            jobapps.DataBind();

            //get posted jobs

            jobpostedview.DataSource = cljview.getpjjobviewdata(rectempid);
            jobpostedview.Series["Series1"].YValueMembers = "jobviews";
            jobpostedview.Series["Series1"].XValueMember = "dateviewed";

            jobpostedview.Series["Series1"].MarkerStyle = MarkerStyle.Circle;
            jobpostedview.Series["Series1"].MarkerSize = 3;
            jobpostedview.Series["Series1"].MarkerColor = Color.Black;
            jobpostedview.Series["Series1"].ChartType = SeriesChartType.Line;
         

            
            jobpostedview.DataBind();

        }
    }
}
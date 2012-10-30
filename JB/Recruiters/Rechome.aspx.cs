using System;
using System.Drawing;
using System.Web.UI.DataVisualization.Charting;

namespace JB.Recruiters
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Rechome : Clcookiehandler
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //read and validate login
            if (Session["cuserval"] != null)
            {
                if (Session["cuserval"].ToString() == Readjobcookie())
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
            var clmpop = new DlMainpagepopulator();
            int rectempid = clmpop.RecName(Session["pusername"].ToString());

            //get jobviews
            var cljview = new DlJobviewdata();
            Chart1.DataSource = cljview.GetJobviewdata(rectempid);

            Chart1.Series["Series1"].YValueMembers = "jobviews";
            Chart1.Series["Series1"].XValueMember = "dateviewed";

            Chart1.Series["Series1"].MarkerStyle = MarkerStyle.Circle;
            Chart1.Series["Series1"].MarkerSize = 3;
            Chart1.Series["Series1"].MarkerColor = Color.Black;
            Chart1.Series["Series1"].ChartType = SeriesChartType.Line;

            Chart1.DataBind();

            //get applications made
            jobapps.DataSource = cljview.Getappviewdata(rectempid);
            jobapps.Series["Series1"].YValueMembers = "jobviews";
            jobapps.Series["Series1"].XValueMember = "dateviewed";

            jobapps.Series["Series1"].MarkerStyle = MarkerStyle.Circle;
            jobapps.Series["Series1"].MarkerSize = 3;
            jobapps.Series["Series1"].MarkerColor = Color.Black;
            jobapps.Series["Series1"].ChartType = SeriesChartType.Line;

            jobapps.DataBind();

            //get posted jobs

            jobpostedview.DataSource = cljview.Getpjjobviewdata(rectempid);
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
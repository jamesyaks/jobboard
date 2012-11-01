using System;
using System.Web.UI.WebControls;

namespace JB.JobSeekers
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Myapplications : Clcookiehandler
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

            //bind grid
            var cmpg = new DlMainpagepopulator();
            GridView1.DataSource = cmpg.Getmyapps(Session["pusername"].ToString());
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //rebind grid
            var clmp = new DlMainpagepopulator();
            GridView1.DataSource = clmp.Getmyapps(Session["pusername"].ToString());
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
                    e.Row.Attributes.Add("class", "ux_gridrowdb");
                    break;

                default:
                    break;
            }
        }
    }
}
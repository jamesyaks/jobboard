using System;
using System.Web.UI.WebControls;

namespace JB.Recruiters
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class RecApplication : Clcookiehandler
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

            if (Session["pusername"] != null)
            {
                //get employer id
                var mpg = new DlMainpagepopulator();
                int emid = mpg.RecName(Session["pusername"].ToString());

                var app = new DlApps();

                //bind to grid
                GridView1.DataSource = app.GetApplication(emid);
                GridView1.DataBind();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //get employer id
            var mpg = new DlMainpagepopulator();
            int emid = mpg.RecName(Session["pusername"].ToString());

            var apps = new DlApps();
            GridView1.DataSource = apps.GetApplication(emid);
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
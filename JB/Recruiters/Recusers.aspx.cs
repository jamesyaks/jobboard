using System;
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
    public partial class RecUsers : Clcookiehandler
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

            var rcl = new DlRecruiter();
            GridView1.DataSource = rcl.RecUsers(Session["pusername"].ToString());
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            var rcl2 = new DlRecruiter();
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = rcl2.RecUsers(Session["pusername"].ToString());
            GridView1.DataBind();
        }
    }
}
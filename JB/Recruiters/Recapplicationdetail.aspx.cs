using System;

namespace JB.Recruiters
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Recapplicationdetail : Clcookiehandler
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

            if (Request.QueryString["Applyid"] != null)
            {
                var claps = new DlApps();
                string[] showd = claps.Getapplicationdetails(Convert.ToInt16(Request.QueryString["Applyid"]));
                Label2.Text = showd[0];
                HyperLink1.NavigateUrl = Server.MapPath(showd[1]);
            }
        }
    }
}
using System;
using System.Web.UI;

namespace JB.JobSeekers
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Applications : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //set default inputs
            Page.Form.DefaultButton = Button3.UniqueID;

            //check if candidate is logged in redirect to candidate applications
            if (Session["pusername"] != null)
            {
                Response.Redirect("~/Jobseekers/Candidateapplication.aspx?JobID=" + Request.QueryString["JobID"]);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserApplication.aspx?CRF=1");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("DirectApplication.aspx?JobID=" + Request.QueryString["JobID"]);
        }
    }
}
using System;
using System.Configuration;
using System.Web;
using System.Web.UI;

namespace JB.JobSeekers
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Candidates : MasterPage
    {
        private readonly string cpath = ConfigurationManager.AppSettings["httpspaths"];

        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //set the welcoming label for the candidates
            if (Session["pwelcomename"] != null)
            {
                Label1.Text = "Welcome " + Session["pwelcomename"] + " | Job board ver. 1.0.1";
            }

            //rest of processing goes here
            if (Request.QueryString["CRF"] == "1")
            {
                Image3.Visible = false;
                Image4.Visible = false;
                Image5.Visible = false;
                Image6.Visible = false;
                Image7.Visible = false;

                HyperLink5.Visible = false;

                LinkButton2.Visible = false;
                LinkButton3.Visible = false;
                LinkButton44.Visible = false;
                LinkButton5.Visible = false;
            }

            else
            {
                Image3.Visible = true;
                Image4.Visible = true;
                Image5.Visible = true;
                Image6.Visible = true;
                Image7.Visible = true;

                HyperLink5.Visible = true;

                LinkButton2.Visible = true;
                LinkButton3.Visible = true;
                LinkButton44.Visible = true;
                LinkButton5.Visible = true;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath + "/Jobseekers/UserApplication.aspx?CRF=" + Request.QueryString["CRF"]);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath + "/Jobseekers/Changeuserpwd.aspx?CRF=" + Request.QueryString["CRF"]);
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath + "/Jobseekers/Myapplications.aspx?CRF=" + Request.QueryString["CRF"]);
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath + "/Jobseekers/Jobseekerhome.aspx?CRF=" + Request.QueryString["CRF"]);
        }

        protected void LinkButton44_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }

        protected void LinkButton45_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath + "/Jobseekers/candidateprivacy.aspx?CRF=" + Request.QueryString["CRF"]);
        }

        protected void LinkButton4_Click1(object sender, EventArgs e)
        {
            Response.Redirect(cpath + "/Jobseekers/cannotes.aspx?CRF=" + Request.QueryString["CRF"]);
        }
    }
}
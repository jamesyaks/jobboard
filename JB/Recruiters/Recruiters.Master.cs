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
    public partial class Rec : System.Web.UI.MasterPage
    {
        string cpath = System.Configuration.ConfigurationManager.AppSettings["httpspaths"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["pwelcomename"] != null)
            {
                //set user name
                Label1.Text = "Welcome " + Session["pwelcomename"].ToString() + " | Job board ver. 1.0.1";
            }

            //this is just to hide labels when recruiter is singing up
            if (Request.QueryString["Fg"] == "2")
            {
                
                Image4.Visible = false;
                Image5.Visible = false;
                Image6.Visible = false;
                Image12.Visible = false;
                Image10.Visible = false;
                Image11.Visible = false;
                Image13.Visible = false;

                HyperLink5.Visible = false;
                
                LinkButton8.Visible = false;
                LinkButton3.Visible = false;
                LinkButton6.Visible = false;
                LinkButton7.Visible = false;
                LinkButton4.Visible = false;
                LinkButton9.Visible = false;
            }

            else
            {

                Image4.Visible = true;
                Image5.Visible = true;
                Image6.Visible = true;                
                Image12.Visible = true;                
                Image10.Visible = true;
                Image11.Visible = true;
                Image13.Visible = true;

                HyperLink5.Visible = true;
                
                LinkButton8.Visible = true;
                LinkButton3.Visible = true;
                LinkButton6.Visible = true;
                LinkButton7.Visible = true;
                LinkButton4.Visible = true;
                LinkButton9.Visible = true;
                
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath+"/recruiters/Changerecpwd.aspx?Fg=" + Request.QueryString["Fg"]);
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath+"/recruiters/Rechome.aspx?Fg=" + Request.QueryString["Fg"]);
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath+"/recruiters/RecruiterForm.aspx?Fg=" + Request.QueryString["Fg"]);
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath+"/recruiters/Editjobs.aspx?Fg=" + Request.QueryString["Fg"]);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/recruiters/Recsimplecredits.aspx?Fg=" + Request.QueryString["Fg"]);
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath+"/recruiters/Jobform.aspx?Fg=" + Request.QueryString["Fg"]);
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath+"/recruiters/Recapplication.aspx?Fg=" + Request.QueryString["Fg"]);
        }

        protected void LinkButton44_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Globalization;

namespace JB.JobSeekers
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Candidateapplication : System.Web.UI.Page
    {
        static string pathsetter = System.Configuration.ConfigurationManager.AppSettings["cvpath"].ToString();

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
            //set default inputs
            TextBox2.Focus();
            Page.Form.DefaultButton = Button2.UniqueID;

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

            Label15.Text = "hi, " + Session["pusername"] + " please choose/update your cv/resume here";
        }

        public void adddata(string ext)
        {
            //get candidate first name, last name etc from db.
            ClCandidates cclid = new ClCandidates();
            string[] temphldoldcan = cclid.getcandidatesindb(Session["pusername"].ToString());

            if (temphldoldcan.Length > 0)
            {
                //add max count
                ClCodeconverter cc = new ClCodeconverter();
                int fnames = cc.getmaxfile(pathsetter);

                FileUpload1.PostedFile.SaveAs(pathsetter + fnames + ext);

                ClApps app = new ClApps();

                //apps add
                int mxdocid = app.getmaxdocid();
                int mxappid = app.getmaxappid();

                //set culture to british 
                //modify here in future if this needs to be set to us formats

                CultureInfo cinf = new CultureInfo("en-GB");
                //DateTime dobsdate = Convert.ToDateTime(temphldoldcan[3]);

                string dobdate1 = temphldoldcan[3]; //dobsdate.ToString("MM/dd/yyyy");

                //fill in app.
                app.AddApplicationcan(Convert.ToInt32(temphldoldcan[4]), temphldoldcan[0], temphldoldcan[1], dobdate1, TextBox2.Text, mxdocid, Session["pusername"].ToString());
                app.AddApplicationMapping(Convert.ToInt16(Request.QueryString["JobID"]), mxappid);
                app.Adddocuments(fnames + ext, pathsetter + fnames + ext);

            }

            //ask the candidate to fill in his/her details
            else
            {
                Response.Redirect("~/Jobseeker/Jobseekerhome.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ClEmailprocessor emp = new ClEmailprocessor();

            string embody = emp.emaildirapps(1, "").ToString();

            string fname = FileUpload1.PostedFile.FileName.ToString();

            string ext = string.Empty;

            if (fname.Contains("doc"))
            {

                ext = ".doc";
                adddata(ext);


                try
                {
                    emp.sendmailproc(Session["pusername"].ToString(), "Application Confirmation: Recruiter Name/Job Name", embody, 2);
                    //emp.sendmailproc(Session["pusername"].ToString(), "Application Confirmation: Recruiter Name/Job Name", "Your application has been submitted sucessfully we will contact you in due course");
                    emp.sendappemaildbupdate(Session["pusername"].ToString(), 1);
                }
                catch
                {
                    emp.sendappemaildbupdate(Session["pusername"].ToString(), 0);
                }

                Session["reasons"] = "Thank you for applying, we wish you best of luck with your application!!!";
                Response.Redirect("~/confirm.aspx");
            }

            else if (fname.Contains("docx"))
            {
                ext = ".docx";
                adddata(ext);


                try
                {
                    emp.sendmailproc(Session["pusername"].ToString(), "Application Confirmation: Recruiter Name/Job Name", embody, 2);
                    emp.sendappemaildbupdate(Session["pusername"].ToString(), 1);
                }
                catch
                {
                    emp.sendappemaildbupdate(Session["pusername"].ToString(), 0);
                }



                Session["reasons"] = "Thank you for applying, we wish you best of luck with your application!!!";
                Response.Redirect("~/confirm.aspx");

            }

            else if (fname.Contains("pdf"))
            {
                ext = ".pdf";
                adddata(ext);


                try
                {
                    emp.sendmailproc(Session["pusername"].ToString(), "Application Confirmation: Recruiter Name/Job Name", embody, 2);
                    //emp.sendmailproc(Session["pusername"].ToString(), "Application Confirmation: Recruiter Name/Job Name", "Your application has been submitted sucessfully we will contact you in due course");
                    emp.sendappemaildbupdate(Session["pusername"].ToString(), 1);
                }
                catch
                {
                    emp.sendappemaildbupdate(Session["pusername"].ToString(), 0);
                }



                Session["reasons"] = "Thank you for applying, we wish you best of luck with your application!!!";
                Response.Redirect("~/confirm.aspx");
            }

            else
            {
                Label19.Text = "Error Uploading file!!!";
            }



        }



        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}

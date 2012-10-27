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

            Label15.Text = "<br/> hi, " + Session["pusername"] + " please choose/update your cv/resume here <br/ ><br/ >";
        }

        public void adddata(string __fname)
        {
            //get candidate first name, last name etc from db.
            ClCandidates cclid = new ClCandidates();
            string[] temphldoldcan = cclid.getcandidatesindb(Session["pusername"].ToString());

            if (temphldoldcan.Length > 0)
            {
                //add max count
                ClCodeconverter cc = new ClCodeconverter();
                int __pcount = cc.getmaxfile(pathsetter);

                //upload to server
                FileUpload1.SaveAs(Server.MapPath(pathsetter) + __pcount + __fname);

                ClApps app = new ClApps();

                //apps add
                int mxdocid = app.getmaxdocid();
                int mxappid = app.getmaxappid();

                CultureInfo cinf = new CultureInfo("en-GB");
                string dobdate1 = temphldoldcan[3];

                //fill in app. automatically
                app.AddApplicationcan(Convert.ToInt32(temphldoldcan[4]), temphldoldcan[0], temphldoldcan[1], dobdate1, TextBox2.Text, mxdocid, Session["pusername"].ToString());
                app.AddApplicationMapping(Convert.ToInt16(Request.QueryString["JobID"]), mxappid);
                app.Adddocuments(__pcount + __fname, pathsetter + __pcount + __fname);
            }

            else
            {
                //error candidate id not found.
            }

        }

        private string Getextension(string __filname)
        {
            if (__filname.Contains(".doc"))
            {
                return ".doc";
            }

            else if (__filname.Contains(".docx"))
            {
                return ".docx";
            }

            else if (__filname.Contains(".pdf"))
            {
                return ".pdf";
            }

            else
            {
                return "none";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            var __maxuploadsz = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["maxfilesize"].ToString()); 

            ClEmailprocessor emp = new ClEmailprocessor();

            string embody = emp.emaildirapps(1, "").ToString();
            string fname = FileUpload1.FileName;
            var __ext = string.Empty;
            __ext = Getextension(fname);

            if (FileUpload1.HasFile)
            {
                if (__ext != "none")
                {
                    if (FileUpload1.FileContent.Length < __maxuploadsz)
                    {
                        adddata(fname);
                        try
                        {
                            emp.sendmailproc(Session["pusername"].ToString(), "Application Confirmation: Recruiter Name/Job Name", embody, 2);
                            emp.sendappemaildbupdate(Session["pusername"].ToString(), 1);
                        }
                        catch { }

                        //for production move this to try/catch block
                        Session["reasons"] = "Thank you for applying, we wish you best of luck with your application!!!";
                        Response.Redirect("~/confirm.aspx");
                    }

                    else
                    {
                        //error too large size permitted is approx 2mb
                    }
                }
                else
                {
                    //error not valid extension
                }
            }

            else
            {
                //no file error
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}

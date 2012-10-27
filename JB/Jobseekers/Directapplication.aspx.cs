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
    public partial class DirectApplication : System.Web.UI.Page
    {
        static string pathsetter = System.Configuration.ConfigurationManager.AppSettings["cvpath"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            //set default inputs
            TextBox3.Focus();
            Page.Form.DefaultButton = Button2.UniqueID;
        }

        public void adddata(string ext)
        {
           

            //set culture to british 
            //modify here in future if this needs to be set to us formats

            CultureInfo cinf = new CultureInfo("en-GB");
            DateTime dobsdate = Convert.ToDateTime(TextBox5.Text, cinf);

            string dobdate1 = dobsdate.ToString("MM/dd/yyyy");


            //add max count
            ClCodeconverter cc = new ClCodeconverter();
            int fnames = cc.getmaxfile(pathsetter);

            FileUpload1.PostedFile.SaveAs(pathsetter + fnames + ext);
            
            ClApps app = new ClApps();

            //apps add
            int mxdocid = app.getmaxdocid();
            int mxappid = app.getmaxappid();

            app.AddApplication(TextBox3.Text, TextBox4.Text, dobdate1 , TextBox2.Text, mxdocid, TextBox6.Text);
            app.AddApplicationMapping(Convert.ToInt16(Request.QueryString["JobID"]), mxappid);
            app.Adddocuments(fnames+ext,pathsetter+fnames+ext);

           
        }

        protected void Button2_Click(object sender, EventArgs e)
        { 
            //checkcode
            //get email body
            ClEmailprocessor emp = new ClEmailprocessor();

            string embody = emp.emaildirapps(1,TextBox3.Text+" "+TextBox4.Text ).ToString();

            string fname = FileUpload1.PostedFile.FileName.ToString();
            
            string ext = string.Empty;

            //get jobname and recruiters name
            string subjects = emp.subjectdirectappconfirm(Convert.ToInt16(Request.QueryString["JobID"])).ToString();

          

            if (fname.Contains("doc"))
            {

                ext = ".doc";
                adddata(ext);


                try
                {
                    
                    emp.sendmailproc(TextBox6.Text,"Application Confirmation: "+ subjects ,embody, 1);
                    emp.sendappemaildbupdate(TextBox6.Text, 0);
                }
                catch
                {
                    emp.sendappemaildbupdate(TextBox6.Text, 0);
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
                    emp.sendmailproc(TextBox6.Text, "Application Confirmation: " + subjects, embody, 1);
                    emp.sendappemaildbupdate(TextBox6.Text, 0);
                }
                catch
                {
                    emp.sendappemaildbupdate(TextBox6.Text, 0);
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
                    emp.sendmailproc(TextBox6.Text, "Application Confirmation: " + subjects, embody, 1);
                    emp.sendappemaildbupdate(TextBox6.Text, 0);
                }
                catch
                {
                    emp.sendappemaildbupdate(TextBox6.Text, 0);
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

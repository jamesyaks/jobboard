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

        private void adddata(string ext, string __filename)
        {
            //set culture to british 
            //modify here in future if this needs to be set to us formats
            //edited by adam 

            CultureInfo cinf = new CultureInfo("en-GB");
            DateTime dobsdate = Convert.ToDateTime(TextBox5.Text, cinf);

            string dobdate1 = dobsdate.ToString("MM/dd/yyyy");

            //add max count
            ClCodeconverter cc = new ClCodeconverter();
            int __pcount = cc.getmaxfile(Server.MapPath(pathsetter));
            FileUpload1.SaveAs(Server.MapPath(pathsetter) + __pcount + __filename);

            ClApps app = new ClApps();

            //apps add
            int mxdocid = app.getmaxdocid();
            int mxappid = app.getmaxappid();

            app.AddApplication(TextBox3.Text, TextBox4.Text, dobdate1, TextBox2.Text, mxdocid, TextBox6.Text);
            app.AddApplicationMapping(Convert.ToInt16(Request.QueryString["JobID"]), mxappid);
            app.Adddocuments(__pcount + __filename, pathsetter + __pcount + __filename);
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
            //get max size from web.config
            var __maxuploadsz = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["maxfilesize"].ToString()); 

            ClEmailprocessor emp = new ClEmailprocessor();
            var embody = emp.emaildirapps(1, TextBox3.Text + " " + TextBox4.Text).ToString();
            var fname = FileUpload1.FileName.ToString();
            var ext = string.Empty;
            ext = Getextension(fname);

            if (FileUpload1.HasFile)
            {
                if (ext != "none")
                {
                    if (FileUpload1.FileContent.Length < __maxuploadsz)
                    {
                        string subjects = emp.subjectdirectappconfirm(Convert.ToInt16(Request.QueryString["JobID"])).ToString();

                        adddata(ext, fname);

                        //you can remove try catch blocks they were in place in case you
                        //dont have email server running smoothly

                        try
                        {
                            emp.sendmailproc(TextBox6.Text, "Application Confirmation: " + subjects, embody, 1);
                            emp.sendappemaildbupdate(TextBox6.Text, 0);
                        }

                        catch
                        {
                            //error in email 
                        }

                        //send user confirmation, this should ideally be in try block
                        Session["reasons"] = "Thank you for applying, we wish you best of luck with your application!!!";
                        Response.Redirect("~/confirm.aspx");
                    }

                    else
                    {
                        //error file size
                    }
                  
                }

                else
                {
                    //error file extension
                }
            }

            else
            {
                //error no file
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}

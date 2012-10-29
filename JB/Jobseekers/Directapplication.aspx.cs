using System;
using System.Configuration;
using System.Globalization;
using System.Web.UI;

namespace JB.JobSeekers
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class DirectApplication : Page
    {
        private static readonly string pathsetter = ConfigurationManager.AppSettings["cvpath"];

        protected void Page_Load(object sender, EventArgs e)
        {
            //set default inputs
            TextBox3.Focus();
            Page.Form.DefaultButton = Button2.UniqueID;
        }

        private void Adddata(string __filename)
        {
            //set culture to british 
            //modify here in future if this needs to be set to us formats
            //edited by adam 

            var cinf = new CultureInfo("en-GB");
            DateTime dobsdate = Convert.ToDateTime(TextBox5.Text, cinf);

            string dobdate1 = dobsdate.ToString("MM/dd/yyyy");

            //add max count
            var cc = new ClCodeconverter();
            int __pcount = cc.Getmaxfile(Server.MapPath(pathsetter));
            FileUpload1.SaveAs(Server.MapPath(pathsetter) + __pcount + __filename);

            var app = new DlApps();

            //apps add
            int mxdocid = app.Getmaxdocid();
            int mxappid = app.Getmaxappid();

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
            int __maxuploadsz = Convert.ToInt32(ConfigurationManager.AppSettings["maxfilesize"]);

            var emp = new DlEmailprocessor();
            string embody = emp.Emaildirapps(1, TextBox3.Text + " " + TextBox4.Text).ToString();
            string fname = FileUpload1.FileName;
            string ext = string.Empty;
            ext = Getextension(fname);

            if (FileUpload1.HasFile)
            {
                if (ext != "none")
                {
                    if (FileUpload1.FileContent.Length < __maxuploadsz)
                    {
                        string subjects =
                            emp.Dbemailgenerator(Convert.ToInt16(Request.QueryString["JobID"])).ToString();

                        Adddata( fname);

                        //you can remove try catch blocks they were in place in case you
                        //dont have email server running smoothly

                        try
                        {
                            emp.Clemail.Sendmailproc(TextBox6.Text, "Application Confirmation: " + subjects, embody, 1);
                            emp.Sendappemaildbupdate(TextBox6.Text, 0);
                        }

                        catch (Exception)
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
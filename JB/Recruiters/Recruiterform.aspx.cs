using System;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Web.UI;

namespace JB.Recruiters
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class RecruiterForm : Clcookiehandler
    {
        private int _fg;

        protected void Page_Load(object sender, EventArgs e)
        {
            //set default inputs
            TextBox2.Focus();
            Page.Form.DefaultButton = Button2.UniqueID;

            if (!IsPostBack)
            {
                if (Session["pusername"] != null)
                {
                    int fg = Convert.ToInt16(Request.QueryString["Fg"]);

                    var mpage = new DlMainpagepopulator();

                    int recsid = mpage.RecName(Session["pusername"].ToString());

                    if (fg == 1)
                    {
                        //disable required fields
                        RequiredFieldValidator9.Enabled = false;
                        RequiredFieldValidator11.Enabled = false;

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

                        string[] arr = mpage.RecDetails(Session["pusername"].ToString());

                        TextBox2.Text = arr[0];
                        TextBox3.Text = arr[1];

                        TextBox10.Text = arr[2];

                        TextBox4.Text = arr[3];
                        TextBox5.Text = arr[4];
                        TextBox6.Text = arr[5];

                        TextBox7.Text = arr[6];
                        TextBox8.Text = arr[7];

                        //TextBox9.Text = arr[8];
                        TextBox9.Text = arr[9];

                        TextBox12.Text = arr[10];
                        TextBox13.Text = arr[11];

                        TextBox11.Text = Session["pusername"].ToString();
                        TextBox11.Enabled = false;

                        TextBox14.Text = arr[15];
                        TextBox16.Text = arr[14];

                        TextBox15.Text = arr[13];

                        TextBox12.Enabled = false;
                        TextBox13.Enabled = false;
                        TextBox17.Enabled = false;
                        Button3.Visible = false;
                    }

                    // featured recurites
                    var frs = new DlFeaturedrecruiters();

                    //get recruters image
                    Image8.Visible = true;
                    Image8.ImageUrl = frs.Getrecformimage(recsid);
                }

                else
                {
                    Image8.Visible = false;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (capts.Text == Session["capts"].ToString())
            {
                //check if the current user exists in the database
                var lgeins = new DlLogins();

                _fg = Convert.ToInt16(Request.QueryString["Fg"]);

                if (_fg == 1)
                {
                    //update
                    //update user rec information
                    var yohrecl = new DlRecruiter();

                    yohrecl.Runrecuserupdate(TextBox2.Text, TextBox3.Text, Session["pusername"].ToString());

                    //update logo
                    if (FileUpload1.PostedFile.FileName.Length > 1)
                    {
                        //get current article id for the logo.
                        int tmpartid = yohrecl.Getarticleids(Session["pusername"].ToString());

                        //save to hlogo
                        string hlogo = ConfigurationManager.AppSettings["filepth"] + tmpartid +
                                       FileUpload1.PostedFile.FileName;

                        //update articles
                        FileUpload1.PostedFile.SaveAs(hlogo);

                        //update articles in db
                        yohrecl.Runreclogoupdate(hlogo, "Recruiter Logo", Session["pusername"].ToString());
                    }

                    //update recruiters own information
                    yohrecl.Runrectableupdate(TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text,
                                              TextBox9.Text, TextBox10.Text, TextBox15.Text, TextBox16.Text,
                                              TextBox14.Text, Session["pusername"].ToString());
                }

                else
                {
                    if (lgeins.Checkrecusern(TextBox11.Text) != TextBox11.Text)
                    {
                        //insert
                        var mps = new DlMainpagepopulator();
                        var pwds = new ClPwdhash();
                        var arc = new DlArticles();

                        int getmaxrec = mps.RecHasRows() + 1;
                        int getmaxrecarticles = getmaxrec + 10000000;
                        int getmaxrecuserid = getmaxrec + 20000000;

                        var rnd23 = new Random();
                        string shahsp = pwds.GetMd5Hash(rnd23.Next(10000, 100000).ToString(CultureInfo.InvariantCulture));

                        //set email body
                        var emaps = new DlEmailprocessor();

                        string ebod1 =
                            emaps.Emailactivateusr(
                                "https://ahrcloud.com/ActivateAccount.aspx?activationid=" + shahsp +
                                "&usertype=1&username=" + TextBox11.Text, TextBox11.Text).ToString();

                        //recruiters
                        mps.Insertrecruiters(getmaxrec, TextBox10.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text,
                                             TextBox7.Text, TextBox8.Text, "GB", TextBox9.Text, TextBox11.Text,
                                             TextBox15.Text, TextBox16.Text, TextBox14.Text,
                                             DateTime.Now.ToString("yyyy:MM:dd hh:mm:ss"), 1, getmaxrecarticles);

                        //users and pwds
                        string md5h = pwds.GetMd5Hash(TextBox12.Text);
                        mps.Insertusers(TextBox11.Text, TextBox2.Text, 1, TextBox3.Text, md5h, 1, getmaxrecuserid,
                                        "hint", -1, shahsp);

                        //employee logo
                        string holdlogo = Path.GetFileName(FileUpload1.PostedFile.FileName);
                        arc.AddArticle(getmaxrecarticles, holdlogo,
                                       ConfigurationManager.AppSettings["filepth"] + getmaxrecarticles + holdlogo);

                        //real upload
                        FileUpload1.PostedFile.SaveAs(ConfigurationManager.AppSettings["filepth"] + getmaxrecarticles +
                                                      holdlogo);

                        //user recruiter assignments
                        mps.Insertrecusermapping(getmaxrecuserid, getmaxrec);

                        //finally send out the email
                        emaps.Clemail.Sendmailproc(TextBox11.Text, "AHRCLOUD: Account Activation!", ebod1, 4);

                        //logg it as the entry for email
                        emaps.Sendappemaildbupdate(TextBox11.Text, 1);
                    }

                    else
                    {
                        //user already exists
                        Label24.Visible = true;
                    }
                }
            }

            else
            {
                Label31.Text = "please retype the captcha as shown in grey box!";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}
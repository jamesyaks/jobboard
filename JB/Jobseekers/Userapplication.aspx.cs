using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace JB.JobSeekers
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class UserRegistration : System.Web.UI.Page
    {
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
            
            if (!IsPostBack)
            {
                if (Request.QueryString["CRF"].ToString() == "1")
                {
                }

                else
                {
                    //request for login
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


                    //load job seeker settings
                    //update job seeker user details
                    TextBox11.Enabled = false;
                    TextBox12.Enabled = false;
                    TextBox13.Enabled = false;
                    Button3.Visible = false;
                    TextBox18.Enabled = false;

                    //change required field validators
                    RequiredFieldValidator7.Enabled = false;
                    RequiredFieldValidator9.Enabled = false;

                    //load array for user details
                    CLMainpagepopulator clmpages = new CLMainpagepopulator();
                    string[] arrs = clmpages.getcandidatedetails(Session["pusername"].ToString());

                    TextBox2.Text = arrs[0];
                    TextBox3.Text = arrs[1];
                    TextBox4.Text = arrs[2];
                    TextBox5.Text = arrs[3];
                    TextBox6.Text = arrs[4];
                    TextBox7.Text = arrs[5];
                    TextBox8.Text = arrs[6];
                    TextBox16.Text = arrs[7];
                    TextBox9.Text = arrs[8];
                    CultureInfo cinf = new CultureInfo("pt-BR");
                    TextBox17.Text = Convert.ToDateTime(arrs[11]).ToString("d", cinf);
                    TextBox15.Text = arrs[10];
                    TextBox14.Text = arrs[9];
                    TextBox11.Text = Session["pusername"].ToString();
                    TextBox12.Text = "XXXXXXXX";
                    TextBox13.Text = "N/A";

                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //set culture to british 
            //modify here in future if this needs to be set to us formats

            CultureInfo cinf = new CultureInfo("en-GB");
            DateTime dobsdate = Convert.ToDateTime(TextBox17.Text, cinf);

            string dobdate1 = dobsdate.ToString("MM/dd/yyyy");

            CLLogins clog = new CLLogins();

            if (Request.QueryString["CRF"].ToString() == "1")
            {
                if (clog.checkcanusern(TextBox11.Text) != TextBox11.Text)
                {
                    //add users
                    CLMainpagepopulator mpg = new CLMainpagepopulator();
                    CLPwdhash phash = new CLPwdhash();

                    int mxuserid = mpg.maxuserid();
                    int mxcandidateid = mpg.maxcandidateid();

                    string hashpwd = phash.getMd5Hash(TextBox12.Text);

                    //add activation id and send it in email
                    Random rands1 = new Random();

                    string makehashp = phash.getMd5Hash(rands1.Next(10000, 100000).ToString());

                    //add users
                    mpg.insertusers(TextBox11.Text,TextBox2.Text,1,TextBox3.Text, hashpwd, 2, mxuserid, TextBox13.Text, mxcandidateid, makehashp);

                    //add candidates
                    mpg.insertcandidates(mxcandidateid, TextBox2.Text + " " + TextBox3.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text, TextBox16.Text, TextBox9.Text, "", TextBox14.Text, TextBox15.Text, DateTime.Now.ToString("yyyy:MM:dd hh:mm:ss"), dobdate1);

                    //send email.
                    ClEmailprocessor emproc = new ClEmailprocessor();
                   
                    //make email body
                    string emailbod = emproc.emailactivateusr("https://ahrcloud.com/ActivateAccount.aspx?activationid=" + makehashp + "&usertype=2&username=" + TextBox11.Text, TextBox11.Text).ToString();

                    //finally send out the email
                    emproc.sendmailproc(TextBox11.Text, "AHRCLOUD: Account Activation!", emailbod, 3);

                    //logg it as the entry for email
                    emproc.sendappemaildbupdate(TextBox11.Text, 2);

                    

                    Session["reasons"] = "Thank your for signing up, you are awsome! <br /> Please check your email to activate your account. <br /> ";

                    //redirect to confirmation page
                    Response.Redirect("~/confirm.aspx");
                }

                else
                {
                    Label26.Visible = true;
                }
            }

            else
            {
                //update candidates for required id
                //update users table
                ClCandidates ccan = new ClCandidates();
              
                //update candidates table
                ccan.runcandidateupdate(TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text, TextBox16.Text, dobdate1, TextBox9.Text, TextBox14.Text, TextBox15.Text, Session["pusername"].ToString());
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}

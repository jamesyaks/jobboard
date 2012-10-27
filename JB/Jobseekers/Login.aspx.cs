using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JB.JobSeekers
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Login : System.Web.UI.Page
    {
        string cpath = System.Configuration.ConfigurationManager.AppSettings["httpspaths"].ToString();
        string npath = System.Configuration.ConfigurationManager.AppSettings["httppaths"].ToString();
        
        //set unset cookies here
        //for all logins

        //add cookie for users
        public void setjobcookie(string cookiehash)
        {
            //Create a new cookie, passing the name into the constructor
            HttpCookie cookie = new HttpCookie("ahrcloud.com");

            //Set the cookies value
            cookie.Value = cookiehash;

            cookie.Expires = DateTime.Now.AddHours(1);

            //Add the cookie             
            Response.Cookies.Add(cookie);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //set default inputs
            TextBox2.Focus();
            Page.Form.DefaultButton = Button2.UniqueID;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(npath+"/Default.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            CLLogins lg = new CLLogins();
            Random rand= new Random();            
            CLPwdhash chash = new CLPwdhash();

            if (TextBox3.Text != string.Empty && TextBox2.Text != string.Empty)
            {
                if (lg.getjobuser(TextBox2.Text,TextBox3.Text) == TextBox2.Text)
                {
                    Session["pusername"] = TextBox2.Text;

                    Session["pwelcomename"] = lg.userwelcomename(TextBox2.Text, 2);
        
                    string addhash2 = chash.getMd5Hash(rand.Next(1000,10000).ToString());
                    Session["cuserval"] = addhash2;
                    setjobcookie(addhash2);
                    
                    Response.Redirect(cpath+"/Jobseekers/JobSeekerHome.aspx?CRF=2");
                }

                else
                {
                    //Response.Redirect("RecruiterForm.aspx");
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath+"/Resetpassword.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect(cpath+"/Jobseekers/UserApplication.aspx?CRF=1");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect(npath+"/Default.aspx");
        }
    }
}

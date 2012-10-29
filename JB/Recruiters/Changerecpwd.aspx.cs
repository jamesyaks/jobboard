using System;
using System.Web;
using System.Web.UI;

namespace JB.Recruiters
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Changerecpwd : Clcookiehandler
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //set default inputs
            TextBox1.Focus();
            Page.Form.DefaultButton = Button1.UniqueID;


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
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var cllg = new DlLogins();

            //check passwords is ok first
            if (cllg.Getuser(Session["pusername"].ToString(), TextBox1.Text) != null)
            {
                if (TextBox2.Text == TextBox3.Text)
                {
                    //change pwd
                    cllg.Chgpwdrec(Session["pusername"].ToString(), TextBox2.Text);
                    Label4.Text = "Password Changed, please use this from now onwards";
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                }

                else
                {
                    Label4.Text = "New Password donot match";
                }
            }

            else
            {
                //check pwd
                Label4.Text = "Please Check your old password";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Recruiters/");
        }
    }
}
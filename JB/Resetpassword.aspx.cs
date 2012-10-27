using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JB
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    /// 
    public partial class Resetpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //insert into the usertable random key
            //recalc password hash
            CLPwdhash clpdh = new CLPwdhash();
            Random rnd = new Random();

            string hashedpwd = clpdh.getMd5Hash(rnd.Next(10, 1000).ToString());

            //one goes to email as hashvalue.
            ClEmailprocessor cemp = new ClEmailprocessor();
            
            string ebody = string.Empty;

            //second inserts into the db.
            CLLogins clog = new CLLogins();

            if (CheckBox1.Checked == true)
            {
                clog.chgkeyrec(TextBox1.Text, hashedpwd);

                ebody = cemp.emailpwdnotify("https://ahrcloud.com/PwdChange.aspx?keyid=" + hashedpwd + "&utype=" + 1, TextBox1.Text).ToString();

                cemp.sendmailproc(TextBox1.Text, "ahrcloud: Password Reset", ebody, 2);

                //logg it as the entry for email
                cemp.sendappemaildbupdate(TextBox1.Text, 2);
            }

            else
            {
                clog.chgkeyuser(TextBox1.Text, hashedpwd);

                ebody = cemp.emailpwdnotify("https://ahrcloud.com/PwdChange.aspx?keyid=" + hashedpwd + "&utype=" + 2, TextBox1.Text).ToString();

                cemp.sendmailproc(TextBox1.Text, "ahrcloud: Password Reset", ebody, 2);
            
                //logg it as the entry for email
                cemp.sendappemaildbupdate(TextBox1.Text, 2);
            

            }

        }
    }
}
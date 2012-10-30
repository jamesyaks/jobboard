using System;
using System.Globalization;
using System.Web.UI;

namespace JB
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    ///
    public partial class Resetpassword : Page
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
            var clpdh = new ClPwdhash();
            var rnd = new Random();

            string hashedpwd = clpdh.GetMd5Hash(rnd.Next(10, 1000).ToString(CultureInfo.InvariantCulture));

            //one goes to email as hashvalue.
            var cemp = new DlEmailprocessor();

            string ebody = string.Empty;

            //second inserts into the db.
            var clog = new DlLogins();

            if (CheckBox1.Checked)
            {
                clog.Chgkeyrec(TextBox1.Text, hashedpwd);

                ebody =
                    cemp.Emailpwdnotify("https://ahrcloud.com/PwdChange.aspx?keyid=" + hashedpwd + "&utype=" + 1,
                                        TextBox1.Text).ToString();

                cemp.Clemail.Sendmailproc(TextBox1.Text, "ahrcloud: Password Reset", ebody, 2);

                //logg it as the entry for email
                cemp.Sendappemaildbupdate(TextBox1.Text, 2);
            }

            else
            {
                clog.Chgkeyuser(TextBox1.Text, hashedpwd);

                ebody =
                    cemp.Emailpwdnotify("https://ahrcloud.com/PwdChange.aspx?keyid=" + hashedpwd + "&utype=" + 2,
                                        TextBox1.Text).ToString();

                cemp.Clemail.Sendmailproc(TextBox1.Text, "ahrcloud: Password Reset", ebody, 2);

                //logg it as the entry for email
                cemp.Sendappemaildbupdate(TextBox1.Text, 2);
            }
        }
    }
}
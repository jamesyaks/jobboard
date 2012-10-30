using System;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace JB
{
    public class Clemail
    {
        public void Sendmailproc(string toaddr, string tosubject, string tobody, int typeofemail)
        {
            //checkcode
            try
            {
                var mailfrom = ConfigurationManager.AppSettings["emailfrom"];
                var mailserver = ConfigurationManager.AppSettings["emailserver"];
                var username = ConfigurationManager.AppSettings["eusername"];
                var password = ConfigurationManager.AppSettings["epassword"];
                var port = Convert.ToInt16(ConfigurationManager.AppSettings["eport"]);

                var message = new MailMessage();
                message.To.Add(toaddr);
                message.Subject = tosubject;
                message.From = new MailAddress(mailfrom);
                message.IsBodyHtml = true;
                message.Body = tobody;
                var smtp = new SmtpClient(mailserver, port) { Credentials = new NetworkCredential(username, password) };
                smtp.Send(message);
            }
            catch (Exception)
            {
            }
        }
    }
}
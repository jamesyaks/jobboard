using System;
using System.Net.Mail;
using MySql.Data.MySqlClient;
using System.Text;

namespace JB
{
    public class ClEmailprocessor
    {        
        //get recruiter details for jobemails subjects
        public StringBuilder subjectdirectappconfirm(int jobid)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            StringBuilder sbr = new StringBuilder();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand(
                  "SELECT * from getsubjectemailapps where idjobs = " + jobid + "; ",
                  connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sbr.Append(reader.GetString(1));
                        sbr.Append(" / ");
                        sbr.Append(reader.GetString(2));
                    }
                }
                else
                {
                    //ct = 0;
                }
                reader.Close();
            }
            return sbr;

        }

        //this is for processing password change notifications.
        public StringBuilder emailpwdnotify(string passwordlink,string uusername)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            StringBuilder sbr = new StringBuilder();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand(
                  "SELECT eheader, edescription , efooter from emailtemplates where etemplatechkid = 2;",
                  connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sbr.Append(reader.GetString(0));
                        sbr.Append(uusername);
                        sbr.Append(reader.GetString(1));
                        sbr.Append(passwordlink);
                        sbr.Append(reader.GetString(2));
                    }
                }
                else
                {
                    //ct = 0;
                }
                reader.Close();
            }
            return sbr;

        }

        //user activation email
        public StringBuilder emailactivateusr(string activationlink, string uusername)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            StringBuilder sbr = new StringBuilder();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand(
                  "SELECT eheader, edescription , efooter from emailtemplates where etemplatechkid = 3;",
                  connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sbr.Append(reader.GetString(0));
                        sbr.Append(uusername);
                        sbr.Append(reader.GetString(1));
                        sbr.Append(activationlink);
                        sbr.Append(reader.GetString(2));
                    }
                }
                else
                {
                    //ct = 0;
                }
                reader.Close();
            }
            return sbr;

        }

        //register a new template, remove safely
        public void registeremailtemplate(string ebody, int etemplatechkid, string etemplatename,string ehead, string efoot)
        {
            //define vars here
            //int rEmailtype = 0;
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString = Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO emailtemplates(eTemplateName, edescription, eTemplatechkid, eHeader, eFooter) values (@templatename, @eb1, @eb2, @ehead, @efoot)";

                    com.Parameters.Add("@eb1", MySqlDbType.Text).Value = ebody;
                    com.Parameters.Add("@eb2", MySqlDbType.Int16).Value = etemplatechkid;
                    com.Parameters.Add("@templatename", MySqlDbType.VarChar).Value = etemplatename;
                    com.Parameters.Add("@ehead", MySqlDbType.Text).Value = ehead;
                    com.Parameters.Add("@efoot", MySqlDbType.Text).Value = efoot;
                    
                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //this is for processing application notifications.
        public StringBuilder emaildirapps(int typeofemail,string username)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString = Clconnect.makeconn();

            StringBuilder sbr = new StringBuilder();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand(
                  "SELECT eheader, edescription , efooter from emailtemplates where etemplatechkid= "+ typeofemail +";",
                  connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sbr.Append( reader.GetString(0));
                        sbr.Append(username);
                        sbr.Append(reader.GetString(1));
                        sbr.Append(reader.GetString(2));
                    }
                }
                else
                {
                    //ct = 0;
                }
                reader.Close();
            }
            return sbr;

        }

        //simple reuseable send mail proc
        public void sendmailproc(string toaddr, string tosubject, string tobody,int typeofemail)
        {       
            //checkcode
            try
            {
                System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                message.To.Add("info@ahrcloud.com");
                message.Subject = tosubject;
                message.From = new System.Net.Mail.MailAddress("no-reply@ahrcloud.com");
                message.IsBodyHtml = true;
                message.Body = tobody;
                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("mail.ahrcloud.com", 25);
                smtp.Credentials = new System.Net.NetworkCredential("info", "abacus");
                smtp.Send(message);
            }
            catch { }
        }

        //on sucess of application email sent out, log to db.
        public void sendappemaildbupdate(string emailaddress, int rEmailtype)
        {
            //define vars here
            
            int statuses = 0;

            MySql.Data.MySqlClient.MySqlConnection conn;
            MySql.Data.MySqlClient.MySqlCommand cmd;

            conn = new MySql.Data.MySqlClient.MySqlConnection();
            cmd = new MySql.Data.MySqlClient.MySqlCommand();

            string myquerystring;
            myquerystring = "INSERT INTO emailresponse(rStatus,rdtsent,rEmailtype,rEmailaddress) values ('" + statuses + "', '" + DateTime.Now.ToString("yyyy:MM:dd hh:mm:ss") + "' ,'" + rEmailtype + "' ,'" + emailaddress + "')";
             
            conn.ConnectionString = Clconnect.makeconn();

            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = myquerystring;
            cmd.ExecuteNonQuery();
            conn.Close();

        }

    
      
    }
}
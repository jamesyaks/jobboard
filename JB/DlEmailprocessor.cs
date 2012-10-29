using System;
using System.Configuration;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Text;
using MySql.Data.MySqlClient;

namespace JB
{
    public class DlEmailprocessor
    {
        private readonly Clemail _clemail = new Clemail();

        public Clemail Clemail
        {
            get { return _clemail; }
        }

        //get recruiter details for jobemails subjects
        public StringBuilder Dbemailgenerator(int jobid)
        {
            var connreader = new MySqlConnection {ConnectionString = Dlconnect.Makeconn()};

            var sbr = new StringBuilder();

            using (connreader)
            {
                var command = new MySqlCommand(
                    "SELECT * from getsubjectemailapps where idjobs = " + jobid + "; ",
                    connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sbr.Append(reader.GetString(1));
                        sbr.Append(" / ");
                        sbr.Append(reader.GetString(2));
                    }
                }
                reader.Close();
            }
            return sbr;
        }

        //this is for processing password change notifications.
        public StringBuilder Emailpwdnotify(string passwordlink, string uusername)
        {
            var connreader = new MySqlConnection {ConnectionString = Dlconnect.Makeconn()};

            var sbr = new StringBuilder();

            using (connreader)
            {
                var command = new MySqlCommand(
                    "SELECT eheader, edescription , efooter from emailtemplates where etemplatechkid = 2;",
                    connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

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
                reader.Close();
            }
            return sbr;
        }

        //user activation email
        public StringBuilder Emailactivateusr(string activationlink, string uusername)
        {
            var connreader = new MySqlConnection {ConnectionString = Dlconnect.Makeconn()};

            var sbr = new StringBuilder();

            using (connreader)
            {
                var command = new MySqlCommand(
                    "SELECT eheader, edescription , efooter from emailtemplates where etemplatechkid = 3;",
                    connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

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
                reader.Close();
            }
            return sbr;
        }

        //register a new template, remove safely
        public void SaveemailTempl(string ebody, int etemplatechkid, string etemplatename, string ehead,
                                          string efoot)
        {
            //define vars here
            //int rEmailtype = 0;
            using (var con = new MySqlConnection())
            {
                con.ConnectionString = Dlconnect.Makeconn();
                con.Open();

                using (var com = con.CreateCommand())
                {
                    com.CommandType = CommandType.Text;
                    com.CommandText =
                        "INSERT INTO emailtemplates(eTemplateName, edescription, eTemplatechkid, eHeader, eFooter) values (@templatename, @eb1, @eb2, @ehead, @efoot)";

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
        public StringBuilder Emaildirapps(int typeofemail, string username)
        {
            var connreader = new MySqlConnection {ConnectionString = Dlconnect.Makeconn()};

            var sbr = new StringBuilder();

            using (connreader)
            {
                var command = new MySqlCommand(
                    "SELECT eheader, edescription , efooter from emailtemplates where etemplatechkid= " + typeofemail +
                    ";",
                    connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sbr.Append(reader.GetString(0));
                        sbr.Append(username);
                        sbr.Append(reader.GetString(1));
                        sbr.Append(reader.GetString(2));
                    }
                }
                reader.Close();
            }
            return sbr;
        }

        //simple reuseable send mail proc

        //on sucess of application email sent out, log to db.
        public void Sendappemaildbupdate(string emailaddress, int rEmailtype)
        {
            //define vars here

            const int statuses = 0;

            var conn = new MySqlConnection();
            var cmd = new MySqlCommand();

            var myquerystring = "INSERT INTO emailresponse(rStatus,rdtsent,rEmailtype,rEmailaddress) values ('" + statuses +
                                   "', '" + DateTime.Now.ToString("yyyy:MM:dd hh:mm:ss") + "' ,'" + rEmailtype + "' ,'" +
                                   emailaddress + "')";

            conn.ConnectionString = Dlconnect.Makeconn();

            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = myquerystring;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}
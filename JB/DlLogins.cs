using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class DlLogins
    {
        //activate accounts for users and recruitersm
        public void ActivateAcc(int uusertype, string uusername, string keytopass)
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
                        "UPDATE USERS SET uActivation = null where uUsername = @username and uusertype = @usertype and uactivation = @keytopas";

                    com.Parameters.Add("@usertype", MySqlDbType.Int16).Value = uusertype;
                    com.Parameters.Add("@username", MySqlDbType.VarChar).Value = uusername;
                    com.Parameters.Add("@keytopas", MySqlDbType.VarChar).Value = keytopass;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //get user orginal name for welcome //only for candidates
        public string Userwelcomename(string pusername, int uusertype)
        {
            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            //get hashcode
            //
            var passhash = new ClPwdhash();

            //string to hold data
            var tmphld = string.Empty;

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT concat(can.cfirstname,' ',can.clastname)as names FROM candidates can, users usr where can.idcandidates = usr.ucandidateid and usr.uusername = '" +
                        pusername + "' and usr.uusertype = " + uusertype + "; ", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        tmphld = reader.GetString(0);
                    }
                }
                else
                {
                    return null;
                }
                reader.Close();
            }

            return tmphld;
        }

        //get employee id ony for employees
        public string Userwelcomename(string pusername, int uusertype, int empid)
        {
            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            //get hashcode
            //
            var passhash = new ClPwdhash();

            //string to hold data
            var tmphld = string.Empty;

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT concat(ufirstname,' ',ulastname)as names FROM users where uusername = '" + pusername +
                        "' and uusertype = " + uusertype + "; ", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        tmphld = reader.GetString(0);
                    }
                }
                else
                {
                    return null;
                }
                reader.Close();
            }

            return tmphld;
        }

        //check the password key against the database
        public string Getkeyuser(string keyids, int utype)
        {
            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            //get hashcode
            //
            var passhash = new ClPwdhash();

            //string to hold data
            var tmphld = string.Empty;

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT upasswordresetcode FROM users where upasswordresetcode = '" + keyids +
                        "' and uusertype = " + utype + "; ", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        tmphld = reader.GetString(0);
                    }
                }
                else
                {
                    return null;
                }
                reader.Close();
            }

            return tmphld;
        }

        //set seed key for user
        public void Chgkeyuser(string uusername, string keys)
        {
            //
            using (var con = new MySqlConnection())
            {
                con.ConnectionString = Dlconnect.Makeconn();
                con.Open();

                using (var com = con.CreateCommand())
                {
                    com.CommandType = CommandType.Text;
                    com.CommandText =
                        "UPDATE users set uPasswordresetcode = @keys where uUserName= @uusername and uUserType = 2; ";

                    com.Parameters.Add("@keys", MySqlDbType.VarChar).Value = keys;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //set seed key for recruiters
        public void Chgkeyrec(string uusername, string keys)
        {
            //
            using (var con = new MySqlConnection())
            {
                con.ConnectionString = Dlconnect.Makeconn();
                con.Open();

                using (var com = con.CreateCommand())
                {
                    com.CommandType = CommandType.Text;
                    com.CommandText =
                        "UPDATE users set uPasswordresetcode = @keys where uUserName= @uusername and uUserType = 1; ";

                    com.Parameters.Add("@keys", MySqlDbType.VarChar).Value = keys;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //this is admin user
        //1 is admin
        public string Getuser(string userns, string pwds)
        {
            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            //get hashcode
            //
            var passhash = new ClPwdhash();

            //string to hold data
            var tmphld = string.Empty;

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT uUsername FROM users where upassword = '" + passhash.GetMd5Hash(pwds) +
                        "' and uusername='" + userns + "' and uusertype = 1; ", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        tmphld = reader.GetString(0);
                    }
                }
                else
                {
                    return null;
                }
                reader.Close();
            }

            return tmphld;
        }

        //jobseeker user
        //2 is jobseeker
        public string Getjobuser(string usns, string pwds)
        {
            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            //get hashcode
            //
            var passhash = new ClPwdhash();

            var pdhash = string.Empty;

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT uUsername FROM users where upassword = '" + passhash.GetMd5Hash(pwds) +
                        "' and uusername='" + usns + "' and uusertype=2; ", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        pdhash = reader.GetString(0);
                    }
                }
                else
                {
                    return null;
                }
                reader.Close();
            }

            return pdhash;
        }

        //change passwords
        //rec password or admin 1
        public void Chgpwdrec(string uUserName, string pwds)
        {
            //recalc password hash
            var clpdh = new ClPwdhash();

            var hashedpwd = clpdh.GetMd5Hash(pwds);

            //
            using (var con = new MySqlConnection())
            {
                con.ConnectionString = Dlconnect.Makeconn();
                con.Open();

                using (var com = con.CreateCommand())
                {
                    com.CommandType = CommandType.Text;
                    com.CommandText = "UPDATE users set uPassword = '" + hashedpwd + "' where uUserName= '" + uUserName +
                                      "' and uUserType = 1;";

                    com.Parameters.Add("@uUserName", MySqlDbType.VarChar).Value = uUserName;

                    var reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //jobseeker password or admin 2
        public void Chgpwdjs(string uUserName, string pwds)
        {
            //recalc password hash
            var clpdh = new ClPwdhash();

            var hashedpwd = clpdh.GetMd5Hash(pwds);

            //
            using (var con = new MySqlConnection())
            {
                con.ConnectionString = Dlconnect.Makeconn();
                con.Open();

                using (var com = con.CreateCommand())
                {
                    com.CommandType = CommandType.Text;
                    com.CommandText = "UPDATE users set uPassword = '" + hashedpwd + "' where uUserName= '" + uUserName +
                                      "' and uUserType = 2;";

                    com.Parameters.Add("@uUserName", MySqlDbType.VarChar).Value = uUserName;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //change passwords with keys.....
        //change passwords
        //rec password or admin 1
        public void Chgpwdrecwkey(string keyval, string pwds)
        {
            //recalc password hash
            var clpdh = new ClPwdhash();

            var hashedpwd = clpdh.GetMd5Hash(pwds);

            //
            using (var con = new MySqlConnection())
            {
                con.ConnectionString = Dlconnect.Makeconn();
                con.Open();

                using (var com = con.CreateCommand())
                {
                    com.CommandType = CommandType.Text;
                    com.CommandText = "UPDATE users set uPassword = '" + hashedpwd + "' where upasswordresetcode= '" +
                                      keyval + "' and uUserType = 1;";

                    com.Parameters.Add("@keyval", MySqlDbType.VarChar).Value = keyval;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //jobseeker password or admin 2
        public void Chgpwdjswkey(string keyval, string pwds)
        {
            //recalc password hash
            var clpdh = new ClPwdhash();

            var hashedpwd = clpdh.GetMd5Hash(pwds);

            //
            using (var con = new MySqlConnection())
            {
                con.ConnectionString = Dlconnect.Makeconn();
                con.Open();

                using (var com = con.CreateCommand())
                {
                    com.CommandType = CommandType.Text;
                    com.CommandText = "UPDATE users set uPassword = '" + hashedpwd + "' where uPasswordresetcode= '" +
                                      keyval + "' and uUserType = 2; ";

                    com.Parameters.Add("@keyval", MySqlDbType.VarChar).Value = keyval;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //check if the recruiter exists in the database
        public string Checkrecusern(string userns)
        {
            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            //get hashcode
            //
            var passhash = new ClPwdhash();

            var plhash = string.Empty;

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT uUsername FROM users where uusername='" + userns + "' and uusertype = 1; ", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        plhash = reader.GetString(0);
                    }
                }
                else
                {
                    return null;
                }
                reader.Close();
            }

            return plhash;
        }

        //check if the candidate exists in the database
        public string Checkcanusern(string userns)
        {
            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            //get hashcode
            //
            var passhash = new ClPwdhash();

            var plhash = string.Empty;

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT uUsername FROM users where uusername='" + userns + "' and uusertype = 2; ", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        plhash = reader.GetString(0);
                    }
                }
                else
                {
                    return null;
                }
                reader.Close();
            }

            return plhash;
        }

        //check the usertype for the main windows like is it recruiter of single user
        public int Checkusertype(string uusername, int uusertypes)
        {
            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            var passhash = new ClPwdhash();

            var plhash = 0;

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT uusertype from users where uusername = '" + uusername + "'and uusertype=" + uusertypes +
                        " ; ", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        plhash = reader.GetInt16(0);
                    }
                }
                reader.Close();
            }

            return plhash;
        }
    }
}
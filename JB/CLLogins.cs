﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace JB
{
    public class CLLogins
    {
        //activate accounts for users and recruitersm
        public void activate_acc(int uusertype , string uusername, string keytopass)
        {
            //define vars here
            //int rEmailtype = 0;
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "UPDATE USERS SET uActivation = null where uUsername = @username and uusertype = @usertype and uactivation = @keytopas";

                    com.Parameters.Add("@usertype", MySqlDbType.Int16).Value = uusertype;
                    com.Parameters.Add("@username", MySqlDbType.VarChar).Value = uusername;
                    com.Parameters.Add("@keytopas", MySqlDbType.VarChar).Value = keytopass;
                    
                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }

        //get user orginal name for welcome //only for candidates
        public string userwelcomename(string pusername,int uusertype)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString = Clconnect.makeconn();

            //get hashcode
            //
            CLPwdhash passhash = new CLPwdhash();

            //string to hold data
            string tmphld = string.Empty;

            using (connreader)
            {

                MySqlCommand command = new MySqlCommand("SELECT concat(can.cfirstname,' ',can.clastname)as names FROM candidates can, users usr where can.idcandidates = usr.ucandidateid and usr.uusername = '" + pusername + "' and usr.uusertype = " + uusertype + "; ", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

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
        public string userwelcomename(string pusername, int uusertype, int empid)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString = Clconnect.makeconn();

            //get hashcode
            //
            CLPwdhash passhash = new CLPwdhash();

            //string to hold data
            string tmphld = string.Empty;

            using (connreader)
            {

                MySqlCommand command = new MySqlCommand("SELECT concat(ufirstname,' ',ulastname)as names FROM users where uusername = '" + pusername + "' and uusertype = " + uusertype + "; ", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

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
        public string getkeyuser(string keyids, int utype)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            //get hashcode
            //
            CLPwdhash passhash = new CLPwdhash();

            //string to hold data
            string tmphld = string.Empty;

            using (connreader)
            {

                MySqlCommand command = new MySqlCommand("SELECT upasswordresetcode FROM users where upasswordresetcode = '" + keyids + "' and uusertype = "+ utype +"; ", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

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
        public void chgkeyuser(string uusername, string keys)
        {         
            
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "UPDATE users set uPasswordresetcode = @keys where uUserName= @uusername and uUserType = 2; ";

                    com.Parameters.Add("@keys", MySqlDbType.VarChar).Value = keys;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;
                    
                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }

        //set seed key for recruiters
        public void chgkeyrec(string uusername, string keys)
        {

        //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString = Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "UPDATE users set uPasswordresetcode = @keys where uUserName= @uusername and uUserType = 1; ";

                    com.Parameters.Add("@keys", MySqlDbType.VarChar).Value = keys;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;
                    
                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }   
        
        }

        //this is admin user
        //1 is admin
        public string getuser(string userns, string pwds)
        {
             
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            //get hashcode
            //
            CLPwdhash passhash = new CLPwdhash();

            //string to hold data
            string tmphld = string.Empty;

            using (connreader)
            {

                MySqlCommand command = new MySqlCommand ( "SELECT uUsername FROM users where upassword = '"+ passhash.getMd5Hash(pwds) +"' and uusername='"+ userns +"' and uusertype = 1; ", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

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
        public string getjobuser(string usns, string pwds)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString = Clconnect.makeconn();

            //get hashcode
            //
            CLPwdhash passhash = new CLPwdhash();

            string pdhash = string.Empty;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("SELECT uUsername FROM users where upassword = '" + passhash.getMd5Hash(pwds) + "' and uusername='"+ usns +"' and uusertype=2; ", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

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
        public void chgpwdrec(string uUserName,string pwds)
        {
            //recalc password hash
            CLPwdhash clpdh = new CLPwdhash();

            string hashedpwd = clpdh.getMd5Hash(pwds);

            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "UPDATE users set uPassword = '" + hashedpwd + "' where uUserName= '" + uUserName + "' and uUserType = 1;";

                    com.Parameters.Add("@uUserName", MySqlDbType.VarChar).Value = uUserName;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //jobseeker password or admin 2
        public void chgpwdjs(string uUserName, string pwds)
        {
            //recalc password hash
            CLPwdhash clpdh = new CLPwdhash();

            string hashedpwd = clpdh.getMd5Hash(pwds);

            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "UPDATE users set uPassword = '" + hashedpwd + "' where uUserName= '" + uUserName + "' and uUserType = 2;";

                    com.Parameters.Add("@uUserName", MySqlDbType.VarChar).Value = uUserName;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }
        
        //change passwords with keys.....
        //change passwords
        //rec password or admin 1
        public void chgpwdrecwkey(string keyval, string pwds)
        {
            //recalc password hash
            CLPwdhash clpdh = new CLPwdhash();

            string hashedpwd = clpdh.getMd5Hash(pwds);
            
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "UPDATE users set uPassword = '" + hashedpwd + "' where upasswordresetcode= '" + keyval + "' and uUserType = 1;";

                    com.Parameters.Add("@keyval", MySqlDbType.VarChar).Value = keyval;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }

        //jobseeker password or admin 2
        public void chgpwdjswkey(string keyval, string pwds)
        {
            //recalc password hash
            CLPwdhash clpdh = new CLPwdhash();

            string hashedpwd = clpdh.getMd5Hash(pwds);

            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "UPDATE users set uPassword = '" + hashedpwd + "' where uPasswordresetcode= '" + keyval + "' and uUserType = 2; ";

                    com.Parameters.Add("@keyval", MySqlDbType.VarChar).Value = keyval;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }
    

        //check if the recruiter exists in the database
        public string checkrecusern(string userns)
        {

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            //get hashcode
            //
            CLPwdhash passhash = new CLPwdhash();

            string plhash = string.Empty;


            using (connreader)
            {


                MySqlCommand command = new MySqlCommand("SELECT uUsername FROM users where uusername='" + userns + "' and uusertype = 1; ", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

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
        public string checkcanusern(string userns)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            //get hashcode
            //
            CLPwdhash passhash = new CLPwdhash();

            string plhash = string.Empty;

            using (connreader)
            {

                MySqlCommand command = new MySqlCommand("SELECT uUsername FROM users where uusername='" + userns + "' and uusertype = 2; ", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

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
        public int checkusertype(string uusername, int uusertypes)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            //get hashcode
            //
            CLPwdhash passhash = new CLPwdhash();

            int plhash = 0;


            using (connreader)
            {


                MySqlCommand command = new MySqlCommand("SELECT uusertype from users where uusername = '"+ uusername +"'and uusertype="+ uusertypes +" ; ", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        plhash = reader.GetInt16(0);
                    }
                }
                else
                {
                    //return null;
                }
                reader.Close();
            }


            return plhash;
      

        }

    }
}

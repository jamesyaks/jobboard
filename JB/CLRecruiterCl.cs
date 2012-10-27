using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class CLRecruiterCl
    {
        //get recid via email/name
        public int getrecid(string recname)
        {
            //store rec details
            int arrayrec = 0;

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("SELECT empid from recruiters where sRecruiterName ='" + recname + "' limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec = reader.GetInt32(0);
                    }
                }

                else
                {
                    //Console.WriteLine("No rows found.");
                }
                reader.Close();
            }
            return arrayrec;
        }       
        
        //this may not be used anymore, as we changed one to one from one to many relation, please review.
        public DataSet RecUsers(string Userns)
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("select usr.uUsername,usr.uFirstName, usr.uLastName,usr.uIsPrimary,usr.idUsers from recruiters rec, recusermapper rmap, users usr where rec.EmpID  = rmap.EmpID and rmap.idUsers = usr.idUsers and usr.uUsername = '"+ Userns +"' limit 1;", mycon);

            mycon.Open();

            myda.Fill(Ds, "usr");

            mycon.Close();

            return Ds;

        }

        //get all recruiters with jobs
        public DataSet getallrecwithjobs()
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            //MySqlDataAdapter myda = new MySqlDataAdapter("select * from getallrec;", mycon);
            MySqlDataAdapter myda = new MySqlDataAdapter("select * from getallrec;", mycon);

            mycon.Open();

            myda.Fill(Ds, "getallrec");

            mycon.Close();

            return Ds;

        }

        //get one rec detail with recid
        public DataSet getcurrrecwithempid(string empid)
        {

            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("select article_data as article_data, sCompleteDesc, sWebsite, sEmailAddress from getallrec where empid = "+ empid +" limit 1;", mycon);

            mycon.Open();

            myda.Fill(Ds, "recruiters");

            mycon.Close();

            return Ds;
        }

        //get contact person details page
        public string contactperson(string jobid)
        {
            //store rec details
            string arrayrec = string.Empty;

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("SELECT concat_ws(' ',uFirstname,' ',uLastName) from recusers where idjobs ='" + jobid + "' limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec = reader.GetString(0);
                    }
                }

                else
                {
                    //Console.WriteLine("No rows found.");
                }
                reader.Close();
            }
            return arrayrec;
        }

        //update recuser with id = 1;
        public void runrecuserupdate(string fname, string lname, string uusername)
        {
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "Update users set uFirstName = @fname , uLastName = @lname where uUserName = @uusername and uUserType=1;";

                    com.Parameters.Add("@fname", MySqlDbType.VarChar).Value = fname;
                    com.Parameters.Add("@lname", MySqlDbType.VarChar).Value = lname;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;
                    
                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }


        }
    
        //logo update for recruiters with id = 1;
        public void runreclogoupdate(string Article_data, string Articlename, string uusername)
        {
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "UPDATE articles arc, recruiters rec, recusermapper rmap, users usr SET arc.Article_data = @Article_data, arc.articlename=@Articlename where arc.sarticleid = rec.sarticleid and rmap.empid = rec.empid and rmap.idusers = usr.idusers and usr.uusername = @uusername and usr.uUserType = 1;";

                    com.Parameters.Add("@Article_data", MySqlDbType.VarChar).Value = Article_data;
                    com.Parameters.Add("@Articlename", MySqlDbType.VarChar).Value = Articlename;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }


        //update recruiter table information
        public void runrectableupdate(string add1, string add2, string add3, string town, string county, string postcode, string compname,string compwebsite, string companyintro, string businessdetail, string uusername)
        {
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "update recruiters rec, users usr, recusermapper rmap set rec.sRecruiterName =@compname , rec.sAddress1= @add1 , rec.sAddress2= @add2 , rec.sAddress3= @add3 , rec.sTown= @town , rec.sCounty= @county , rec.sPostcode= @postcode  ,rec.sWebsite= @compwebsite ,rec.sDescription= @companyintro ,rec.sCompletedesc= @businessdetail where  rec.empid = rmap.empid and rmap.idusers = usr.idusers and usr.uusername = @uusername and usr.uUserType = 1;";
                   
                    com.Parameters.Add("@compname", MySqlDbType.VarChar).Value = compname;
                    com.Parameters.Add("@add1", MySqlDbType.VarChar).Value = add1;
                    com.Parameters.Add("@add2", MySqlDbType.VarChar).Value = add2;
                    com.Parameters.Add("@add3", MySqlDbType.VarChar).Value = add3;
                    
                    com.Parameters.Add("@town", MySqlDbType.VarChar).Value = town;
                    com.Parameters.Add("@county", MySqlDbType.VarChar).Value = county;
                    com.Parameters.Add("@postcode", MySqlDbType.VarChar).Value = postcode;
                    com.Parameters.Add("@compwebsite", MySqlDbType.VarChar).Value = compwebsite;
                    com.Parameters.Add("@companyintro", MySqlDbType.VarChar).Value = companyintro;
                    com.Parameters.Add("@businessdetail", MySqlDbType.VarChar).Value = businessdetail;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }


        }

        //get article id to update the logo
        public int getarticleids(string uusername)
        {
            int arrayrec=0;

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("SELECT sarticleid from recruiters rec, recusermapper rmap, users usr where rec.empid = rmap.empid and rmap.idusers = usr.idusers and usr.uusername ='" + uusername + "' limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec = reader.GetInt32(0);
                    }
                }

                else
                {
                    //return 0;
                }
                reader.Close();
            }

            return arrayrec;
         }

       


    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

namespace JB
{
    public class ClApps
    {
        //this adds applications to apps table
        public void AddApplication(string firstname,string lastname, string dateofbirth, string profilesummary, int mxdocid ,string aAppEmail)
        {            
           
            using (MySqlConnection con = new MySqlConnection())
            {
                
                con.ConnectionString = Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO Applications(dtEntered, aFirstName, aLastName, aDateofbirth, aProfileSummary, documentID, aApplicationEmail) values (@tdate, @firstname , @lastname , @dateofbirth, @profilesummary , @mxdocid , @aAppEmail);";

                    com.Parameters.Add("@tdate", MySqlDbType.DateTime).Value = DateTime.Now;
                    com.Parameters.Add("@firstname", MySqlDbType.VarChar).Value = firstname;
                    com.Parameters.Add("@lastname", MySqlDbType.VarChar).Value = lastname;
                    com.Parameters.Add("@dateofbirth", MySqlDbType.Date).Value = dateofbirth;
                    com.Parameters.Add("@profilesummary", MySqlDbType.VarChar).Value = profilesummary;
                    com.Parameters.Add("@mxdocid", MySqlDbType.Int32).Value = mxdocid;
                    com.Parameters.Add("@aAppEmail", MySqlDbType.VarChar).Value = aAppEmail;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

            
        }

        //this adds applications for candidates, who are registered in db.
        public void AddApplicationcan(int licandidateid, string firstname, string lastname, string dateofbirth, string profilesummary, int mxdocid, string aAppEmail)
        {
            
            using (MySqlConnection con = new MySqlConnection())
            {
               
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO Applications(licandidateid, dtEntered, aFirstName, aLastName, aDateofbirth, aProfileSummary, documentID, aApplicationEmail) values (@licandidateid, @tdate, @firstname , @lastname , @dateofbirth, @profilesummary , @mxdocid , @aAppEmail);";

                    com.Parameters.Add("@tdate", MySqlDbType.DateTime).Value = DateTime.Now;
                    com.Parameters.Add("@firstname", MySqlDbType.VarChar).Value = firstname;
                    com.Parameters.Add("@lastname", MySqlDbType.VarChar).Value = lastname;
                    com.Parameters.Add("@dateofbirth", MySqlDbType.Date).Value = dateofbirth;
                    com.Parameters.Add("@profilesummary", MySqlDbType.VarChar).Value = profilesummary;
                    com.Parameters.Add("@mxdocid", MySqlDbType.Int32).Value = mxdocid;
                    com.Parameters.Add("@aAppEmail", MySqlDbType.VarChar).Value = aAppEmail;
                    com.Parameters.Add("@licandidateid", MySqlDbType.Int32).Value = licandidateid;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }


        }

        //This maps applications table to jobs table, update lookup
        public void AddApplicationMapping(int jobid, int applicationid)
        {
            
         
            using (MySqlConnection con = new MySqlConnection())
            {
                
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO appjobmapper(idapplications, idjobs) values (@applicationid , @jobid );";

                    com.Parameters.Add("@applicationid", MySqlDbType.Int32).Value = applicationid;
                    com.Parameters.Add("@jobid", MySqlDbType.Int32).Value = jobid;
                    
                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }


        }

        //get maximum document id
        public int getmaxdocid()
        {
           
            int maxval = 0;

            MySqlConnection connreader = new MySqlConnection();
            
            connreader.ConnectionString = Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select max(documentid)+1 from documents limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        maxval =  reader.GetInt32(0);
                     

                        //return maxval;

                    }
                }

                else
                {
                    return 0;
                }
                reader.Close();
            }
            return maxval;
        }

        //get maximum application id
        public int getmaxappid()
        {
           
            int maxval = 0;

            MySqlConnection connreader = new MySqlConnection();
            
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select max(idapplications)+1 from applications limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        maxval = reader.GetInt32(0);

                    }
                }

               
                reader.Close();
            }
            return maxval;
        }

        //add document like resumes etc.
        public void Adddocuments(string documentname, string doc_url)
        {
            

            using (MySqlConnection con = new MySqlConnection())
            {
                
                con.ConnectionString = Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO documents( documentname,doc_url) values (@documentname, @doc_url);";

                    com.Parameters.Add("@documentname", MySqlDbType.VarChar).Value = documentname;
                    com.Parameters.Add("@doc_url", MySqlDbType.VarChar).Value = doc_url;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }


        }

        //this get current application from it's id
        public DataSet getApplication(int applicationname)
        {
            DataSet Ds = new DataSet();
            
            string myconstring = Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("select idapplications, aFirstname, aLastname, stitle, dtentered, aprofilesummary, completeurl from getapp where empid="+ applicationname +";", mycon);
            
            mycon.Open();

            myda.Fill(Ds, "getapp");

            mycon.Close();

            return Ds;

        }

        //get get application details for jobseeker
        public string[] getapplicationdetails(int applyid)
        {
            //store details
            string[] tempst= new string[2];

            MySqlConnection connreader = new MySqlConnection();
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select idapplications, aprofilesummary, completeurl from getapp where idapplications = "+ applyid +" limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        tempst[0] = reader.GetString(1);
                        tempst[1] = reader.GetString(2);
                    }
                }

                else
                {
                    return null;
                }
                reader.Close();
            }

            return tempst;
        }


    }
}

﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;

namespace JB
{
    public class CLMainpagepopulator
    {  
        //aggregate block
        /////////////////////////////////////////////
        //get job count
        public int getcountjobs()
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            int ct = 0;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand(
                  "SELECT count(idjobs) FROM jobs where sjobenddate>= curdate();",
                  connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ct = reader.GetInt32(0);
                    }
                }
                else
                {
                    //ct = 0;
                }
                reader.Close();
            }
            return ct;
       
        }

        //get total recs
        public int getcountrecs()
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            int ct = 0;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand(
                  "SELECT count(empid) FROM recruiters;",
                  connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                       ct = reader.GetInt32(0);
                    }
                }
                else
                {
                    //ct = 0;
                }
                reader.Close();
            }
            return ct;

        }

        //get advertizing rec count
        public int getcountrecswadvert()
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString = Clconnect.makeconn();

            int ct = 0;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand(
                  "SELECT count(empid) FROM getallrec;",
                  connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ct = reader.GetInt32(0);
                    }
                }
                else
                {
                    //ct = 0;
                }
                reader.Close();
            }
            return ct;

        }

     
        //gets max jobs
        public int getmaxjobid()
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString = Clconnect.makeconn();

            int ct = 0;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand(
                  "SELECT max(idjobs)+1 FROM jobs;",
                  connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {                  
                        ct = reader.GetInt32(0);
                    }
                }
                else
                {
                    //Console.WriteLine("No rows found.");
                }
                reader.Close();
            }
            return ct;
        }

   
        //delete current categories
        public void deletejobs(int jobid)
        {
            MySql.Data.MySqlClient.MySqlConnection conn;
            MySql.Data.MySqlClient.MySqlCommand cmd;

            conn = new MySql.Data.MySqlClient.MySqlConnection();
            cmd = new MySql.Data.MySqlClient.MySqlCommand();

            //getmax rec
            //int maxrec;
            //byte sIsFeatured = 1;

            string myquerystring;
            myquerystring = "delete from jobtable where idjobs = '"+ jobid +"' and catid !=10000 and termid !=10000; ";
             
            conn.ConnectionString = Clconnect.makeconn();

            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = myquerystring;
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        //add jobs
        public void insertjobs(int idjobs, string sTitle, string sShortDescription, string sDescription, string ssalarytext, int ssalarymin, int ssalarymax, string sref, string startdate, string enddate)
        {
            //myquerystring = "INSERT INTO jobs values ('" + idjobs + "','" + sTitle + "','" + sShortDescription + "' ,'" + sDescription + "', '" + DateTime.Now.ToString("yyyy:MM:dd hh:mm:ss") + "' ,'" + ssalarytext + "'  ,'" + ssalarymin + "'  ,'" + ssalarymax + "' ,'" + sref + "', '" + sTitle + "', '" + Convert.ToDateTime(startdate).ToString("yyyy:MM:dd hh:mm:ss") + "', '" + Convert.ToDateTime(enddate).ToString("yyyy:MM:dd hh:mm:ss") + "' )";
                
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString = Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO jobs values (@idjobs ,@sTitle ,@sShortDescription ,@sDescription ,@dtentered ,@ssalarytext  ,@ssalarymin  ,@ssalarymax ,@sref ,@sTitle , @startdate , @enddate);";

                    com.Parameters.Add("@idjobs", MySqlDbType.Int32).Value = idjobs;
                    com.Parameters.Add("@sTitle", MySqlDbType.VarChar).Value = sTitle;
                    com.Parameters.Add("@sShortDescription", MySqlDbType.VarChar).Value = sShortDescription;
                    com.Parameters.Add("@sDescription", MySqlDbType.Text).Value = sDescription;
                    com.Parameters.Add("@dtentered", MySqlDbType.DateTime).Value = DateTime.Now;
                    com.Parameters.Add("@ssalarytext", MySqlDbType.VarChar).Value = ssalarytext;
                    com.Parameters.Add("@ssalarymin", MySqlDbType.Int16).Value = ssalarymin;
                    com.Parameters.Add("@ssalarymax", MySqlDbType.Int16).Value = ssalarymax;
                    com.Parameters.Add("@sref", MySqlDbType.VarChar).Value = sref;
                    com.Parameters.Add("@startdate", MySqlDbType.Date).Value = startdate;
                    com.Parameters.Add("@enddate", MySqlDbType.Date).Value = enddate;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }


        //add job rec assignments        
        public void insertjobmapping(int idjobs,int catid, int litermid, int empid)
        {
            

            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 

                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO jobtable(idjobs,  catid, termid, empid) values (@idjobs ,@catid , @litermid ,@empid );";

                    com.Parameters.Add("@idjobs", MySqlDbType.Int32).Value = idjobs;
                    com.Parameters.Add("@catid", MySqlDbType.Int32).Value = catid;
                    com.Parameters.Add("@litermid", MySqlDbType.Int32).Value = litermid;
                    com.Parameters.Add("@empid", MySqlDbType.Int32).Value = empid;
                    
                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }


        }
  
       
        //get jobdetails page
        public string getcurrrec(string empid)
        {
            //store rec details
            string arrayrec = string.Empty;

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("SELECT replace(article_data,'c:/testdir/','/articles/')asarticle_data from recruiters,Articles where recruiters.sArticleID=Articles.sArticleID and recruiters.EmpID ='" + empid + "' limit 1;", connreader);
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
                    return null;
                }
                reader.Close();
            }
            return arrayrec;
        }

        //get rec details page
        public string[] getdetailspage(int jobid)
        {
            //store rec details
            string[] arrayrec = new string[10];

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select jobs.*, recruiters.sRecruiterName, recruiters.sEmailAddress, recruiters.sWebsite,recruiters.EmpID from jobs, jobtable, recruiters where jobs.idJobs=jobtable.idJobs and jobtable.EmpID=recruiters.EmpID and jobs.idJobs = '" + jobid + "' limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec[0] = reader.GetString("sTitle");
                        arrayrec[1] = reader.GetString("sRef");
                        arrayrec[2] = reader.GetString("sDescription");
                        arrayrec[3] = reader.GetString("sJobstartdate");
                        arrayrec[4] = reader.GetString("sRecruiterName");
                        arrayrec[5] = reader.GetString("sEmailAddress");
                        arrayrec[6] = reader.GetString("sWebsite");
                        arrayrec[7] = reader.GetString("EmpID");

                    }
                }

                else
                {
                    return null;
                }
                reader.Close();
            }
            return arrayrec;
        }

        //get details page 
        public string getdetailspagecats(int jobid, int cats)
        {
            //store rec details
            StringBuilder sbr = new StringBuilder();

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select sterm from getdetailspages where idJobs= " + jobid + " and catid = " + cats +  " ;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        sbr.Append(reader.GetString(0));
                        sbr.Append("<br>");
                    }
                }

                else
                {
                    //return null;
                }
                reader.Close();
            }

            return sbr.ToString();
        }
        
        //get details for salaries
        //get details page 
        public string getdetailspagecats(int jobid, int cats,int jobsal)
        {
            //store rec details
            StringBuilder sbr = new StringBuilder();


            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select minrange,maxrange from getdetailspages where idJobs= " + jobid + " and catid = " + cats + " order by minrange;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                int i=0;
                string j = string.Empty;
                string k = string.Empty;

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        if (i == 0)
                        {                            
                            k= reader.GetString(0);                            
                        }

                        
                        j=reader.GetString(1);
                        i++;
                    }
                }
                                    

                else
                {
                    //Console.WriteLine("No rows found.");
                }

                //check which value is greater

                    sbr.Append(k);
                    sbr.Append(" - ");
                    sbr.Append(j);
                

                reader.Close();
            }

            return sbr.ToString();
        }
      

        //fill in jobs form
        public string[] filljobform(int jobid)
        {
            //store rec details
            string[] arrayrec = new string[10];

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select * from jobs where idJobs = " + jobid + " limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec[0] = reader.GetString("sTitle");
                        arrayrec[1] = reader.GetString("sShortDescription");
                        arrayrec[2] = reader.GetString("sJobstartdate");
                        arrayrec[3] = reader.GetString("sJobenddate");
                        arrayrec[4] = reader.GetString("sSalaryText");
                        arrayrec[5] = reader.GetString("sRef");
                        arrayrec[6] = reader.GetString("sDescription");

                        
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

        public DataSet getSalary()
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT termid, sTerm from terms where termid >= 6000 and termid <7000 order by termid;", mycon);

            mycon.Open();

            myda.Fill(Ds, "Terms");

            mycon.Close();

            return Ds;
        }

        //location checkbox populate
        public DataSet getLocations()
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT termid, sTerm from terms where termid > 4000 and termid <5000 order by termid;", mycon);

            mycon.Open();

            myda.Fill(Ds, "Terms");

            mycon.Close();

            return Ds;
        }

        //industries checkbox populate
        public DataSet getIndustries()
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT termid, sTerm from terms where termid >= 5000 and termid<6000;", mycon);

            mycon.Open();

            myda.Fill(Ds, "Terms");

            mycon.Close();

            return Ds;

        }

        //salaries checkbox populate
        public DataSet getsalaries()
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT termid, sTerm from terms where termid >= 6000 and termid < 7000 ;", mycon);

            mycon.Open();

            myda.Fill(Ds, "Terms");

            mycon.Close();

            return Ds;

        }
        
        //get jobs
        public DataSet getJobs()
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT * from getjobs;", mycon);

            mycon.Open();

            myda.Fill(Ds, "getjobs");

            mycon.Close();

            return Ds;

        }

        //get jobs for simple search. this makes app run faster, no complex filtering
        public DataSet getJobssingle()
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT * from Aggregatedmpage limit 1000;", mycon);

            mycon.Open();

            myda.Fill(Ds, "Aggregatedmpage");

            mycon.Close();

            return Ds;

        }

        //get recruiterid by name
        public int RecName(string usrname)
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            int ct = 0;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select rec.EmpID from recruiters rec, recusermapper rmap, users usr where rec.EmpID  = rmap.EmpID and rmap.idUsers = usr.idUsers and usr.uUsername = '"+ usrname +"' limit 1;",   connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {                        
                        ct = reader.GetInt32(0);
                    }
                }
                else
                {
                    //Console.WriteLine("No rows found.");
                }
                reader.Close();
            }
            return ct;
        }

        //get recruiter inactive jobs
        public DataSet getJobssingle(int sEmpID)
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT * from getjobssingle where EmployeeID = '"+ sEmpID +"';", mycon);

            mycon.Open();

            myda.Fill(Ds, "getjobs");

            mycon.Close();

            return Ds;

        }
          
        //get recruiter active jobs
        public DataSet getJobssinglearchived(int sEmpID)
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT * from getjobssinglearch where EmployeeID = '" + sEmpID + "';", mycon);

            mycon.Open();

            myda.Fill(Ds, "getjobssinglearch");

            mycon.Close();

            return Ds;

        }        

        //gets max recruiters
        public int RecHasRows()
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString = Clconnect.makeconn();

            int ct = 0;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand(
                  "SELECT max(Empid) FROM recruiters;",
                  connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ct = reader.GetInt32(0);
                    }
                }
                else
                {
                    //Console.WriteLine("No rows found.");
                }
                reader.Close();
            }
            return ct;
        }
        
        //max user id
        public int maxuserid()
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString = Clconnect.makeconn();

            int ct = 0;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("SELECT max(idUsers)+1 FROM users;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ct = reader.GetInt32(0);
                    }
                }
                else
                {
                    //Console.WriteLine("No rows found.");
                }
                reader.Close();
            }
            return ct;
        }

        //max candidate id
        public int maxcandidateid()
        {
            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            int ct = 0;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand( "SELECT max(idCandidates)+1 FROM candidates;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {   
                        ct = reader.GetInt32(0);
                    }
                }
                else
                {
                    //Console.WriteLine("No rows found.");
                }
                reader.Close();
            }
            return ct;
        }

        //add candidates
        public void insertcandidates(int maxcanid, string cCandidateName, string cFirstName, string cLastName, string cAddress1, string cAddress2, string cAddress3, string cTown, string cCounty, string cCountry, string cPostcode, string sWebsite, string hphone, string wphone, string cdtEntered,string dateofbirth)
        {
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO candidates values (@maxcanid ,@cCandidateName ,@cFirstName , @cLastName , @cAddress1 ,@cAddress2 ,@cAddress3 ,@cTown ,@cCounty ,@cPostcode ,@hphone ,@wphone , @cdtEntered ,@cCountry, @dateofbirth);";

                    com.Parameters.Add("@maxcanid", MySqlDbType.Int32).Value = maxcanid;
                    com.Parameters.Add("@cCandidateName", MySqlDbType.VarChar).Value = cFirstName+" "+cLastName;
                    com.Parameters.Add("@cFirstName", MySqlDbType.VarChar).Value = cFirstName;
                    com.Parameters.Add("@cLastName", MySqlDbType.VarChar).Value = cLastName;
                    com.Parameters.Add("@cAddress1", MySqlDbType.VarChar).Value = cAddress1;
                    com.Parameters.Add("@cAddress2", MySqlDbType.VarChar).Value = cAddress2;
                    com.Parameters.Add("@cAddress3", MySqlDbType.VarChar).Value = cAddress3;
                    com.Parameters.Add("@cTown", MySqlDbType.VarChar).Value = cTown;
                    com.Parameters.Add("@cCounty", MySqlDbType.VarChar).Value = cCounty;
                    com.Parameters.Add("@cpostcode", MySqlDbType.VarChar).Value = cPostcode;
                    com.Parameters.Add("@hphone", MySqlDbType.VarChar).Value = hphone;
                    com.Parameters.Add("@wphone", MySqlDbType.VarChar).Value = wphone;
                    com.Parameters.Add("cdtEntered", MySqlDbType.DateTime).Value = DateTime.Now;
                    com.Parameters.Add("@cCountry", MySqlDbType.VarChar).Value = cCountry;
                    com.Parameters.Add("@dateofbirth", MySqlDbType.Date).Value = dateofbirth;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }

        //add candidates mapping, we moved one to one from one to many mapping, review that we need lookup?
        public void insertcandidatemapping(int userid, int idcandidates)
        {

            MySql.Data.MySqlClient.MySqlConnection conn;
            MySql.Data.MySqlClient.MySqlCommand cmd;

            conn = new MySql.Data.MySqlClient.MySqlConnection();
            cmd = new MySql.Data.MySqlClient.MySqlCommand();

            string myquerystring;
            myquerystring = "INSERT INTO canusermapper(idCandidates, idUsers) values ('" + idcandidates + "','" + userid + "')";
             
            conn.ConnectionString =  Clconnect.makeconn();

            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = myquerystring;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        
        //add recruiters
        public void insertrecruiters(int maxrec, string sRecruiterName, string sAddress1, string sAddress2 ,string sAddress3, string sTown, string sCounty ,string sCountry, string sPostcode, string sEmailAddress, string sWebsite, string sDescription, string sCompleteDesc, string sdtEntered, int sEnteredbyID, int sArticleId )
        {
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString = Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO recruiters values (@maxrec ,@sRecruiterName ,@sAddress1 ,@sAddress2 ,@sAddress3 ,@sTown ,@sCounty ,@sCountry ,@sPostcode ,@sEmailAddress ,@sWebsite ,@sDescription ,@sCompleteDesc ,@sdtEntered ,@sEnteredbyID , 1,@sArticleId ,1 );";

                    com.Parameters.Add("@maxrec", MySqlDbType.Int32).Value = maxrec;
                    com.Parameters.Add("@sRecruiterName", MySqlDbType.VarChar).Value = sRecruiterName;
                    com.Parameters.Add("@sAddress1", MySqlDbType.VarChar).Value = sAddress1;
                    com.Parameters.Add("@sAddress2", MySqlDbType.VarChar).Value = sAddress2;
                    com.Parameters.Add("@sAddress3", MySqlDbType.VarChar).Value = sAddress3;
                    com.Parameters.Add("@sTown", MySqlDbType.VarChar).Value = sTown;
                    com.Parameters.Add("@sCounty", MySqlDbType.VarChar).Value = sCounty;
                    com.Parameters.Add("@spostcode", MySqlDbType.VarChar).Value = sPostcode;
                    com.Parameters.Add("@sCountry", MySqlDbType.VarChar).Value = sCountry;
                    com.Parameters.Add("@sEmailAddress", MySqlDbType.VarChar).Value = sEmailAddress;
                    com.Parameters.Add("@sWebsite", MySqlDbType.VarChar).Value = sWebsite;
                    com.Parameters.Add("@sDescription", MySqlDbType.VarChar).Value = sDescription;
                    com.Parameters.Add("@sCompleteDesc", MySqlDbType.Text).Value = sCompleteDesc;
                    com.Parameters.Add("@sdtEntered", MySqlDbType.DateTime).Value = DateTime.Now;
                    com.Parameters.Add("@sEnteredbyID", MySqlDbType.Int32).Value = sEnteredbyID;
                    com.Parameters.Add("@sArticleId", MySqlDbType.Int32).Value = sArticleId;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }

        //add users
        public void insertusers(string rusername,string fname,int uisprimary, string lname, string rpassword,int rtype,int idUsers, string pwdhint, int ucandidateid, string uhash)
        {
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO users(idusers, uusertype, uusername, upassword, upasswordhint, uFirstName, uLastName, uIsPrimary, uCandidateID, uActivation) values (@idUsers ,@rtype ,@rusername ,@rpassword ,@pwdhint ,@fname ,@lname ,1 , @ucandidateid, @uhash);";

                    com.Parameters.Add("@idUsers", MySqlDbType.Int32).Value = idUsers;
                    com.Parameters.Add("@rtype", MySqlDbType.Int16).Value = rtype;
                    com.Parameters.Add("@rusername", MySqlDbType.VarChar).Value = rusername;
                    com.Parameters.Add("@rpassword", MySqlDbType.VarChar).Value = rpassword;
                    com.Parameters.Add("@pwdhint", MySqlDbType.VarChar).Value = pwdhint;
                    com.Parameters.Add("@fname", MySqlDbType.VarChar).Value = fname;
                    com.Parameters.Add("@lname", MySqlDbType.VarChar).Value = lname;
                    com.Parameters.Add("@ucandidateid", MySqlDbType.Int32).Value = ucandidateid;
                    com.Parameters.Add("@uhash", MySqlDbType.VarChar).Value = uhash;
                    
                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }

        //add rec user mapping
        public void insertrecusermapping(int empid, int userid)
        {
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString = Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO RecUserMapper(EmpID, idUsers) values (@empid ,@userid );";

                    com.Parameters.Add("@empid", MySqlDbType.Int32).Value = userid;
                    com.Parameters.Add("@userid", MySqlDbType.Int32).Value = empid;
                    
                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

        }

        //getrecruiterdetails
        public string[] RecDetails(string usrname)
        {
            //store rec details
            string[] arrayrec = new string[16];

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select rec.*,usr.* from recruiters rec, recusermapper rmap, users usr where rec.EmpID  = rmap.EmpID and rmap.idUsers = usr.idUsers and usr.uUsername = '" + usrname + "' limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec[0] = reader.GetString("uFirstName");
                        arrayrec[1] = reader.GetString("uLastName");
                        arrayrec[2] = reader.GetString("sRecruiterName");

                        arrayrec[3] = reader.GetString("sAddress1");
                        arrayrec[4] = reader.GetString("sAddress2");
                        arrayrec[5] = reader.GetString("sAddress3");
                        arrayrec[6] = reader.GetString("sTown");
                        arrayrec[7] = reader.GetString("sCounty");
                        arrayrec[8] = reader.GetString("sCountry");                      
                        arrayrec[9] = reader.GetString("sPostcode");

                        arrayrec[10] = "XXXXXXXXXX";
                        arrayrec[11] = reader.GetString("uPasswordHint");

                        arrayrec[12] = reader.GetString("sEmailAddress");
                        arrayrec[13] = reader.GetString("sWebsite");

                        arrayrec[14] = reader.GetString("sdescription");
                        arrayrec[15] = reader.GetString("scompletedesc");

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

        //edit jobs
        public void updatejobs(int idjobs, string sTitle, string sShortDescription, string sDescription, string ssalarytext, int ssalarymin, int ssalarymax, string sref, string sdate, string edate)
        {
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString = Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "UPDATE jobs SET sTitle=@sTitle , sShortDescription = @sShortDescription ,sDescription = @sDescription , dtentereddate= @curdates , ssalarytext = @ssalarytext ,sminsal = @ssalarymin , smaxsal = @ssalarymax , sref = @sref , sfreetext= @sTitle , sjobstartdate = @sdate , sjobenddate= @edate where idjobs = @idjob;";

                    com.Parameters.Add("@sTitle", MySqlDbType.VarChar).Value = sTitle;
                    com.Parameters.Add("@sShortDescription", MySqlDbType.VarChar).Value = sShortDescription;
                    com.Parameters.Add("@sDescription", MySqlDbType.Text).Value = sDescription;
                    com.Parameters.Add("@curdates", MySqlDbType.DateTime).Value = DateTime.Now;
                    com.Parameters.Add("@ssalarytext", MySqlDbType.VarChar).Value = ssalarytext;
                    com.Parameters.Add("@ssalarymin", MySqlDbType.Int32).Value = ssalarymin;
                    com.Parameters.Add("@ssalarymax", MySqlDbType.Int32).Value = ssalarymax;
                    com.Parameters.Add("@sref", MySqlDbType.VarChar).Value = sref;
                    com.Parameters.Add("@sdate", MySqlDbType.Date).Value = sdate;
                    com.Parameters.Add("@edate", MySqlDbType.Date).Value = edate;
                    com.Parameters.Add("@idjob", MySqlDbType.Int32).Value = idjobs;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }


        }
        
        //get user my applications
        public DataSet getmyapps(string uusername)
        {
            DataSet Ds = new DataSet();

             
            string myconstring = Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT * from getmyapps where uusername='"+ uusername +"' ;", mycon);

            mycon.Open();

            myda.Fill(Ds, "getmyapps");

            mycon.Close();

            return Ds;

        }
    
        //get candidate detail page
        public string[] getcandidatedetails(string susername)
        {
            //store rec details
            string[] arrayrec = new string[12];

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString = Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("SELECT cfirstname, clastname, caddress1, caddress2, caddress3, ctown, ccounty, ccountry, cpostcode, chomephone, cworkphone , uusername, cdateofbirth FROM getusercans where uusername = '" + susername + "' limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec[0] = reader.GetString("cfirstname");
                        arrayrec[1] = reader.GetString("clastname");
                        arrayrec[2] = reader.GetString("caddress1");
                        arrayrec[3] = reader.GetString("caddress2");
                        arrayrec[4] = reader.GetString("caddress3");
                        arrayrec[5] = reader.GetString("ctown");
                        arrayrec[6] = reader.GetString("ccounty");
                        arrayrec[7] = reader.GetString("ccountry");
                        arrayrec[8] = reader.GetString("cpostcode");
                        arrayrec[9] = reader.GetString("chomephone");
                        arrayrec[10] = reader.GetString("cworkphone");
                        arrayrec[11] = reader.GetString("cdateofbirth");

                
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

        

    }
}

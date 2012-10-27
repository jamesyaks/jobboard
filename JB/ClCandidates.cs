﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace JB
{
    public class ClCandidates
    {
        
        //this updates candidates profiles
        public void runcandidateupdate(string cfirstname, string clastname, string address1, string address2, string address3, string town, string county, string country, string dateofbirth, string postcode, string hometel, string worktel, string uusername)
        {
            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "update users usr, candidates can SET can.cCandidateName= @candidaten , can.cFirstName=@cfirstname, can.cLastName =@clastname, can.cAddress1=@cAddress1, can.cAddress2=@cAddress2, can.cAddress3=@cAddress3, can.cTown = @cTown, can.cCounty=@cCounty, can.cCountry=@cCountry, can.cPostcode=@cPostcode, can.cDateofBirth=@dateofbirth ,can.cHomephone=@hometel ,can.cWorkphone=@worktel where can.idcandidates = usr.ucandidateid and usr.uusertype=2 and usr.uusername=@uusername ;";

                    com.Parameters.Add("@cfirstname", MySqlDbType.VarChar).Value = cfirstname;
                    com.Parameters.Add("@clastname", MySqlDbType.VarChar).Value = clastname;
                    com.Parameters.Add("@cAddress1", MySqlDbType.VarChar).Value = address1;
                    com.Parameters.Add("@cAddress2", MySqlDbType.VarChar).Value = address2;
                    com.Parameters.Add("@cAddress3", MySqlDbType.VarChar).Value = address3;
                    com.Parameters.Add("@cTown", MySqlDbType.VarChar).Value = town;
                    com.Parameters.Add("@cCounty", MySqlDbType.VarChar).Value = county;
                    com.Parameters.Add("@cCountry", MySqlDbType.VarChar).Value = country;
                    com.Parameters.Add("@cpostcode", MySqlDbType.VarChar).Value = postcode;
                    com.Parameters.Add("@dateofbirth", MySqlDbType.Date).Value = dateofbirth;
                    com.Parameters.Add("@hometel", MySqlDbType.VarChar).Value = hometel;
                    com.Parameters.Add("@worktel", MySqlDbType.VarChar).Value = worktel;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;
                    com.Parameters.Add("@candidaten", MySqlDbType.VarChar).Value = cfirstname+" "+clastname;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }

    
        }

        //user to get direct applications for candidates who have registered as can.
        public string[] getcandidatesindb(string uusername)
        {
            //fname, lname, dob, email

            //store rec details
            string[] arrayrec = new string[5];

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select usr.uusername, can.cfirstname, can.clastname, can.cdateofbirth, can.idCandidates from candidates can, users usr where can.idcandidates = usr.ucandidateid and usr.uUserName = '" + uusername + "' limit 1;", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        try
                        {
                            arrayrec[0] = reader.GetString(0);
                            arrayrec[1] = reader.GetString(1);
                            arrayrec[2] = reader.GetString(2);
                            arrayrec[3] = reader.GetString(3);
                            arrayrec[4] = reader.GetString(4);

                        }
                        catch
                        {
                            return null;
                        }
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
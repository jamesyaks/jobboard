using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class CLSearchfilters
    {
        //get filtered / searched values
        public DataSet applytitlefilter(string titles, string addedcrit)
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT distinct idjobs,stitle,sshortdescription,sfreetext, sdescription,dtentereddate,ssalarytext,sminsal,employeeid, smaxsal, applicationvolume from aggregatedmulti where match(sfreetext) against('" + titles + "') " + addedcrit +  " limit 1000;", mycon);
             
            mycon.Open();

            myda.Fill(Ds, "aggregatedmulti");

            mycon.Close();

            return Ds;
        }

        //get results returned by the Query
        public int getsearchcounts(string titles, string addedcrit)
        {
            //TimeSpan tspan = DateTime.Now.TimeOfDay;

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            int ct = 0;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand(
                  "SELECT count(idjobs)as idjobs from aggregatedmulti where match(sfreetext) against('" + titles + "') " + addedcrit + " ",
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
                    //return 0;
                }
                reader.Close();
            }

            
            return ct;

        }

        
    }
}
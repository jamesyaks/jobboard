using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
using System.Collections;

namespace JB
{
    public class ClJobs
    {
        //this is to populate the selections after the editjobs 
        //form has loaded...
        public ArrayList getmultitexts(int jobid)
        {
            //store rec details
            ArrayList __arrayrec = new ArrayList();
            MySqlConnection connreader = new MySqlConnection();             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("select termid from jobtable where idJobs = '" + jobid + "' ; ", connreader);
                connreader.Open();
                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {                        
                        __arrayrec.Add(reader.GetString("termid"));                        
                    }
                }
                
                reader.Close();
            }

            return __arrayrec;
        }
    }
}
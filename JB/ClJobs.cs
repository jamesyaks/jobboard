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
            connreader.ConnectionString = Clconnect.makeconn();

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
        
        public int checkrecruiter(int __jobid)
        {
            MySqlConnection connreader = new MySqlConnection();
            connreader.ConnectionString = Clconnect.makeconn();
            CLPwdhash passhash = new CLPwdhash();

            //string to hold data
            var __resultset = 0;

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("SELECT empid from jobtorecruiter where idjobs = @paramjobs limit 1;", connreader);
                command.Parameters.Add("@paramjobs", MySqlDbType.Int32).Value = __jobid;

                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        __resultset = reader.GetInt32(0);
                    }
                }

                reader.Close();
            }

            return __resultset;
        }

    }
}
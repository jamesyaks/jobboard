using System.Collections;
using MySql.Data.MySqlClient;

namespace JB
{
    public class DlJobs
    {
        //this is to populate the selections after the editjobs
        //form has loaded...
        public ArrayList Getmultitexts(int jobid)
        {
            //store rec details
            var __arrayrec = new ArrayList();
            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            using (connreader)
            {
                var command = new MySqlCommand("select termid from jobtable where idJobs = '" + jobid + "' ; ",
                                               connreader);
                connreader.Open();
                var reader = command.ExecuteReader();

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

        public int Checkrecruiter(int __jobid)
        {
            var connreader = new MySqlConnection();
            connreader.ConnectionString = Dlconnect.Makeconn();
            var passhash = new ClPwdhash();

            //string to hold data
            var __resultset = 0;

            using (connreader)
            {
                var command = new MySqlCommand("SELECT empid from jobtorecruiter where idjobs = @paramjobs limit 1;",
                                               connreader);
                command.Parameters.Add("@paramjobs", MySqlDbType.Int32).Value = __jobid;

                connreader.Open();

                var reader = command.ExecuteReader();

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
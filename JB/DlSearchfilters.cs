using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class DlSearchfilters
    {
        //get filtered / searched values
        public DataSet Applytitlefilter(string titles, string addedcrit)
        {
            var ds = new DataSet();

            string myconstring = Dlconnect.Makeconn();

            var mycon = new MySqlConnection {ConnectionString = myconstring};

            var myda =
                new MySqlDataAdapter(
                    "SELECT distinct idjobs,stitle,sshortdescription,sfreetext, sdescription,dtentereddate,ssalarytext,sminsal,employeeid, smaxsal, applicationvolume from aggregatedmulti where match(sfreetext) against('" +
                    titles + "') " + addedcrit + " limit 1000;", mycon);

            mycon.Open();

            myda.Fill(ds, "aggregatedmulti");

            mycon.Close();

            return ds;
        }

        //get results returned by the Query
        public int Getsearchcounts(string titles, string addedcrit)
        {
            //TimeSpan tspan = DateTime.Now.TimeOfDay;

            var connreader = new MySqlConnection {ConnectionString = Dlconnect.Makeconn()};

            var ct = 0;

            using (connreader)
            {
                var command = new MySqlCommand(
                    "SELECT count(idjobs)as idjobs from aggregatedmulti where match(sfreetext) against('" + titles +
                    "') " + addedcrit + " ",
                    connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ct = reader.GetInt32(0);
                    }
                }
                reader.Close();
            }


            return ct;
        }
    }
}
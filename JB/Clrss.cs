using System.Globalization;
using System.Linq;
using MySql.Data.MySqlClient;

namespace JB
{
    public class Clrss
    {
        public string[,] Getrss()
        {
            var connreader = new MySqlConnection {ConnectionString = Dlconnect.Makeconn()};

            var ct = new string[4,10];
            ct.AsParallel();

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT idjobs, stitle, sshortdescription, sjobenddate FROM jobs where sjobenddate>= curdate() order by sjobenddate desc limit 10;",
                        connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                var i = 0;

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ct[0, i] = reader.GetFloat(0).ToString(CultureInfo.InvariantCulture);
                        ct[1, i] = reader.GetString(1);
                        ct[2, i] = reader.GetString(2);
                        ct[3, i] = reader.GetDateTime(3).ToString(CultureInfo.InvariantCulture);
                        i++;
                    }
                }
                reader.Close();
            }
            return ct;
        }
    }
}
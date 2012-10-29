using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class Dlsubscriptions
    {
        //add email subscriptions
        public void Addsubscriptions(string emailaddr, int catid, int termid)
        {
            using (var con = new MySqlConnection())
            {
                con.ConnectionString = Dlconnect.Makeconn();
                con.Open();

                using (var com = con.CreateCommand())
                {
                    com.CommandType = CommandType.Text;
                    com.CommandText =
                        "INSERT INTO tb_subscriptions(emailaddress, catid, termid) values ( @emailaddr, @catid, @termid );";

                    com.Parameters.Add("@emailaddr", MySqlDbType.VarChar).Value = emailaddr;
                    com.Parameters.Add("@catid", MySqlDbType.Int32).Value = catid;
                    com.Parameters.Add("@termid", MySqlDbType.Int32).Value = termid;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }
    }
}
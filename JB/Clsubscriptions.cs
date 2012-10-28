using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace JB
{
    public class Clsubscriptions
    {
        //add email subscriptions
        public void Addsubscriptions(string emailaddr, int catid, int termid)
        {
            using (MySqlConnection con = new MySqlConnection())
            {
                con.ConnectionString = Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO tb_subscriptions(emailaddress, catid, termid) values ( @emailaddr, @catid, @termid );";

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
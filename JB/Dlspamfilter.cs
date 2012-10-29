using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class Dlspamfilter
    {
        //add to spam table for later review of jobs voilating rules
        public void Addspamrec(int spamid, string spamreason, string remaddr, string usragnt, int pageid)
        {
            //
            using (var con = new MySqlConnection())
            {
                con.ConnectionString = Dlconnect.Makeconn();
                con.Open();

                using (var com = con.CreateCommand())
                {
                    com.CommandType = CommandType.Text;
                    com.CommandText =
                        "INSERT INTO tb_spamreport(spamindex, spamreason, dtentered, ipuser, useragents, jobid) values ( @spamid, @spamreason, @spamdates, @ipusr, @useragents, @pageid);";

                    com.Parameters.Add("@spamid", MySqlDbType.Int32).Value = spamid;
                    com.Parameters.Add("@spamreason", MySqlDbType.VarChar).Value = spamreason;
                    com.Parameters.Add("@spamdates", MySqlDbType.DateTime).Value = DateTime.Now;
                    com.Parameters.Add("@ipusr", MySqlDbType.VarChar).Value = remaddr;
                    com.Parameters.Add("@useragents", MySqlDbType.VarChar).Value = usragnt;
                    com.Parameters.Add("@pageid", MySqlDbType.Int32).Value = pageid;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace JB
{
    public class Clspamfilter
    {
        //add to spam table for later review of jobs voilating rules
        public void addspamrec(int spamid, string spamreason, string remaddr, string usragnt, int pageid)
        {

            //
            using (MySqlConnection con = new MySqlConnection())
            {
                 
                con.ConnectionString =  Clconnect.makeconn();
                con.Open();

                using (MySqlCommand com = con.CreateCommand())
                {
                    com.CommandType = System.Data.CommandType.Text;
                    com.CommandText = "INSERT INTO tb_spamreport(spamindex, spamreason, dtentered, ipuser, useragents, jobid) values ( @spamid, @spamreason, @spamdates, @ipusr, @useragents, @pageid);";

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
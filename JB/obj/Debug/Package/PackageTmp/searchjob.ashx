<%@ WebHandler Language="C#" Class="searchjob" %>

using System;
using System.Web;
using System.Configuration;
using System.Text;

namespace JB
{
    public class searchjob : IHttpHandler
    {
        /// <summary>
        /// This code is liscenced by ahrcloud.com
        /// under free creative common liscence, but 
        /// attribution must be made to the author
        /// site at www.ahrcloud.com or info@ahrcloud.com
        /// </summary>
        /// 
        public void ProcessRequest(HttpContext context)
        {
            string prefixText = context.Request.QueryString["q"];
            using (MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection())
            {
                conn.ConnectionString = Clconnect.makeconn();

                using (MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand())
                {
                    cmd.CommandText = "select sTitle from jobs where sTitle like @SearchText '%' and sjobenddate>=curdate();";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    StringBuilder sb = new StringBuilder();
                    conn.Open();
                    using (MySql.Data.MySqlClient.MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            sb.Append(sdr["sTitle"].ToString())
                                .Append(Environment.NewLine);
                        }
                    }
                    conn.Close();

                    context.Response.Write(sb.ToString());
                }
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}
<%@ WebHandler Language="C#" Class="searchrec" %>

using System;
using System.Web;
using System.Configuration;
using System.Text;
using JB;

public class searchrec : IHttpHandler
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
                cmd.CommandText = "select sRecruiterName from recruiters where sRecruiterName like @SearchText '%';";
                cmd.Parameters.AddWithValue("@SearchText", prefixText);
                cmd.Connection = conn;
                StringBuilder sb = new StringBuilder();
                conn.Open();
                using (MySql.Data.MySqlClient.MySqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        sb.Append(sdr["sRecruiterName"].ToString())
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
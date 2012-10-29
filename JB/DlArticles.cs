using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class DlArticles
    {
        //Add articles to database, they can be anything from resumes to other iternarys
        public void AddArticle(int sArticleID, string ArticleName, string Article_data)
        {
            using (var con = new MySqlConnection())
            {
                con.ConnectionString = Dlconnect.Makeconn();
                con.Open();

                using (var com = con.CreateCommand())
                {
                    com.CommandType = CommandType.Text;
                    com.CommandText = "INSERT INTO Articles values ( @sArticleID, @ArticleName, @Article_data);";

                    com.Parameters.Add("@sArticleID", MySqlDbType.Int32).Value = sArticleID;
                    com.Parameters.Add("@ArticleName", MySqlDbType.VarChar).Value = ArticleName;
                    com.Parameters.Add("@Article_data", MySqlDbType.VarChar).Value = Article_data;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }
    }
}
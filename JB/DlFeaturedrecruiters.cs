using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class DlFeaturedrecruiters
    {
        //get recruiters logo for profiles form
        public string Getrecformimage(int recsids)
        {
            //store rec details
            var arrayrec = string.Empty;

            var connreader = new MySqlConnection {ConnectionString = Dlconnect.Makeconn()};

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT article_data as Article_data from recruiters,Articles where recruiters.sArticleID=Articles.sArticleID and recruiters.empid = " +
                        recsids + " limit 1; ", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec = reader.GetString(0);
                    }
                }

                else
                {
                    return null;
                }
                reader.Close();
            }
            return arrayrec;
        }

        //this gets featured recruiters
        public DataSet GetFRecs()
        {
            var ds = new DataSet();


            var myconstring = Dlconnect.Makeconn();

            var mycon = new MySqlConnection {ConnectionString = myconstring};

            var myda =
                new MySqlDataAdapter(
                    "SELECT sRecruiterName as Sponsored, article_data as Article_data,  jobs.sTitle as sTitle, jobs.sshortdescription as descr, jobs.idjobs from recruiters, Articles, jobtable, jobs where recruiters.sArticleID=Articles.sArticleID and jobtable.empid = recruiters.empid and jobs.idjobs = jobtable.idjobs and jobs.sjobenddate>=curdate() and jobtable.catid= 10000 order by rand() limit 1;",
                    mycon);

            mycon.Open();

            myda.Fill(ds, "recruiters");

            mycon.Close();

            return ds;
        }
    }
}
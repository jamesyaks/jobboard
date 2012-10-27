using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;

namespace JB
{
    public class ClFeaturedrecruiters
    {

        //get recruiters logo for profiles form
        public string getrecformimage(int recsids)
        {
            //store rec details
            string arrayrec= string.Empty;

            MySqlConnection connreader = new MySqlConnection();
             
            connreader.ConnectionString =  Clconnect.makeconn();

            using (connreader)
            {
                MySqlCommand command = new MySqlCommand("SELECT replace(article_data,'c:/testdir/','/articles/')as Article_data from recruiters,Articles where recruiters.sArticleID=Articles.sArticleID and recruiters.empid = " + recsids + " limit 1; ", connreader);
                connreader.Open();

                MySqlDataReader reader = command.ExecuteReader();

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
            DataSet Ds = new DataSet();

             
            string myconstring = Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("SELECT sRecruiterName as Sponsored,replace(article_data,'c:/testdir/','/articles/')as Article_data,  jobs.sTitle as sTitle, jobs.sshortdescription as descr, jobs.idjobs from recruiters, Articles, jobtable, jobs where recruiters.sArticleID=Articles.sArticleID and jobtable.empid = recruiters.empid and jobs.idjobs = jobtable.idjobs and jobs.sjobenddate>=curdate() and jobtable.catid= 10000 order by rand() limit 1;", mycon);

            mycon.Open();

            myda.Fill(Ds, "recruiters");

            mycon.Close();

            return Ds;

        }

        
    }
}

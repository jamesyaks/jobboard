using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class DlRecruiter
    {
        //get recid via email/name
        public int Getrecid(string recname)
        {
            //store rec details
            var arrayrec = 0;

            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            using (connreader)
            {
                var command =
                    new MySqlCommand("SELECT empid from recruiters where sRecruiterName ='" + recname + "' limit 1;",
                                     connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec = reader.GetInt32(0);
                    }
                }

                reader.Close();
            }
            return arrayrec;
        }

        //this may not be used anymore, as we changed one to one from one to many relation, please review.
        public DataSet RecUsers(string userns)
        {
            var ds = new DataSet();

            var myconstring = Dlconnect.Makeconn();

            var mycon = new MySqlConnection { ConnectionString = myconstring };

            var myda =
                new MySqlDataAdapter(
                    "select usr.uUsername,usr.uFirstName, usr.uLastName,usr.uIsPrimary,usr.idUsers from recruiters rec, recusermapper rmap, users usr where rec.EmpID  = rmap.EmpID and rmap.idUsers = usr.idUsers and usr.uUsername = '" +
                    userns + "' limit 1;", mycon);

            mycon.Open();

            myda.Fill(ds, "usr");

            mycon.Close();

            return ds;
        }

        //get all recruiters with jobs
        public DataSet Getallrecwithjobs()
        {
            var ds = new DataSet();

            var myconstring = Dlconnect.Makeconn();

            var mycon = new MySqlConnection { ConnectionString = myconstring };

            var myda = new MySqlDataAdapter("select * from getallrec;", mycon);

            mycon.Open();

            myda.Fill(ds, "getallrec");

            mycon.Close();

            return ds;
        }

        //get one rec detail with recid
        public DataSet Getcurrrecwithempid(string empid)
        {
            var ds = new DataSet();

            var myconstring = Dlconnect.Makeconn();

            var mycon = new MySqlConnection { ConnectionString = myconstring };

            var myda =
                new MySqlDataAdapter(
                    "select article_data as article_data, sCompleteDesc, sWebsite, sEmailAddress from getallrec where empid = " +
                    empid + " limit 1;", mycon);

            mycon.Open();

            myda.Fill(ds, "recruiters");

            mycon.Close();

            return ds;
        }

        //get contact person details page
        public string Contactperson(string jobid)
        {
            //store rec details
            var arrayrec = string.Empty;

            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT concat_ws(' ',uFirstname,' ',uLastName) from recusers where idjobs ='" + jobid +
                        "' limit 1;", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec = reader.GetString(0);
                    }
                }

                reader.Close();
            }
            return arrayrec;
        }

        //update recuser with id = 1;
        public void Runrecuserupdate(string fname, string lname, string uusername)
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
                        "Update users set uFirstName = @fname , uLastName = @lname where uUserName = @uusername and uUserType=1;";

                    com.Parameters.Add("@fname", MySqlDbType.VarChar).Value = fname;
                    com.Parameters.Add("@lname", MySqlDbType.VarChar).Value = lname;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //logo update for recruiters with id = 1;
        public void Runreclogoupdate(string articleData, string articlename, string uusername)
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
                        "UPDATE articles arc, recruiters rec, recusermapper rmap, users usr SET arc.Article_data = @Article_data, arc.articlename=@Articlename where arc.sarticleid = rec.sarticleid and rmap.empid = rec.empid and rmap.idusers = usr.idusers and usr.uusername = @uusername and usr.uUserType = 1;";

                    com.Parameters.Add("@Article_data", MySqlDbType.VarChar).Value = articleData;
                    com.Parameters.Add("@Articlename", MySqlDbType.VarChar).Value = articlename;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //update recruiter table information
        public void Runrectableupdate(string add1, string add2, string add3, string town, string county, string postcode,
                                      string compname, string compwebsite, string companyintro, string businessdetail,
                                      string uusername)
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
                        "update recruiters rec, users usr, recusermapper rmap set rec.sRecruiterName =@compname , rec.sAddress1= @add1 , rec.sAddress2= @add2 , rec.sAddress3= @add3 , rec.sTown= @town , rec.sCounty= @county , rec.sPostcode= @postcode  ,rec.sWebsite= @compwebsite ,rec.sDescription= @companyintro ,rec.sCompletedesc= @businessdetail where  rec.empid = rmap.empid and rmap.idusers = usr.idusers and usr.uusername = @uusername and usr.uUserType = 1;";

                    com.Parameters.Add("@compname", MySqlDbType.VarChar).Value = compname;
                    com.Parameters.Add("@add1", MySqlDbType.VarChar).Value = add1;
                    com.Parameters.Add("@add2", MySqlDbType.VarChar).Value = add2;
                    com.Parameters.Add("@add3", MySqlDbType.VarChar).Value = add3;

                    com.Parameters.Add("@town", MySqlDbType.VarChar).Value = town;
                    com.Parameters.Add("@county", MySqlDbType.VarChar).Value = county;
                    com.Parameters.Add("@postcode", MySqlDbType.VarChar).Value = postcode;
                    com.Parameters.Add("@compwebsite", MySqlDbType.VarChar).Value = compwebsite;
                    com.Parameters.Add("@companyintro", MySqlDbType.VarChar).Value = companyintro;
                    com.Parameters.Add("@businessdetail", MySqlDbType.VarChar).Value = businessdetail;
                    com.Parameters.Add("@uusername", MySqlDbType.VarChar).Value = uusername;

                    int reslt = com.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        //get article id to update the logo
        public int Getarticleids(string uusername)
        {
            var arrayrec = 0;

            var connreader = new MySqlConnection { ConnectionString = Dlconnect.Makeconn() };

            using (connreader)
            {
                var command =
                    new MySqlCommand(
                        "SELECT sarticleid from recruiters rec, recusermapper rmap, users usr where rec.empid = rmap.empid and rmap.idusers = usr.idusers and usr.uusername ='" +
                        uusername + "' limit 1;", connreader);
                connreader.Open();

                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        arrayrec = reader.GetInt32(0);
                    }
                }

                reader.Close();
            }

            return arrayrec;
        }
    }
}
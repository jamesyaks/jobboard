using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class DlJobviewdata
    {
        //this adds detail page views
        public void Addview(int empid, string dtentered)
        {
            var conn = new MySqlConnection();
            var cmd = new MySqlCommand();

            var myquerystring = "INSERT INTO jobviews(Empid, dtentered) values (" + empid + ", '" + dtentered + "')";

            conn.ConnectionString = Dlconnect.Makeconn();

            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = myquerystring;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        //this gets detail page views for a job
        public DataSet GetJobviewdata(int sEmpId)
        {
            var ds = new DataSet();

            var myconstring = Dlconnect.Makeconn();

            var mycon = new MySqlConnection { ConnectionString = myconstring };

            var myda =
                new MySqlDataAdapter(
                    "select count(empid) as jobviews, dtentered as dateviewed from jobviews group by empid, dtentered having empid = '" +
                    sEmpId + "';", mycon);

            mycon.Open();

            myda.Fill(ds, "jobviews");

            mycon.Close();

            return ds;
        }

        //this get application views via recruiters for you application made
        public DataSet Getappviewdata(int sEmpID)
        {
            var ds = new DataSet();

            var myconstring = Dlconnect.Makeconn();

            var mycon = new MySqlConnection { ConnectionString = myconstring };

            var myda =
                new MySqlDataAdapter(
                    "select idjobs as jobviews, dtentered as dateviewed from jobapplicationview where empid = " + sEmpID +
                    ";", mycon);

            mycon.Open();

            myda.Fill(ds, "jobapplicationview");

            mycon.Close();

            return ds;
        }

        //this gets posted jobviews
        public DataSet Getpjjobviewdata(int sEmpID)
        {
            var ds = new DataSet();

            var myconstring = Dlconnect.Makeconn();

            var mycon = new MySqlConnection { ConnectionString = myconstring };

            var myda =
                new MySqlDataAdapter(
                    "select idjobs as jobviews, dtentered as dateviewed from jobpostedview where empid = " + sEmpID +
                    ";", mycon);

            mycon.Open();

            myda.Fill(ds, "jobpostedview");

            mycon.Close();

            return ds;
        }
    }
}
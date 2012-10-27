using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using MySql.Data.MySqlClient;

namespace JB
{
    public class ClJobviewdata
    {
        //this adds detail page views
        public void addview(int empid, string dtentered)
        {
          
            MySql.Data.MySqlClient.MySqlConnection conn;
            MySql.Data.MySqlClient.MySqlCommand cmd;

            conn = new MySql.Data.MySqlClient.MySqlConnection();
            cmd = new MySql.Data.MySqlClient.MySqlCommand();
            
            string myquerystring;
            myquerystring = "INSERT INTO jobviews(Empid, dtentered) values (" + empid + ", '"+ dtentered +"')";
             
            conn.ConnectionString =  Clconnect.makeconn();

            conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = myquerystring;
            cmd.ExecuteNonQuery();
            conn.Close();
        


        }

        //this gets detail page views for a job
        public DataSet getJobviewdata(int sEmpID)
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("select count(empid) as jobviews, dtentered as dateviewed from jobviews group by empid, dtentered having empid = '" + sEmpID + "';", mycon);

            mycon.Open();

            myda.Fill(Ds, "jobviews");

            mycon.Close();

            return Ds;

        }

        //this get application views via recruiters for you application made
        public DataSet getappviewdata(int sEmpID)
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("select idjobs as jobviews, dtentered as dateviewed from jobapplicationview where empid = " + sEmpID + ";", mycon);

            mycon.Open();

            myda.Fill(Ds, "jobapplicationview");

            mycon.Close();

            return Ds;

        }

        //this gets posted jobviews
        public DataSet getpjjobviewdata(int sEmpID)
        {
            DataSet Ds = new DataSet();
             
            string myconstring =  Clconnect.makeconn();

            MySqlConnection mycon = new MySqlConnection();

            mycon.ConnectionString = myconstring;

            MySqlDataAdapter myda = new MySqlDataAdapter("select idjobs as jobviews, dtentered as dateviewed from jobpostedview where empid = " + sEmpID + ";", mycon);

            mycon.Open();

            myda.Fill(Ds, "jobpostedview");

            mycon.Close();

            return Ds;

        }
    }
}
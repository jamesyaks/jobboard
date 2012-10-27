using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Collections;

namespace JB.Recruiters
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class RecJobs : System.Web.UI.Page
    {
        //read cookie
        public string readjobcookie()
        {
            //Grab the cookie
            HttpCookie cookie = Request.Cookies["ahrcloud.com"];

            //Check to make sure the cookie exists
            if (null == cookie)
            {
                return null;
            }

            else
            {
                //Write the cookie value
                String strCookieValue = cookie.Value.ToString();
                return strCookieValue;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            //set default inputs
            TextBox1.Focus();
            Page.Form.DefaultButton = Button1.UniqueID;

            //read and validate login
            if (Session["cuserval"] != null)
            {
                if (Session["cuserval"].ToString() == readjobcookie())
                {

                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }

            else
            {
                Response.Redirect("login.aspx");
            }

            CLMainpagepopulator mp = new CLMainpagepopulator();

            if (!IsPostBack)
            {

                //get locations
                CheckBoxList2.DataSource = mp.getLocations();
                CheckBoxList2.DataTextField = "sTerm";
                CheckBoxList2.DataValueField = "Termid";
                CheckBoxList2.DataBind();


                //get industry
                CheckBoxList1.DataSource = mp.getIndustries();
                CheckBoxList1.DataTextField = "sTerm";
                CheckBoxList1.DataValueField = "Termid";
                CheckBoxList1.DataBind();


                //get salary
                CheckBoxList6.DataSource = mp.getsalaries();
                CheckBoxList6.DataTextField = "sTerm";
                CheckBoxList6.DataValueField = "Termid";
                CheckBoxList6.DataBind();

                //
                int editjobid = 0;
                if (Request.QueryString["jobid"] != null)
                {
                    editjobid = Convert.ToInt16(Request.QueryString["JobID"]);
                }
                //fill in form.
                string[] arrfil = mp.filljobform(editjobid);

                //
                TextBox1.Text = arrfil[0];
                TextBox2.Text = arrfil[1];
                CultureInfo cinf = new CultureInfo("pt-BR");
                TextBox3.Text = Convert.ToDateTime(arrfil[2]).ToString("d", cinf);
                TextBox4.Text = Convert.ToDateTime(arrfil[3]).ToString("d", cinf);
                TextBox5.Text = arrfil[4];
                TextBox6.Text = arrfil[5];
                Editor1.Text = arrfil[6];

                #region populatemultitexts

                //set constructor
                ClJobs cljbs = new ClJobs();

                ArrayList __al = new ArrayList();
                __al = cljbs.getmultitexts(editjobid);
                                
                foreach(string __arritem in __al)
                {
                    int arritem = Convert.ToInt32(__arritem);

                    if (arritem >= 5000 && arritem < 6000)
                    {
                        //industry
                        CheckBoxList1.Items.FindByValue(arritem.ToString()).Selected = true;
                    }

                    if (arritem > 4000 && arritem < 5000)
                    {
                        //locations
                        CheckBoxList2.Items.FindByValue(arritem.ToString()).Selected = true;
                    }
                    
                    if (arritem >= 3000 && arritem <= 3002)
                    {
                        //contract
                        CheckBoxList3.Items.FindByValue(arritem.ToString()).Selected = true;
                    }

                    if (arritem >= 6000 && arritem < 7000)
                    {
                        //salary
                        CheckBoxList6.Items.FindByValue(arritem.ToString()).Selected = true;
                    }

                    if (arritem >= 3003 && arritem <= 3004)
                    {
                        //hours
                        CheckBoxList7.Items.FindByValue(arritem.ToString()).Selected = true;
                    }
                    
                    if (arritem >= 7000 && arritem <= 7001)
                    {
                        //employement type
                        CheckBoxList8.Items.FindByValue(arritem.ToString()).Selected = true;
                    }
                }

                #endregion
            }      
             
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            //set culture to british 
            //modify here in future if this needs to be set to us formats

            CultureInfo cinf = new CultureInfo("en-GB");
            DateTime startdate = Convert.ToDateTime(TextBox3.Text, cinf);
            DateTime enddate = Convert.ToDateTime(TextBox4.Text, cinf);

            string sdate = startdate.ToString("MM/dd/yyyy");
            string edate = enddate.ToString("MM/dd/yyyy");

            if (Request.QueryString["jobid"] != null)
            {
                #region updatejobs

                CLMainpagepopulator mpage = new CLMainpagepopulator();
                int recid = mpage.RecName(Session["pusername"].ToString());
                int mxjobsid = Convert.ToInt16(Request.QueryString["jobid"]);

                //update job
                mpage.updatejobs(mxjobsid, TextBox1.Text, TextBox2.Text, Editor1.Text, TextBox5.Text, 0, 0, TextBox6.Text, sdate, edate);

                mpage.deletejobs(mxjobsid);

                //insert location
                foreach (ListItem listite1 in CheckBoxList2.Items)
                {
                    if (listite1.Selected == true)
                    {

                        //insert

                        mpage.insertjobmapping(mxjobsid, 1000, Convert.ToInt16(listite1.Value), recid);
                    }
                }

                //industry
                foreach (ListItem listitems3 in CheckBoxList1.Items)
                {

                    if (listitems3.Selected == true)
                    {
                        mpage.insertjobmapping(mxjobsid, 1001, Convert.ToInt16(listitems3.Value), recid);
                    }
                }



                //insert contract
                foreach (ListItem listitems2 in CheckBoxList3.Items)
                {

                    if (listitems2.Selected == true)
                    {
                        //insert cats
                        mpage.insertjobmapping(mxjobsid, 1002, Convert.ToInt16(listitems2.Value), recid);

                    }
                }

                //insert hours
                foreach (ListItem listitems4 in CheckBoxList7.Items)
                {

                    if (listitems4.Selected == true)
                    {
                        mpage.insertjobmapping(mxjobsid, 1003, Convert.ToInt16(listitems4.Value), recid);
                    }
                }

                //employer direct of agency

                foreach (ListItem listitems5 in CheckBoxList8.Items)
                {

                    if (listitems5.Selected == true)
                    {
                        mpage.insertjobmapping(mxjobsid, 1004, Convert.ToInt16(listitems5.Value), recid);
                    }
                }

                //insert salary
                foreach (ListItem listitems6 in CheckBoxList6.Items)
                {

                    if (listitems6.Selected == true)
                    {
                        mpage.insertjobmapping(mxjobsid, 1005, Convert.ToInt16(listitems6.Value), recid);
                    }
                }

                //end update
                #endregion
            }


            else
            {
                #region addjobs

                //add jobs
                CLMainpagepopulator mpage = new CLMainpagepopulator();
                int recid = mpage.RecName(Session["pusername"].ToString());
                int mxjobsid = mpage.getmaxjobid();

                //insert job

                mpage.insertjobs(mxjobsid, TextBox1.Text, TextBox2.Text, Editor1.Text, TextBox5.Text, 0, 0, TextBox6.Text, sdate, edate);

                //insert default job
                mpage.insertjobmapping(mxjobsid, 10000, 10000, recid);

                //insert location

                foreach (ListItem listite1 in CheckBoxList2.Items)
                {
                    if (listite1.Selected == true)
                    {

                        //insert categories
                        mpage.insertjobmapping(mxjobsid, 1000, Convert.ToInt16(listite1.Value), recid);
                    }
                }

                //industry
                foreach (ListItem listitems3 in CheckBoxList1.Items)
                {

                    if (listitems3.Selected == true)
                    {
                        mpage.insertjobmapping(mxjobsid, 1001, Convert.ToInt16(listitems3.Value), recid);
                    }
                }



                //insert contract
                foreach (ListItem listitems2 in CheckBoxList3.Items)
                {

                    if (listitems2.Selected == true)
                    {
                        //insert cats
                        mpage.insertjobmapping(mxjobsid, 1002, Convert.ToInt16(listitems2.Value), recid);

                    }
                }

                //insert hours
                foreach (ListItem listitems4 in CheckBoxList7.Items)
                {

                    if (listitems4.Selected == true)
                    {
                        mpage.insertjobmapping(mxjobsid, 1003, Convert.ToInt16(listitems4.Value), recid);
                    }
                }

                //employer direct of agency

                foreach (ListItem listitems5 in CheckBoxList8.Items)
                {

                    if (listitems5.Selected == true)
                    {
                        mpage.insertjobmapping(mxjobsid, 1004, Convert.ToInt16(listitems5.Value), recid);
                    }
                }

                //insert salary
                foreach (ListItem listitems6 in CheckBoxList6.Items)
                {

                    if (listitems6.Selected == true)
                    {
                        mpage.insertjobmapping(mxjobsid, 1005, Convert.ToInt16(listitems6.Value), recid);
                    }
                }

                //end adding jobs

                #endregion
            }

            
        }

    }
}

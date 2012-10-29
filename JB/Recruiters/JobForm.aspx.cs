using System;
using System.Collections;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JB.Recruiters
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class RecJobs : Clcookiehandler
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            var mp = new DlMainpagepopulator();

            //get locations
            CheckBoxList2.DataSource = mp.GetLocations();
            CheckBoxList2.DataTextField = "sTerm";
            CheckBoxList2.DataValueField = "Termid";
            CheckBoxList2.DataBind();


            //get industry
            CheckBoxList1.DataSource = mp.GetIndustries();
            CheckBoxList1.DataTextField = "sTerm";
            CheckBoxList1.DataValueField = "Termid";
            CheckBoxList1.DataBind();


            //get salary
            CheckBoxList6.DataSource = mp.Getsalaries();
            CheckBoxList6.DataTextField = "sTerm";
            CheckBoxList6.DataValueField = "Termid";
            CheckBoxList6.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //set default inputs
            TextBox1.Focus();
            Page.Form.DefaultButton = Button1.UniqueID;

            //read and validate login
            if (Session["cuserval"] != null)
            {
                if (Session["cuserval"].ToString() == Readjobcookie())
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

            var mp = new DlMainpagepopulator();
            var _jobc = new DlJobs();

            if (!IsPostBack)
            {
                //
                int editjobid = 0;
                if (Request.QueryString["jobid"] != null)
                {
                    editjobid = Convert.ToInt16(Request.QueryString["JobID"]);

                    //get recid
                    int recid = mp.RecName(Session["pusername"].ToString());

                    //check if this job belongs to current recruiter
                    if (_jobc.Checkrecruiter(editjobid) != recid)
                    {
                        Response.Redirect("rechome.aspx");
                    }

                    //fill in form.
                    var arrfil = mp.Filljobform(editjobid);

                    //
                    TextBox1.Text = arrfil[0];
                    TextBox2.Text = arrfil[1];
                    var cinf = new CultureInfo("pt-BR");
                    TextBox3.Text = Convert.ToDateTime(arrfil[2]).ToString("d", cinf);
                    TextBox4.Text = Convert.ToDateTime(arrfil[3]).ToString("d", cinf);
                    TextBox5.Text = arrfil[4];
                    TextBox6.Text = arrfil[5];
                    Editor1.Text = arrfil[6];

                    #region populatemultitexts

                    //set constructor
                    var cljbs = new DlJobs();

                    var __al = new ArrayList();
                    __al = cljbs.Getmultitexts(editjobid);

                    foreach (int arritem in from string __arritem in __al select Convert.ToInt32(__arritem))
                    {
                        if (arritem >= 5000 && arritem < 6000)
                        {
                            //industry
                            CheckBoxList1.Items.FindByValue(arritem.ToString(CultureInfo.InvariantCulture)).Selected = true;
                        }

                        if (arritem > 4000 && arritem < 5000)
                        {
                            //locations
                            CheckBoxList2.Items.FindByValue(arritem.ToString(CultureInfo.InvariantCulture)).Selected = true;
                        }

                        if (arritem == 3000 || arritem == 3001 || arritem == 3002)
                        {
                            //contract
                            CheckBoxList3.Items.FindByValue(arritem.ToString(CultureInfo.InvariantCulture)).Selected = true;
                        }

                        if (arritem >= 6000 && arritem < 7000)
                        {
                            //salary
                            CheckBoxList6.Items.FindByValue(arritem.ToString(CultureInfo.InvariantCulture)).Selected = true;
                        }

                        if (arritem == 3003 || arritem == 3004)
                        {
                            //hours
                            CheckBoxList7.Items.FindByValue(arritem.ToString(CultureInfo.InvariantCulture)).Selected = true;
                        }

                        if (arritem == 7000 || arritem == 7001)
                        {
                            //employement type
                            CheckBoxList8.Items.FindByValue(arritem.ToString(CultureInfo.InvariantCulture)).Selected = true;
                        }
                    }

                    #endregion
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //set culture to british 
            //modify here in future if this needs to be set to us formats

            var cinf = new CultureInfo("en-GB");
            DateTime startdate = Convert.ToDateTime(TextBox3.Text, cinf);
            DateTime enddate = Convert.ToDateTime(TextBox4.Text, cinf);

            string sdate = startdate.ToString("MM/dd/yyyy");
            string edate = enddate.ToString("MM/dd/yyyy");

            if (Request.QueryString["jobid"] != null)
            {
                #region updatejobs

                var mpage = new DlMainpagepopulator();
                int recid = mpage.RecName(Session["pusername"].ToString());
                int mxjobsid = Convert.ToInt16(Request.QueryString["jobid"]);

                //update job
                mpage.Updatejobs(mxjobsid, TextBox1.Text, TextBox2.Text, Editor1.Text, TextBox5.Text, 0, 0,
                                 TextBox6.Text, sdate, edate);

                mpage.Deletejobs(mxjobsid);

                //insert location
                foreach (ListItem listite1 in CheckBoxList2.Items.Cast<ListItem>().Where(listite1 => listite1.Selected))
                {
                    //insert

                    mpage.Insertjobmapping(mxjobsid, 1000, Convert.ToInt16(listite1.Value), recid);
                }

                //industry
                foreach (ListItem listitems3 in CheckBoxList1.Items.Cast<ListItem>().Where(listitems3 => listitems3.Selected))
                {
                    mpage.Insertjobmapping(mxjobsid, 1001, Convert.ToInt16(listitems3.Value), recid);
                }


                //insert contract
                foreach (ListItem listitems2 in CheckBoxList3.Items.Cast<ListItem>().Where(listitems2 => listitems2.Selected))
                {
                    //insert cats
                    mpage.Insertjobmapping(mxjobsid, 1002, Convert.ToInt16(listitems2.Value), recid);
                }

                //insert hours
                foreach (ListItem listitems4 in CheckBoxList7.Items.Cast<ListItem>().Where(listitems4 => listitems4.Selected))
                {
                    mpage.Insertjobmapping(mxjobsid, 1003, Convert.ToInt16(listitems4.Value), recid);
                }

                //employer direct of agency

                foreach (ListItem listitems5 in CheckBoxList8.Items.Cast<ListItem>().Where(listitems5 => listitems5.Selected))
                {
                    mpage.Insertjobmapping(mxjobsid, 1004, Convert.ToInt16(listitems5.Value), recid);
                }

                //insert salary
                foreach (ListItem listitems6 in CheckBoxList6.Items.Cast<ListItem>().Where(listitems6 => listitems6.Selected))
                {
                    mpage.Insertjobmapping(mxjobsid, 1005, Convert.ToInt16(listitems6.Value), recid);
                }

                //end update

                #endregion
            }


            else
            {
                #region addjobs

                //add jobs
                var mpage = new DlMainpagepopulator();
                int recid = mpage.RecName(Session["pusername"].ToString());
                int mxjobsid = mpage.Getmaxjobid();

                //insert job

                mpage.Insertjobs(mxjobsid, TextBox1.Text, TextBox2.Text, Editor1.Text, TextBox5.Text, 0, 0,
                                 TextBox6.Text, sdate, edate);

                //insert default job
                mpage.Insertjobmapping(mxjobsid, 10000, 10000, recid);

                //insert location

                foreach (ListItem listite1 in CheckBoxList2.Items.Cast<ListItem>().Where(listite1 => listite1.Selected))
                {
                    //insert categories
                    mpage.Insertjobmapping(mxjobsid, 1000, Convert.ToInt16(listite1.Value), recid);
                }

                //industry
                foreach (ListItem listitems3 in CheckBoxList1.Items.Cast<ListItem>().Where(listitems3 => listitems3.Selected))
                {
                    mpage.Insertjobmapping(mxjobsid, 1001, Convert.ToInt16(listitems3.Value), recid);
                }


                //insert contract
                foreach (ListItem listitems2 in CheckBoxList3.Items.Cast<ListItem>().Where(listitems2 => listitems2.Selected))
                {
                    //insert cats
                    mpage.Insertjobmapping(mxjobsid, 1002, Convert.ToInt16(listitems2.Value), recid);
                }

                //insert hours
                foreach (ListItem listitems4 in CheckBoxList7.Items.Cast<ListItem>().Where(listitems4 => listitems4.Selected))
                {
                    mpage.Insertjobmapping(mxjobsid, 1003, Convert.ToInt16(listitems4.Value), recid);
                }

                //employer direct of agency

                foreach (ListItem listitems5 in CheckBoxList8.Items.Cast<ListItem>().Where(listitems5 => listitems5.Selected))
                {
                    mpage.Insertjobmapping(mxjobsid, 1004, Convert.ToInt16(listitems5.Value), recid);
                }

                //insert salary
                foreach (ListItem listitems6 in CheckBoxList6.Items.Cast<ListItem>().Where(listitems6 => listitems6.Selected))
                {
                    mpage.Insertjobmapping(mxjobsid, 1005, Convert.ToInt16(listitems6.Value), recid);
                }

                //end adding jobs

                #endregion
            }
        }
    }
}
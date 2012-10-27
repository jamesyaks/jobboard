using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace JB
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Jobdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CLMainpagepopulator mpage = new CLMainpagepopulator();

            if (Request.QueryString["JobID"] != null)
            {
                int tempjobid = Convert.ToInt16(Request.QueryString["JobID"]);

                string[] Plc = mpage.getdetailspage(tempjobid);

                Label11.Text = "Job Description";
                Label32.Text = Plc[0];
                Label26.Text = Plc[1];
                Label18.Text = Plc[2];
                Label30.Text = Plc[5];
                Label31.Text = Plc[6];
                Label21.Text = Plc[4];

                CultureInfo culinf = new CultureInfo("pt-BR");
                Label23.Text = Convert.ToDateTime(Plc[3]).ToString("d", culinf);

                //get locations
                Label19.Text = mpage.getdetailspagecats(tempjobid, 1000);

                //get salary
                Label20.Text = mpage.getdetailspagecats(tempjobid, 1005, 0);

                //get contract type
                Label22.Text = mpage.getdetailspagecats(tempjobid, 1002);

                //get rec logo
                string recid = Plc[7];

                Image7.ImageUrl = mpage.getcurrrec(recid);

                //get contact person name if any
                string contactpname = string.Empty;

                CLRecruiterCl rcl2 = new CLRecruiterCl();


                if (Request.QueryString["JobID"] != null)
                {
                    contactpname = rcl2.contactperson(Request.QueryString["JobID"]);
                    if (contactpname != "")
                    {
                        Label27.Text = contactpname;
                    }
                }

                //update job views for recruiter graph

                ClJobviewdata cljb = new ClJobviewdata();
                cljb.addview(Convert.ToInt16(recid), DateTime.Now.ToString("yyyy:MM:dd hh:mm:ss"));
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/JobSeekers/Applications.aspx?JobID="+Request.QueryString["JobID"]);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/reportapage.aspx?pageid="+Request.QueryString[0]);
        }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace JB
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Init(object sender, EventArgs e)
        {
            CLMainpagepopulator mp = new CLMainpagepopulator();

            //get salaries
            CheckBoxList6.DataSource = mp.getSalary();
            CheckBoxList6.DataTextField = "sTerm";
            CheckBoxList6.DataValueField = "Termid";
            CheckBoxList6.DataBind();


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

            //main job binding
            CLMainpagepopulator mpgp = new CLMainpagepopulator();
            GridView1.DataSource = mpgp.getJobssingle();
            GridView1.DataBind();


            //featured Recruiters
            ClFeaturedrecruiters frec = new ClFeaturedrecruiters();
            GridView2.DataSource = frec.GetFRecs();
            GridView2.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //set default inputs
            TextBox2.Focus();
            //Page.Form.DefaultButton = ImageButton2.UniqueID;

            CLMainpagepopulator cmpag = new CLMainpagepopulator();

            //constructor
            CLMainpagepopulator mp = new CLMainpagepopulator();

            //get count of all jobs
            Label13.Text = mp.getcountjobs() + " Jobs Advertized from " + mp.getcountrecswadvert() + " Recruiters";

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            if (Label13.Text.Contains("your search returned") == true)
            {
                //only text box
                CLSearchfilters sflt2 = new CLSearchfilters();

                GridView1.DataSource = sflt2.applytitlefilter(TextBox2.Text, shortbuildfunc().ToString());
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }

            else
            {
                CLMainpagepopulator mpgp = new CLMainpagepopulator();
                GridView1.DataSource = mpgp.getJobssingle();
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }
        }


        //heart of search
        public StringBuilder shortbuildfunc()
        {
            StringBuilder shortbuild = new StringBuilder();

            bool ix = false;

            //insert salaries
            foreach (ListItem listsal in CheckBoxList6.Items)
            {

                if (listsal.Selected == true)
                {
                    shortbuild.Append(" and termid =" + listsal.Value);
                    ix = true;
                }
            }

            //insert location
            foreach (ListItem listite1 in CheckBoxList2.Items)
            {
                if (listite1.Selected == true)
                {
                    //search

                    shortbuild.Append(" and termid =" + listite1.Value);
                    ix = true;
                }
            }

            //industry
            foreach (ListItem listit2 in CheckBoxList1.Items)
            {

                if (listit2.Selected == true)
                {
                    //search
                    shortbuild.Append(" and termid=" + listit2.Value);
                    ix = true;
                }
            }



            //insert contract
            foreach (ListItem listit3 in CheckBoxList3.Items)
            {

                if (listit3.Selected == true)
                {
                    //search
                    shortbuild.Append(" and termid=" + listit3.Value);
                    ix = true;
                }
            }

            //add hours
            foreach (ListItem listit4 in CheckBoxList4.Items)
            {

                if (listit4.Selected == true)
                {
                    //search
                    shortbuild.Append(" and termid=" + listit4.Value);
                    ix = true;
                }
            }

            //add employer type
            foreach (ListItem listit5 in CheckBoxList5.Items)
            {

                if (listit5.Selected == true)
                {
                    //search
                    shortbuild.Append(" and termid=" + listit5.Value);
                    ix = true;
                }
            }

            //shortbuild.Append(")");

            if (ix == true)
            {
                shortbuild.Append(" and termid != 10000");
            }

            else
            {

            }

            

            return shortbuild;

        }

        private void search_code()
        {
            if (TextBox2.Text.Trim() != "")
            {
                //only text box
                CLSearchfilters sflt = new CLSearchfilters();
                string criterion = shortbuildfunc().ToString();
                string titlian = TextBox2.Text;

                GridView1.DataSource = sflt.applytitlefilter(titlian, criterion);
                GridView1.DataBind();

                Label13.Text = "your search returned " + sflt.getsearchcounts(titlian, criterion) + " results";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            search_code();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
                    e.Row.Attributes.Add("class", "gridrowdb");                    
                    break;
                default:
                    break;
            }
        }

        protected void LinkButton44_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Contact.aspx");
        }

        protected void LinkButtonSal_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SalaryCalc/Salaryquestions.aspx");
        }

        protected void LinkButtonj_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AllRecruiters.aspx");
        }

        protected void LinkButtona6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }


        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx?ival=");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (TextBox2.Text.Length > 0)
            {
                search_code();
            }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("jbsubscribe.aspx");
        }
    }
}

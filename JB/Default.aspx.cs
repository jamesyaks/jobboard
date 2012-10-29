using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JB
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class Default : Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            var _mp = new DlMainpagepopulator();

            //get salaries
            CheckBoxList6.DataSource = _mp.GetSalary();
            CheckBoxList6.DataTextField = "sTerm";
            CheckBoxList6.DataValueField = "Termid";
            CheckBoxList6.DataBind();

            //get locations
            CheckBoxList2.DataSource = _mp.GetLocations();
            CheckBoxList2.DataTextField = "sTerm";
            CheckBoxList2.DataValueField = "Termid";
            CheckBoxList2.DataBind();

            //get industry
            CheckBoxList1.DataSource = _mp.GetIndustries();
            CheckBoxList1.DataTextField = "sTerm";
            CheckBoxList1.DataValueField = "Termid";
            CheckBoxList1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //main job binding
            var _mp = new DlMainpagepopulator();
            GridView1.DataSource = _mp.GetJobssingle();
            GridView1.DataBind();

            //featured Recruiters
            var _frec = new DlFeaturedrecruiters();
            GridView2.DataSource = _frec.GetFRecs();
            GridView2.DataBind();

            //set default inputs
            TextBox2.Focus();

            //get count of all jobs
            Label13.Text = _mp.Getcountjobs() + " Jobs Advertized from " + _mp.Getcountrecswadvert() + " Recruiters";
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (Label13.Text.Contains("your search returned"))
            {
                //only text box
                var sflt2 = new DlSearchfilters();
                GridView1.DataSource = sflt2.Applytitlefilter(TextBox2.Text, shortbuildfunc());
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }

            else
            {
                var mpgp = new DlMainpagepopulator();
                GridView1.DataSource = mpgp.GetJobssingle();
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }
        }

        private string shortbuildfunc()
        {
            var shortbuild = new StringBuilder();
            bool ix = false;

            shortbuild.Append(" and termid IN(");

            //insert salaries
            foreach (ListItem listsal in CheckBoxList6.Items)
            {
                if (listsal.Selected)
                {
                    shortbuild.Append(listsal.Value + ",");
                    ix = true;
                }
            }

            //insert location
            foreach (ListItem listite1 in CheckBoxList2.Items)
            {
                if (listite1.Selected)
                {
                    shortbuild.Append(listite1.Value + ",");
                    ix = true;
                }
            }

            //industry
            foreach (ListItem listit2 in CheckBoxList1.Items)
            {
                if (listit2.Selected)
                {
                    shortbuild.Append(listit2.Value + ",");
                    ix = true;
                }
            }

            //insert contract
            foreach (ListItem listit3 in CheckBoxList3.Items)
            {
                if (listit3.Selected)
                {
                    shortbuild.Append(listit3.Value + ",");
                    ix = true;
                }
            }

            //add hours
            foreach (ListItem listit4 in CheckBoxList4.Items)
            {
                if (listit4.Selected)
                {
                    shortbuild.Append(listit4.Value + ",");
                    ix = true;
                }
            }

            //add employer type
            foreach (ListItem listit5 in CheckBoxList5.Items)
            {
                if (listit5.Selected)
                {
                    shortbuild.Append(listit5.Value + ",");
                    ix = true;
                }
            }

            string __searchstr = string.Empty;

            if (ix)
            {
                __searchstr = shortbuild.ToString().TrimEnd(',');
                __searchstr = __searchstr + ")";
            }

            return __searchstr;
        }

        private void search_code()
        {
            if (TextBox2.Text.Trim() != "")
            {
                //only text box
                var sflt = new DlSearchfilters();
                string criterion = shortbuildfunc();
                string titlian = TextBox2.Text;

                GridView1.DataSource = sflt.Applytitlefilter(titlian, criterion);
                GridView1.DataBind();

                Label13.Text = "your search returned " + sflt.Getsearchcounts(titlian, criterion) + " results";
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
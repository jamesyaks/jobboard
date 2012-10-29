using System;
using System.Linq;
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

            if(Request.QueryString["q"]!=null){
            TextBox2.Text = Request.QueryString["q"];
            }
        }

        private void SetCheckBox(string __criteria)
        {
            string[] __splitcriteria = { "(", ",", ")" };
            string[] __splitedarray = __criteria.Split(__splitcriteria, StringSplitOptions.None);

            //set salaries
            foreach (string s in from ListItem listite in CheckBoxList6.Items from s in __splitedarray.Where(s => s == listite.Value) select s)
            {
                CheckBoxList6.Items.FindByValue(s).Selected = true;
            }

            //set location
            foreach (string s in from ListItem listite1 in CheckBoxList2.Items from s in __splitedarray.Where(s => s == listite1.Value) select s)
            {
                CheckBoxList2.Items.FindByValue(s).Selected = true;
            }

            //set industry
            foreach (string s in from ListItem listit2 in CheckBoxList1.Items from s in __splitedarray.Where(s => s == listit2.Value) select s)
            {
                CheckBoxList1.Items.FindByValue(s).Selected = true;
            }

            //set contract
            foreach (string s in from ListItem listit3 in CheckBoxList3.Items from s in __splitedarray.Where(s => s == listit3.Value) select s)
            {
                CheckBoxList3.Items.FindByValue(s).Selected = true;
            }

            //set hours
            foreach (string s in from ListItem listit4 in CheckBoxList4.Items from s in __splitedarray.Where(s => s == listit4.Value) select s)
            {
                CheckBoxList4.Items.FindByValue(s).Selected = true;
            }

            //set employer type
            foreach (string s in from ListItem listit5 in CheckBoxList5.Items from s in __splitedarray.Where(s => s == listit5.Value) select s)
            {
                CheckBoxList5.Items.FindByValue(s).Selected = true;
            }
        }

        private void SetSearch()
        {
            if (Request.QueryString["q"] != null)
            {
                if (Request.QueryString["q"] == "all")
                {
                    var _mp = new DlMainpagepopulator();

                    GridView1.DataSource = _mp.GetJobssingle();
                    GridView1.DataBind();

                    //get count of all jobs
                    Label13.Text = _mp.Getcountjobs() + " Jobs Advertized from " + _mp.Getcountrecswadvert() + " Recruiters";
                }

                else if (Request.QueryString["filter"] != null)
                {
                    //textbox+criteria
                    var _criteria = Session["criteria"].ToString().ToLowerInvariant();
                    var _title = Request.QueryString["q"];

                    var _sr = new Clsearchhelper();

                    GridView1.DataSource = _sr.Applytitlefilter(_title, _criteria);
                    GridView1.DataBind();

                    //set checkboxes
                    SetCheckBox(_criteria);

                    //show filters
                    ClearFilters.Visible = true;
                }

                else
                {
                    //textbox only
                    var _sr2 = new Clsearchhelper();
                    var __title = Request.QueryString["q"];

                    GridView1.DataSource = _sr2.Applytitlefilter(__title);
                    GridView1.DataBind();

                    //show filters
                    ClearFilters.Visible = true;
                }
            }

            else
            {
                if (Request.QueryString["filter"] == null)
                {
                    var _mp1 = new DlMainpagepopulator();

                    GridView1.DataSource = _mp1.GetJobssingle();
                    GridView1.DataBind();

                    //get count of all jobs
                    Label13.Text = _mp1.Getcountjobs() + " Jobs Advertized from " + _mp1.Getcountrecswadvert() + " Recruiters";
                }

                else
                {
                    //criteria only
                    var _criteria = Session["criteria"].ToString().ToLowerInvariant();
                    var _sr = new Clsearchhelper();

                    GridView1.DataSource = _sr.Applycriteriafilter(_criteria);
                    GridView1.DataBind();

                    //setcheckbox
                    SetCheckBox(_criteria);

                    //show filter button
                    ClearFilters.Visible = true;
                }
            }

            //display filter sign

        }

        private void GetPage(GridViewPageEventArgs e)
        {
            if (Request.QueryString["q"] != null)
            {
                if (Request.QueryString["q"] == "all")
                {
                    var _mp = new DlMainpagepopulator();

                    GridView1.DataSource = _mp.GetJobssingle();
                    GridView1.PageIndex = e.NewPageIndex;
                    GridView1.DataBind();

                    //get count of all jobs
                    Label13.Text = _mp.Getcountjobs() + " Jobs Advertized from " + _mp.Getcountrecswadvert() + " Recruiters";
                }

                else if (Request.QueryString["filter"] != null)
                {
                    //textbox+criteria
                    var _criteria = Session["criteria"].ToString().ToLowerInvariant();
                    var _title = Request.QueryString["q"];

                    var _sr = new Clsearchhelper();

                    GridView1.DataSource = _sr.Applytitlefilter(_title, _criteria);
                    GridView1.PageIndex = e.NewPageIndex;
                    GridView1.DataBind();
                }

                else
                {
                    //textbox only
                    var _sr2 = new Clsearchhelper();
                    var __title = Request.QueryString["q"];

                    GridView1.DataSource = _sr2.Applytitlefilter(__title);
                    GridView1.PageIndex = e.NewPageIndex;
                    GridView1.DataBind();
                }
            }

            else
            {
                if (Request.QueryString["filter"] == null)
                {
                    var _mp1 = new DlMainpagepopulator();

                    GridView1.DataSource = _mp1.GetJobssingle();
                    GridView1.PageIndex = e.NewPageIndex;
                    GridView1.DataBind();

                    //get count of all jobs
                    Label13.Text = _mp1.Getcountjobs() + " Jobs Advertized from " + _mp1.Getcountrecswadvert() + " Recruiters";
                }

                else
                {
                    //criteria only
                    var _criteria = Session["criteria"].ToString().ToLowerInvariant();
                    var _sr = new Clsearchhelper();

                    GridView1.DataSource = _sr.Applycriteriafilter(_criteria);
                    GridView1.PageIndex = e.NewPageIndex;
                    GridView1.DataBind();
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //featured Recruiters
            var _frec = new DlFeaturedrecruiters();
            GridView2.DataSource = _frec.GetFRecs();
            GridView2.DataBind();

            //set default inputs
            TextBox2.Focus();
            Form.DefaultButton = Button1.UniqueID;

            SetSearch();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GetPage(e);
        }

        private string Shortbuildfunc()
        {
            var shortbuild = new StringBuilder();
            bool ix = false;

            shortbuild.Append(" termid IN(");

            //insert salaries
            foreach (var listite in CheckBoxList6.Items.Cast<ListItem>().Where(listite => listite.Selected))
            {
                shortbuild.Append(listite.Value + ",");
                ix = true;
            }

            //insert location
            foreach (var listite1 in CheckBoxList2.Items.Cast<ListItem>().Where(listite1 => listite1.Selected))
            {
                shortbuild.Append(listite1.Value + ",");
                ix = true;
            }

            //industry
            foreach (var listit2 in CheckBoxList1.Items.Cast<ListItem>().Where(listit2 => listit2.Selected))
            {
                shortbuild.Append(listit2.Value + ",");
                ix = true;
            }

            //insert contract
            foreach (var listit3 in CheckBoxList3.Items.Cast<ListItem>().Where(listit3 => listit3.Selected))
            {
                shortbuild.Append(listit3.Value + ",");
                ix = true;
            }

            //add hours
            foreach (var listit4 in CheckBoxList4.Items.Cast<ListItem>().Where(listit4 => listit4.Selected))
            {
                shortbuild.Append(listit4.Value + ",");
                ix = true;
            }

            //add employer type
            foreach (var listit5 in CheckBoxList5.Items.Cast<ListItem>().Where(listit5 => listit5.Selected))
            {
                shortbuild.Append(listit5.Value + ",");
                ix = true;
            }

            var __searchstr = string.Empty;

            if (ix == true)
            {
                __searchstr = shortbuild.ToString().TrimEnd(',');
                __searchstr = __searchstr + ")";
            }

            return __searchstr;
        }

        private void RedirectSearch()
        {
            var _tempsearch = Shortbuildfunc();

            //clear current session
            Session.Remove("criteria");

            if (_tempsearch != string.Empty)
            {
                Session["criteria"] = _tempsearch;

                if (TextBox2.Text.Trim() != "")
                {
                    //textbox + criteria
                    Response.Redirect("/default.aspx?q=" + TextBox2.Text.Trim() + "&filter=true");
                }
                else
                {
                    //only checkbox in criteria
                    Response.Redirect("/default.aspx?filter=true");
                }
            }

            else
            {
                if (TextBox2.Text.Trim() != "")
                {
                    Response.Redirect("/default.aspx?q=" + TextBox2.Text.Trim());
                }

                else
                {
                    //perform only title search
                    Response.Redirect("/default.aspx?q=all");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            RedirectSearch();
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
            Response.Redirect("/contact.aspx");
        }

        protected void LinkButtonj_Click(object sender, EventArgs e)
        {
            Response.Redirect("/allRecruiters.aspx");
        }

        protected void LinkButtona6_Click(object sender, EventArgs e)
        {
            Response.Redirect("/default.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/jbsubscribe.aspx");
        }

        protected void ClearFilters_Click(object sender, ImageClickEventArgs e)
        {
            Session.Remove("criteria");
            Response.Redirect("/default.aspx");
        }
    }
}
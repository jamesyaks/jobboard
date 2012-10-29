using System;
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
    public partial class jbsubscribe : Page
    {
        public void Page_Init(object sender, EventArgs e)
        {
            //constructor
            var mp = new DlMainpagepopulator();

            //populate left
            //get salaries
            CheckBoxList6.DataSource = mp.GetSalary();
            CheckBoxList6.DataTextField = "sTerm";
            CheckBoxList6.DataValueField = "Termid";
            CheckBoxList6.DataBind();


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
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var clsubs = new Dlsubscriptions();

            //insert location

            foreach (ListItem listite1 in CheckBoxList2.Items)
            {
                if (listite1.Selected)
                {
                    //insert categories
                    clsubs.Addsubscriptions(Emailsubs.Text, 1000, Convert.ToInt16(listite1.Value));
                }
            }

            //industry
            foreach (ListItem listitems3 in CheckBoxList1.Items)
            {
                if (listitems3.Selected)
                {
                    clsubs.Addsubscriptions(Emailsubs.Text, 1001, Convert.ToInt16(listitems3.Value));
                }
            }


            //insert contract
            foreach (ListItem listitems2 in CheckBoxList3.Items)
            {
                if (listitems2.Selected)
                {
                    //insert cats
                    clsubs.Addsubscriptions(Emailsubs.Text, 1002, Convert.ToInt16(listitems2.Value));
                }
            }

            //insert hours
            foreach (ListItem listitems4 in CheckBoxList4.Items)
            {
                if (listitems4.Selected)
                {
                    clsubs.Addsubscriptions(Emailsubs.Text, 1003, Convert.ToInt16(listitems4.Value));
                }
            }

            //employer direct of agency

            foreach (ListItem listitems5 in CheckBoxList5.Items)
            {
                if (listitems5.Selected)
                {
                    clsubs.Addsubscriptions(Emailsubs.Text, 1004, Convert.ToInt16(listitems5.Value));
                }
            }

            //insert salary
            foreach (ListItem listitems6 in CheckBoxList6.Items)
            {
                if (listitems6.Selected)
                {
                    clsubs.Addsubscriptions(Emailsubs.Text, 1005, Convert.ToInt16(listitems6.Value));
                }
            }

            //end adding jobs

            Session["reasons"] = "Thank you for registering for job alerts!";

            Response.Redirect("~/confirm.aspx");
        }
    }
}
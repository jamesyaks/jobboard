﻿using System;
using System.Collections.Generic;
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
    public partial class Editjobs : System.Web.UI.Page
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
            ////////////////////////////////////


            //edit this page for recs
            CLMainpagepopulator mpgp = new CLMainpagepopulator();
            //get rec name
            

            if (HiddenField1.Value == "1")
            {
                GridView1.DataSource = mpgp.getJobssinglearchived(mpgp.RecName(Session["pusername"].ToString()));
                GridView1.DataBind();
                
                //set theimages
                Image12.ImageUrl = "~/images/red.png";
                Image11.ImageUrl = "~/images/green.png";

              }

            if( HiddenField1.Value == "2")
            {
                GridView1.DataSource = mpgp.getJobssingle(mpgp.RecName(Session["pusername"].ToString()));
                GridView1.DataBind();
                
                //set the images
                Image12.ImageUrl = "~/images/green.png";
                Image11.ImageUrl = "~/images/red.png";
      
            }

            else
            {
                GridView1.DataSource = mpgp.getJobssinglearchived(mpgp.RecName(Session["pusername"].ToString()));
                GridView1.DataBind();
      
            }

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //edit this page for recs
            CLMainpagepopulator mpgp = new CLMainpagepopulator();

            if (HiddenField1.Value == "1")
            {
                //get rec name
                GridView1.DataSource = mpgp.getJobssinglearchived(mpgp.RecName(Session["pusername"].ToString()));
                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataBind();
            }

            else
            {
                GridView1.DataSource = mpgp.getJobssingle(mpgp.RecName(Session["pusername"].ToString()));
                GridView1.DataBind();

            }            
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
          
            LinkButton4.CssClass = "StyleBlack";
            LinkButton5.CssClass = "StyleGray";

            //bind the grid with active jobs
            CLMainpagepopulator mpop = new CLMainpagepopulator();

            GridView1.DataSource = mpop.getJobssingle(mpop.RecName(Session["pusername"].ToString()));
            GridView1.DataBind();

            HiddenField1.Value = "2";

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {

            LinkButton4.CssClass = "StyleGray";
            LinkButton5.CssClass = "StyleBlack";
        
            //bind the grid with inactive jobs
            CLMainpagepopulator mpop = new CLMainpagepopulator();

            GridView1.DataSource = mpop.getJobssinglearchived(mpop.RecName(Session["pusername"].ToString()));
            GridView1.DataBind();

            HiddenField1.Value = "1";

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            switch (e.Row.RowType)
            {
                case DataControlRowType.DataRow:
                    e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#DEE1E7'");
                    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='White'");
                    break;
                default:
                    break;
            }

        }

        
    }
}

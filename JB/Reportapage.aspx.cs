using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    public partial class reportapage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Clspamfilter spm = new Clspamfilter();
            spm.addspamrec(Convert.ToInt32(RadioButtonList1.SelectedItem.Value), spamreasons.Text,Request.ServerVariables["REMOTE_ADDR"], Request.UserAgent.ToString(),Convert.ToInt32(Request.QueryString[0]));
            Session["reasons"] = "Thank you for reporting this page, we cannot give individual feed back but we will look into this and may contact you if we require further information.";
            Response.Redirect("confirm.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

      
    }
}
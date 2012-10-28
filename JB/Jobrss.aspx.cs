using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Text;
using System.Globalization;

namespace JB
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class jobrss : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //please donot forget to add the httppath in web.config to setup feed for your website.

            // Clear any previous output from the buffer
            Response.Clear();
            Response.ContentType = "text/xml";
            var xtwFeed = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
            xtwFeed.WriteStartDocument();
            xtwFeed.WriteStartElement("rss");
            xtwFeed.WriteAttributeString("version", "2.0");
            xtwFeed.WriteStartElement("channel");
            xtwFeed.WriteElementString("title", System.Configuration.ConfigurationManager.AppSettings["rsshead"].ToString(CultureInfo.InvariantCulture));
            xtwFeed.WriteElementString("description", System.Configuration.ConfigurationManager.AppSettings["rssdescription"].ToString(CultureInfo.InvariantCulture));
            xtwFeed.WriteElementString("link", System.Configuration.ConfigurationManager.AppSettings["httppaths"].ToString(CultureInfo.InvariantCulture));
            xtwFeed.WriteElementString("copyright", System.Configuration.ConfigurationManager.AppSettings["copyrights"].ToString(CultureInfo.InvariantCulture));

            var clrs = new Clrss();
            var rssarray = clrs.Getrss();
            var jobidclean = string.Empty;
            var jobtitleclean = string.Empty;

            for (var i = 0; i < rssarray.GetLength(1); i++)
            {
                if (rssarray[0, i] != null)
                {
                    xtwFeed.WriteStartElement("item");
                    jobidclean = rssarray[0, i].Replace("&", "&amp;").Replace("\"", "&quot;").Replace("'", "&apos;").Replace("<", "&lt;").Replace(">", "&gt;");
                    jobtitleclean = rssarray[1, i].Replace("&", "&amp;").Replace("\"", "&quot;").Replace("'", "&apos;").Replace("<", "&lt;").Replace(">", "&gt;");
                    xtwFeed.WriteElementString("title", rssarray[1, i].Replace("&", "&amp;").Replace("\"", "&quot;").Replace("'", "&apos;").Replace("<", "&lt;").Replace(">", "&gt;"));
                    xtwFeed.WriteElementString("description", rssarray[2, i].Replace("&", "&amp;").Replace("\"", "&quot;").Replace("'", "&apos;").Replace("<", "&lt;").Replace(">", "&gt;"));
                    xtwFeed.WriteElementString("pubDate", Convert.ToDateTime(rssarray[3, i]).ToString("r").Replace("&", "&amp;").Replace("\"", "&quot;").Replace("'", "&apos;").Replace("<", "&lt;").Replace(">", "&gt;"));
                    xtwFeed.WriteElementString("link", System.Configuration.ConfigurationManager.AppSettings["httppaths"].ToString(CultureInfo.InvariantCulture) + "/Jobdetails.aspx?jobid=" + jobidclean);
                    xtwFeed.WriteEndElement();
                }
            }

            xtwFeed.WriteEndElement();
            xtwFeed.WriteEndElement();
            xtwFeed.WriteEndDocument();
            xtwFeed.Flush();
            xtwFeed.Close();
            Response.End();
        }
    }
}
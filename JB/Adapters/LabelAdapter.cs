using System;
using System.Web.UI;
using System.Web.UI.Adapters;
using System.Web.UI.WebControls;

namespace JB.Adapters
{
    public class LabelAdapter : ControlAdapter
    {
        //this is to experiment with true HTML5 markup.
        protected override void Render(HtmlTextWriter writer)
        {
            var l = Control as Label;
            writer.WriteLine();
            writer.WriteBeginTag("label");
            if (l != null && !String.IsNullOrEmpty(l.CssClass))
            {
                writer.WriteAttribute("class", l.CssClass);
            }
            if (!String.IsNullOrEmpty(l.ID))
            {
                writer.WriteAttribute("for", l.ID);
            }
            writer.Write(HtmlTextWriter.TagRightChar);
            writer.Write(l.Text);
            writer.WriteEndTag("label");
            writer.WriteLine();
        }
    }
}
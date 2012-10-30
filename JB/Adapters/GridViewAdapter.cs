using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.Adapters;
using System.Web.UI.WebControls;

namespace JB.Adapters
{
    public class GridViewAdapter : ControlAdapter
    {
        private void Pager(HtmlTextWriter writer, PagerPosition pos)
        {
            //paging is not optimzed for jobs more than 1000, please extend
            //this code to handle more paging your self.
            var gridView = Control as GridView;

            if (gridView != null && (gridView.AllowPaging && gridView.PageCount > 1))
            {
                Table innerTable = null;

                //will gets pager on top
                switch (pos)
                {
                    case PagerPosition.Top:
                        innerTable = gridView.TopPagerRow.Cells[0].Controls[0] as Table;
                        break;

                    default:
                        innerTable = gridView.BottomPagerRow.Cells[0].Controls[0] as Table;
                        break;
                }

                //we are not using top & Bottom for now.
                if (innerTable != null)
                {
                    var className = string.Empty;

                    className += gridView.PagerStyle.CssClass;

                    writer.WriteLine();
                    writer.WriteBeginTag("div");
                    writer.WriteAttribute("class", className);
                    writer.Write(HtmlTextWriter.TagRightChar);
                    writer.Indent++;

                    TableRow row = innerTable.Rows[0];
                    foreach (Control ctrl in from TableCell cell in row.Cells from Control ctrl in cell.Controls select ctrl)
                    {
                        writer.WriteLine();
                        ctrl.RenderControl(writer);
                    }

                    writer.Indent--;
                    writer.WriteLine();
                    writer.WriteEndTag("div");
                }
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            var gv = Control as GridView;

            if (gv != null && gv.Rows.Count > 0)
            {
                foreach (GridViewRow grv in gv.Rows)
                {
                    writer.Indent++;
                    writer.WriteBeginTag("div");

                    if (grv.HasAttributes)
                    {
                        grv.Attributes.Render(writer);
                    }

                    writer.Write(HtmlTextWriter.TagRightChar);

                    if (!String.IsNullOrEmpty(grv.CssClass))
                    {
                        writer.AddAttribute("class", grv.CssClass);
                    }

                    foreach (Control ctrl in from TableCell tcell in grv.Cells from Control ctrl in tcell.Controls select ctrl)
                    {
                        ctrl.RenderControl(writer);
                    }

                    writer.WriteEndTag("div");
                    writer.Indent--;
                    writer.WriteLine();
                }

                Pager(writer, PagerPosition.Bottom);
            }
        }
    }
}
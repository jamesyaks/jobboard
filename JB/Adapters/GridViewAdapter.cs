using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JB.Adapters
{
    public class GridViewAdapter : System.Web.UI.Adapters.ControlAdapter
    {
        private void Pager(HtmlTextWriter writer, PagerPosition pos)
        {
            //paging is not optimzed for jobs more than 1000, please extend 
            //this code to handle more paging your self.
         
            GridView gridView = Control as GridView;

            if (gridView.AllowPaging && gridView.PageCount > 1)
            {
                Table innerTable = null;

                //will gets pager on top
                if (pos == PagerPosition.Top)
                {
                    innerTable = gridView.TopPagerRow.Cells[0].Controls[0] as Table;
                }

                //will set pager on bottom
                else
                {
                    innerTable = gridView.BottomPagerRow.Cells[0].Controls[0] as Table;
                }

                //we are not using top & Bottom for now.
                if (innerTable != null)
                {
                    string className = string.Empty;
                    if (gridView.PagerStyle != null)
                    {
                        className += gridView.PagerStyle.CssClass;
                    }

                    writer.WriteLine();
                    writer.WriteBeginTag("div");
                    writer.WriteAttribute("class", className);
                    writer.Write(HtmlTextWriter.TagRightChar);
                    writer.Indent++;

                    TableRow row = innerTable.Rows[0];
                    foreach (TableCell cell in row.Cells)
                    {
                        foreach (Control ctrl in cell.Controls)
                        {
                            writer.WriteLine();
                            ctrl.RenderControl(writer);
                        }
                    }

                    writer.Indent--;
                    writer.WriteLine();
                    writer.WriteEndTag("div");

                }
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            GridView Gv = Control as GridView;

            if (Gv.Rows.Count > 0)
            {
                foreach (GridViewRow grv in Gv.Rows)
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

                    foreach (TableCell tcell in grv.Cells)
                    {
                        foreach (Control ctrl in tcell.Controls)
                        {
                            ctrl.RenderControl(writer);
                        }
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
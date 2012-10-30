using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web.UI;

namespace JB
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class captcha : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var Text = Request.QueryString["ranstr"].Replace(".png", "").Trim().Replace(" ", "$");
            Session["capts"] = Text;

            Color BackColor = Color.FromName("#000000");
            var FontName = "Courier";
            var FontSize = 10;
            var Height = 16;
            var Width = 110;

            var bitmap = new Bitmap(Width, Height);

            Graphics graphics = Graphics.FromImage(bitmap);

            Color color = Color.Gray;

            var font = new Font(FontName, FontSize);

            //define where the text will be displayed in the specified area of the image
            var point = new PointF(5.0F, 5.0F);

            //SolidBrush BrushForeColor = new SolidBrush(FontColor);
            var BrushBackColor = new SolidBrush(BackColor);
            var BorderPen = new Pen(color);

            var displayRectangle = new Rectangle(new Point(0, 0), new Size(Width - 1, Height - 1));
            graphics.FillRectangle(BrushBackColor, displayRectangle);
            graphics.DrawRectangle(BorderPen, displayRectangle);

            //Define string format
            var format1 = new StringFormat(StringFormatFlags.NoClip);
            var format2 = new StringFormat(format1);

            //Draw text string using the text format
            graphics.DrawString(Text, font, Brushes.GhostWhite, displayRectangle, format2);

            Response.ContentType = "image/jpeg";
            bitmap.Save(Response.OutputStream, ImageFormat.Jpeg);

            GC.Collect();
        }
    }
}
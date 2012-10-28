using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text;

namespace JB
{
    /// <summary>
    /// This code is liscenced by ahrcloud.com
    /// under free creative common liscence, but 
    /// attribution must be made to the author
    /// site at www.ahrcloud.com or info@ahrcloud.com
    /// </summary>
    public partial class captcha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Text = Request.QueryString["ranstr"].Replace(".png","").Trim().Replace(" ","$");
            Session["capts"] = Text;

            Color FontColor = Color.WhiteSmoke;
            Color BackColor = Color.FromName("#000000");
            String FontName = "Courier";
            int FontSize = 10;
            int Height = 16;
            int Width = 110;

            Bitmap bitmap = new Bitmap(Width, Height);

            Graphics graphics = Graphics.FromImage(bitmap);

            Color color = Color.Gray; ;
            Font font = new Font(FontName, FontSize);
            //define where the text will be displayed in the specified area of the image
            PointF point = new PointF(5.0F, 5.0F);

            //SolidBrush BrushForeColor = new SolidBrush(FontColor);
            SolidBrush BrushBackColor = new SolidBrush(BackColor);
            Pen BorderPen = new Pen(color);

            Rectangle displayRectangle = new Rectangle(new Point(0, 0), new Size(Width - 1, Height - 1));
            graphics.FillRectangle(BrushBackColor, displayRectangle);
            graphics.DrawRectangle(BorderPen, displayRectangle);

            //Define string format 
            StringFormat format1 = new StringFormat(StringFormatFlags.NoClip);
            StringFormat format2 = new StringFormat(format1);
            //Draw text string using the text format
            graphics.DrawString(Text, font, Brushes.GhostWhite, (RectangleF)displayRectangle, format2);

            Response.ContentType = "image/jpeg";
            bitmap.Save(Response.OutputStream, ImageFormat.Jpeg);

            GC.Collect();            
        }
    }
}
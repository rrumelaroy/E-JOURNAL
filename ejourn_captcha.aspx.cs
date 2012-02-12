using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;//2 be added
using System.Drawing.Drawing2D;//to be added
using System.Drawing.Imaging;//to be added

public partial class ejourn_captcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "image/bmp";
        string st = "",s="";
        Random rnd = new Random();
        Int32 num=0,ch=0;
        for (int i = 0; i < 5; i++)
        {
            ch=rnd.Next(2);
            if (ch == 0)
                num = rnd.Next(65, 91);
            if (ch == 0)
                num = rnd.Next(97, 122);
            else
                num = rnd.Next(48, 57);
            s += (Convert.ToChar(num)).ToString();
            st += (Convert.ToChar(num)).ToString() + " ";
        }
        Session.Add("captcha", s);
        Bitmap bmp = new Bitmap(210, 80);
        Graphics g = Graphics.FromImage(bmp);
        Pen p = new Pen(Color.Aqua);
        HatchBrush br = new HatchBrush(HatchStyle.DottedGrid, Color.Aqua, Color.LightGray);
        SolidBrush b = new SolidBrush(Color.Goldenrod);
        Font f = new Font("Chillar", 36);
        g.FillRectangle(br, new Rectangle(0, 0, 210, 80));
        g.DrawString(st, f, b, new Point(5, 5));
        bmp.Save(Response.OutputStream, ImageFormat.Bmp);
        g.DrawLine(p, 20, 10, 210, 80);
    }
}
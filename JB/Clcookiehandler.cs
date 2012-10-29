using System;
using System.Web;
using System.Web.UI;

namespace JB
{
    public class Clcookiehandler: Page
    {
        //read cookie
        public string Readjobcookie()
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
                String strCookieValue = cookie.Value;
                return strCookieValue;
            }
        }
    }
}
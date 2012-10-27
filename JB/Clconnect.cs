using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JB
{    
    public class Clconnect
    {
        public static string makeconn()
        {
            return "Server=localhost; UserId=root; Password=beck; Database=joblight;";
        }
               
    }
}
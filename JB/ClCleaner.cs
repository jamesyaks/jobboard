using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JB
{
    public class ClCleaner
    {
        //typesafe function
        public string cleandbstring(string texttosave)
        {
            string tempholds = texttosave.Replace("'", "''");
            tempholds = tempholds.Replace("\"",string.Empty);

            return tempholds;
        }

    }
}
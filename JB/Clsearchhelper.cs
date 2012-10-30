using System.Data;

namespace JB
{
    public class Clsearchhelper
    {
        /// <summary>
        /// move get jobssingle in here
        /// </summary>
        /// <param name="addedcrit"></param>

        public DataSet Applycriteriafilter(string addedcrit)
        {
            var _qry = @"SELECT distinct idjobs,stitle,sshortdescription,sfreetext, sdescription,dtentereddate,ssalarytext,sminsal,employeeid, smaxsal, applicationvolume from aggregatedmulti where "
                  + addedcrit + " limit 1000;";
            var __dls = new DlSearchfilters();
            return __dls.QuerySearch(_qry);
        }

        public DataSet Applytitlefilter(string titles)
        {
            var _qry = @"SELECT distinct idjobs,stitle,sshortdescription,sfreetext, sdescription,dtentereddate,ssalarytext,sminsal,employeeid, smaxsal, applicationvolume from aggregatedmulti where match(sfreetext) against('" +
                    titles + "') limit 1000;";
            var __dls = new DlSearchfilters();
            return __dls.QuerySearch(_qry);
        }

        public DataSet Applytitlefilter(string titles, string addedcrit)
        {
            var _qry =
                @"SELECT distinct idjobs,stitle,sshortdescription,sfreetext, sdescription,dtentereddate,ssalarytext,sminsal,employeeid, smaxsal, applicationvolume from aggregatedmulti where match(sfreetext) against('" +
                titles + "') and " + addedcrit + " limit 1000;";
            var __dls = new DlSearchfilters();
            return __dls.QuerySearch(_qry);
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace JB
{
    public class ClCodeconverter
    {
        
        //this is to get highest directory index
        public int getmaxfile(string pathset)
        {
            try
            {
                //get max count file
                DirectoryInfo di = new DirectoryInfo(pathset);
                int counter = 0;

                FileInfo[] rgFiles = di.GetFiles("*.*");
                foreach (FileInfo fi in rgFiles)
                {
                    counter = counter + 1;
                }


                return counter;
            }
            catch { return 0; }
        }

        //
        
    }
}

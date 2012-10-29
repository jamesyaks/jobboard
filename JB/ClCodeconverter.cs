using System.IO;
using System.Linq;

namespace JB
{
    public class ClCodeconverter
    {
        //this is to get highest directory index
        public int Getmaxfile(string pathset)
        {
            try
            {
                //get max count file
                var di = new DirectoryInfo(pathset);

                FileInfo[] rgFiles = di.GetFiles("*.*");


                return rgFiles.Count();
            }
            catch
            {
                return 0;
            }
        }

        //
    }
}
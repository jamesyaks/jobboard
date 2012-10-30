using System.Configuration;

namespace JB
{
    public class Dlconnect
    {
        public static string Makeconn()
        {
            return ConfigurationManager.AppSettings["connectionstring"];
        }
    }
}
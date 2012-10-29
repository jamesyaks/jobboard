using System.Security.Cryptography;
using System.Text;

namespace JB
{
    public class ClPwdhash
    {
        //get password
        public string GetMd5Hash(string input)
        {
            var md5Hasher = MD5.Create();

            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));

            var sBuilder = new StringBuilder();

            for (var i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            
            return sBuilder.ToString();
        }
    }
}
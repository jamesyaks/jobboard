using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace JB
{
    public class CLCaptchacls
    {     
        //generate random strings here
        Random random = new Random((int)DateTime.Now.Ticks); //thanks to McAden

        //captch builder
        public string RandomcapString(int size)
        {
            StringBuilder builder = new StringBuilder();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }

            return builder.ToString();
        }     

    }
}
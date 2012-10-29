namespace JB
{
    public class ClCleaner
    {
        //typesafe function
        public string Cleandbstring(string texttosave)
        {
            string tempholds = texttosave.Replace("'", "''");
            tempholds = tempholds.Replace("\"", string.Empty);

            return tempholds;
        }
    }
}
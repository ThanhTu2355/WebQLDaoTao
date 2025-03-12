using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
	public class UserDAO
	{
		public bool checkUser(string username, string password)
        {
            bool isCheck = false;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select password from users where username = @uname", conn);
            cmd.Parameters.AddWithValue("@uname", username);
            string pass= (string) cmd.ExecuteScalar();
            if(pass == null)
            {
                isCheck = false;
            }
            else
            {
                isCheck = string.Compare(pass, password, false) == 0;
            }
            return isCheck;
        }
    }
}
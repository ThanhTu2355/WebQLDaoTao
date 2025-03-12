using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
	public partial class login : System.Web.UI.Page
	{
        UserDAO userDAO = new UserDAO();
        protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text;
            string password = txtPassword.Text;

            if (userDAO.checkUser(username, password))
            {
                FormsAuthentication.RedirectFromLoginPage(username, false);
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.Text = "Mật khẩu hoặc tên đăng nhập không đúng";
            }
        }
    }
}
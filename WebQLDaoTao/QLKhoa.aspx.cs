using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLKhoa : System.Web.UI.Page
    {
        KhoaDAO khoaDAO = new KhoaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            //lấy thông tin từ form
            string makh = txtMaKH.Text;
            string tenkh = txtTenKhoa.Text;

            Khoa kh = new Khoa()
            {
                MaKH = makh,
                TenKH = tenkh,
            };
            khoaDAO.Insert(kh);
            gvKhoa.DataBind();
        }
    }
}
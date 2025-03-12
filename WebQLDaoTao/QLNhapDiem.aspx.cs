using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
	public partial class QLNhapDiem : System.Web.UI.Page
	{
        KetQuaDAO kqDAO = new KetQuaDAO();
        protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnLuu_Click(object sender, EventArgs e)
        {
			for (int i = 0; i < gvDiem.Rows.Count; i++)
			{
				//lấy id(DataKey) của dòng
				int id = int.Parse(gvDiem.DataKeys[i].Value.ToString());
				//lấy điểm
				float diem = float.Parse(((TextBox)gvDiem.Rows[i].FindControl("txtDiem")).Text);
                //cập nhật điểm
                kqDAO.Update(id, diem);
            }
            Response.Write("<script>alert('Lưu thành công!');</script>");
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < gvDiem.Rows.Count; i++)
            {
                //lấy id(DataKey) của dòng
                int id = int.Parse(gvDiem.DataKeys[i].Value.ToString());
                //kiểm tra có check chọn không
                CheckBox chk = (CheckBox)gvDiem.Rows[i].FindControl("chkChon");
                if(chk.Checked)
                    kqDAO.Delete(id);
            }
            gvDiem.DataBind();
            Response.Write("<script>alert('Xóa thành công!');</script>");
        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            bool check = ((CheckBox)gvDiem.HeaderRow.FindControl("chkAll")).Checked;
            for (int i = 0; i < gvDiem.Rows.Count; i++)
            {
                ((CheckBox)gvDiem.Rows[i].FindControl("chkChon")).Checked = check;
            }
        }
    }
}
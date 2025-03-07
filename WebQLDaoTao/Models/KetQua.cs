using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
	public class KetQua
	{
        public int id { get; set; }
        public string MaSV { get; set; }
        public string MaMH { get; set; }
        public float? Diem { get; set; }
        public string hoTen { get; set; }
    }
}
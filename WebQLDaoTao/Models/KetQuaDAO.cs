using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
    public class KetQuaDAO
    {
        public List<KetQua> getAll()
        {
            List<KetQua> ds = new List<KetQua>();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from ketqua", conn);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                KetQua kq = new KetQua()
                {
                    id = int.Parse(rd["id"].ToString()),
                    MaSV = rd["masv"].ToString(),
                    MaMH = rd["MaMH"].ToString()
                };

                if (!string.IsNullOrEmpty(rd["diem"].ToString()))
                {
                    kq.Diem = float.Parse(rd["diem"].ToString());
                }
                ds.Add(kq);
            }
            return ds;
        }

        public List<KetQua> getByMaMH(string mamh)
        {
            List<KetQua> ds = new List<KetQua>();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select ketqua.*, hosv, tensv from ketqua inner join sinhvien on ketqua.masv = sinhvien.masv where mamh = @mamh", conn);
            cmd.Parameters.AddWithValue("@mamh", mamh);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                KetQua kq = new KetQua()
                {
                    id = int.Parse(rd["id"].ToString()),
                    MaSV = rd["masv"].ToString(),
                    MaMH = rd["MaMH"].ToString(),
                    hoTen = rd["hosv"].ToString() + " " + rd["tensv"].ToString()
                };

                if (!string.IsNullOrEmpty(rd["diem"].ToString()))
                {
                    kq.Diem = float.Parse(rd["diem"].ToString());
                }
                ds.Add(kq);
            }
            return ds;
        }

        public int Update(int id, float diem)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("update ketqua set diem = @diem where id = @id", conn);
            cmd.Parameters.AddWithValue("@diem", diem);
            cmd.Parameters.AddWithValue("@id", id);
            return cmd.ExecuteNonQuery();
        }

        public int Delete(int id)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringName"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete from ketqua where id = @id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            return cmd.ExecuteNonQuery();
        }
    }
}
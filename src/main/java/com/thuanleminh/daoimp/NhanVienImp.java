package com.thuanleminh.daoimp;

import com.thuanleminh.entity.NhanVien;

public interface NhanVienImp {
	boolean kiemTraDangNhap(String email,String matkhau);
	boolean kiemTraDangKy(NhanVien nhanVien);


}
  
package com.thuanleminh.daoimp;

import java.util.List;

import com.thuanleminh.entity.SanPham;

public interface SanPhamImp {
	List<SanPham> layDanhSachSanPham(int start);
	 SanPham chiTietSanPhamTheoMa(int masanpham);
	 List<SanPham> listSanPhamTheoMa(int madanhmuc);
	 List<SanPham> layDanhSachSPLimit(int start);
	 List<SanPham> allSanPham();
	 boolean xoaSanPhamTheoMa(int masp);
	
}

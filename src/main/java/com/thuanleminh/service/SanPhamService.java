package com.thuanleminh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thuanleminh.dao.SanPhamDAO;
import com.thuanleminh.daoimp.SanPhamImp;
import com.thuanleminh.entity.SanPham;
@Service

public class SanPhamService implements SanPhamImp{

	@Autowired
	SanPhamDAO sanPhamDAO;
	@Override
	public List<SanPham> layDanhSachSanPham(int start) {
		return sanPhamDAO.layDanhSachSanPham(start);
	}
	@Override
	public SanPham chiTietSanPhamTheoMa(int masanpham) {
		
		return sanPhamDAO.chiTietSanPhamTheoMa(masanpham);
	}
	@Override
	public List<SanPham> listSanPhamTheoMa(int madanhmuc) {
		// TODO Auto-generated method stub
		return sanPhamDAO.listSanPhamTheoMa(madanhmuc);
	}
	@Override
	public List<SanPham> layDanhSachSPLimit(int start) {
		return sanPhamDAO.layDanhSachSPLimit(start);
	}
	@Override
	public List<SanPham> allSanPham() {
		return sanPhamDAO.allSanPham();
	}
	@Override
	public boolean xoaSanPhamTheoMa(int masp) {
		// TODO Auto-generated method stub
		return sanPhamDAO.xoaSanPhamTheoMa(masp);
	}
	

}

package com.thuanleminh.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.thuanleminh.dao.NhanVienDAO;
import com.thuanleminh.daoimp.NhanVienImp;
import com.thuanleminh.entity.NhanVien;

@Service
public class NhanVienService implements NhanVienImp{
	
	@Autowired
	NhanVienDAO nhanVienDAO;

	@Override
	public boolean kiemTraDangNhap(String email, String matkhau) {
		 return nhanVienDAO.kiemTraDangNhap(email, matkhau); 
		
	}

	@Override
	public boolean kiemTraDangKy(NhanVien nhanVien) {
		boolean check = nhanVienDAO.kiemTraDangKy(nhanVien);
		return check;
	}
	
	
	
} 

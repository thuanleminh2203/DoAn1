package com.thuanleminh.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thuanleminh.daoimp.NhanVienImp;
import com.thuanleminh.entity.NhanVien;
@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class NhanVienDAO implements NhanVienImp{
	
	@Autowired
	SessionFactory sessionFactory; 

	@Override
	@Transactional
	public boolean kiemTraDangNhap(String email, String matkhau) {
		Session session = sessionFactory.getCurrentSession();
		try {
			NhanVien nhanVien = (NhanVien) session.createQuery("from nhanvien where email='"+email+"'and matkhau='"+matkhau+"'").uniqueResult();
			if(nhanVien != null) {
				
				return true;
				
			}
		} catch (Exception e) { 
			return false;
		}
		return false;
				
	}

	@Override
	@Transactional
	public boolean kiemTraDangKy(NhanVien nhanVien) {
		Session session = sessionFactory.getCurrentSession();
		try {
			NhanVien nv = (NhanVien) session.createQuery("from nhanvien where email='"+nhanVien.getEmail()+"'").uniqueResult();
			if(nv != null) {
				
				return false;
				
			}
		} catch (Exception e) { 
			System.out.println("loi");
			return false;
		}
		int manv = (int) session.save(nhanVien);
		
		if( manv > 0) {
			return true;
		}
		
		return false;
	}
	

	

	

	
	
}

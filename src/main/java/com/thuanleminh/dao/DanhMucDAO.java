package com.thuanleminh.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import com.thuanleminh.daoimp.DanhMucImp;
import com.thuanleminh.entity.DanhMucSanPham;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class DanhMucDAO implements DanhMucImp{
	

	@Autowired
	SessionFactory sessionFactory; 
	
	@Transactional
	@Override
	public List<DanhMucSanPham> listDanhMuc() {
		Session session = sessionFactory.getCurrentSession();
		List<DanhMucSanPham> danhMucSanPhams = (List<DanhMucSanPham>) session.createQuery("from danhmucsanpham").getResultList();
		return danhMucSanPhams;
	}

}

package com.thuanleminh.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thuanleminh.daoimp.MauSanPhamImp;
import com.thuanleminh.entity.MauSanPham;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class MauSanPhamDAO implements MauSanPhamImp{
	
	@Autowired
	SessionFactory sessionFactory;
	@Override
	@Transactional
	public List<MauSanPham> listMau() {
		Session session = sessionFactory.getCurrentSession();
		List<MauSanPham> listMau = session.createQuery("from mausanpham").getResultList();
		for (MauSanPham mauSanPham : listMau) {
			System.out.println(mauSanPham.getTenmau());
		}
		return listMau;
	}

}

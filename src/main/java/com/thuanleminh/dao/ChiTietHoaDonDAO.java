package com.thuanleminh.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thuanleminh.daoimp.ChiTietHoaDonImp;
import com.thuanleminh.entity.ChiTietHoaDon;
import com.thuanleminh.entity.ChiTietHoaDonId;

@Repository
@Scope(proxyMode= ScopedProxyMode.TARGET_CLASS)
public class ChiTietHoaDonDAO implements ChiTietHoaDonImp {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public boolean ThemChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		Session session= sessionFactory.getCurrentSession();
		ChiTietHoaDonId id =  (ChiTietHoaDonId) session.save(chiTietHoaDon);
		if(id != null) {
			return true;
		}
		return false;
	}

}

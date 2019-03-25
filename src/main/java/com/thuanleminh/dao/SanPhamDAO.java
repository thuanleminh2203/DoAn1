package com.thuanleminh.dao;

import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.thuanleminh.daoimp.SanPhamImp;
import com.thuanleminh.entity.SanPham;

@Repository
@Scope(proxyMode=ScopedProxyMode.TARGET_CLASS)
public class SanPhamDAO implements SanPhamImp{
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<SanPham> layDanhSachSanPham(int start) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> listSanPham = (List<SanPham>) session.createQuery("from sanpham").setFirstResult(start).setMaxResults(20).getResultList();
		return listSanPham;
	}
	
	@Override
	@Transactional
	public SanPham chiTietSanPhamTheoMa(int masanpham){
		Session session = sessionFactory.getCurrentSession();
		SanPham sanPham = (SanPham) session.createQuery("from sanpham sp where sp.masanpham ="+masanpham).getSingleResult();
		return sanPham;
	}

	@Override
	@Transactional
	public List<SanPham> listSanPhamTheoMa(int madanhmuc) {
		System.out.println(madanhmuc);
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> listSanPham =  session.createQuery("from sanpham sp where sp.danhmucsanpham.madanhmuc ="+ madanhmuc).getResultList();
		
		return listSanPham;
	}

	@Override
	@Transactional
	public List<SanPham> layDanhSachSPLimit(int start) {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> listSanPham = (List<SanPham>) session.createQuery("from sanpham").setFirstResult(start).setMaxResults(5).getResultList();
		return listSanPham;
	}

	@Override
	@Transactional
	public List<SanPham> allSanPham() {
		Session session = sessionFactory.getCurrentSession();
		List<SanPham> listSanPham = (List<SanPham>) session.createQuery("from sanpham").getResultList();
		return listSanPham;
	}

	@Override
	@Transactional
	public boolean xoaSanPhamTheoMa(int masp) {
		Session session = sessionFactory.getCurrentSession();
		SanPham sp = new SanPham();
		sp.setMasanpham(masp);
		session.delete(sp);
		return false;
	}


}

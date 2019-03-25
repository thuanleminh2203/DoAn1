package com.thuanleminh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thuanleminh.dao.ChiTietHoaDonDAO;
import com.thuanleminh.daoimp.ChiTietHoaDonImp;
import com.thuanleminh.entity.ChiTietHoaDon;

@Service
public class ChiTietHoaDonService implements ChiTietHoaDonImp{

	@Autowired
	ChiTietHoaDonDAO chiTietHoaDonDAO;
	@Override
	public boolean ThemChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
		// TODO Auto-generated method stub
		return chiTietHoaDonDAO.ThemChiTietHoaDon(chiTietHoaDon);
	}

}

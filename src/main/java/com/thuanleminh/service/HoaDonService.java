package com.thuanleminh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thuanleminh.dao.HoaDonDAO;
import com.thuanleminh.daoimp.HoaDonImp;
import com.thuanleminh.entity.HoaDon;

@Service
public class HoaDonService implements HoaDonImp{

	@Autowired
	HoaDonDAO hoaDonDAO;
	@Override
	public int ThemHoaDon(HoaDon hoaDon) {
		return hoaDonDAO.ThemHoaDon(hoaDon);
	}
	

}

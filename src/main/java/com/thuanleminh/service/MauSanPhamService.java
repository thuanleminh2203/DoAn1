package com.thuanleminh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thuanleminh.dao.MauSanPhamDAO;
import com.thuanleminh.daoimp.MauSanPhamImp;
import com.thuanleminh.entity.MauSanPham;

@Service
public class MauSanPhamService implements MauSanPhamImp {
	@Autowired
	MauSanPhamDAO mauSanPhamDAO;
	
	@Override
	public List<MauSanPham> listMau() {
		return mauSanPhamDAO.listMau();
	}

}

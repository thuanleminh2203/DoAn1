package com.thuanleminh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thuanleminh.dao.DanhMucDAO;
import com.thuanleminh.daoimp.DanhMucImp;
import com.thuanleminh.entity.DanhMucSanPham;

@Service
public class DanhMucService implements DanhMucImp{

	@Autowired
	DanhMucDAO danhMucDAO;
	@Override
	public List<DanhMucSanPham> listDanhMuc() {
		
		return danhMucDAO.listDanhMuc();
	}
	

}

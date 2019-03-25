package com.thuanleminh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thuanleminh.dao.SizeSanPhamDAO;
import com.thuanleminh.daoimp.SizeSanPhamImp;
import com.thuanleminh.entity.SizeSanPham;
@Service
public class SizeSanPhamService implements SizeSanPhamImp{
	@Autowired
	SizeSanPhamDAO sizeSanPhamDAO;
	@Override
	public List<SizeSanPham> listSize() {
		return sizeSanPhamDAO.listSize();
	}

}

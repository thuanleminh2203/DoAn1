package com.thuanleminh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thuanleminh.dao.MauSanPhamDAO;
import com.thuanleminh.dao.SizeSanPhamDAO;
import com.thuanleminh.entity.DanhMucSanPham;
import com.thuanleminh.entity.MauSanPham;
import com.thuanleminh.entity.SanPham;
import com.thuanleminh.entity.SizeSanPham;
import com.thuanleminh.service.DanhMucService;
import com.thuanleminh.service.MauSanPhamService;
import com.thuanleminh.service.SanPhamService;
import com.thuanleminh.service.SizeSanPhamService;

@Controller
@RequestMapping("/themsanpham")
public class ThemSanPhamController {
	@Autowired
	SanPhamService sanPhamService;
	@Autowired
	DanhMucService danhMucService;
	@Autowired
	MauSanPhamService mauSanPhamService;
	@Autowired 
	SizeSanPhamService sizeSanPhamService;
	@GetMapping
	public String Default(ModelMap modelMap) {
		int page = 0;
		List<DanhMucSanPham> danhMucSanPhams = (List<DanhMucSanPham>) danhMucService.listDanhMuc();
		List<SanPham> listSP= sanPhamService.layDanhSachSPLimit(0);
		List<SanPham> allSp = sanPhamService.allSanPham();
		List<MauSanPham> listMau = mauSanPhamService.listMau();
		List<SizeSanPham> listSize = sizeSanPhamService.listSize();
		modelMap.addAttribute("listsp", listSP);
		if((allSp.size() %5) != 0) {
			page = allSp.size() / 5 +1;
			
		}else {
			page = allSp.size() / 5;
		}
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("danhmucsanpham", danhMucSanPhams);
		modelMap.addAttribute("listMau", listMau);
		modelMap.addAttribute("listSize", listSize);
		
		return "themsanpham";
	}
}

package com.thuanleminh.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thuanleminh.entity.DanhMucSanPham;
import com.thuanleminh.entity.SanPham;
import com.thuanleminh.service.DanhMucService;
import com.thuanleminh.service.SanPhamService;

@Controller
@RequestMapping("/")
public class TrangChuController {
	@Autowired
	SanPhamService sanPhamService;
	@Autowired
	DanhMucService danhMucService;
	
	@GetMapping
	public String ViewTrangChu(ModelMap modelMap) {
		List<SanPham> listSanPham = sanPhamService.layDanhSachSanPham(0);
		List<DanhMucSanPham> danhMucSanPhams = (List<DanhMucSanPham>) danhMucService.listDanhMuc();
		modelMap.addAttribute("danhmucsanpham", danhMucSanPhams);
		modelMap.addAttribute("listSanPham", listSanPham);
		return "trangchu";	
	}
	
}

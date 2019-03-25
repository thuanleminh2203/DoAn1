package com.thuanleminh.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.thuanleminh.entity.DanhMucSanPham;
import com.thuanleminh.entity.GioHang;
import com.thuanleminh.entity.SanPham;
import com.thuanleminh.service.DanhMucService;
import com.thuanleminh.service.SanPhamService;

@Controller
@RequestMapping("chitiet/")
@SessionAttributes("soluongsp")
public class ChiTietController {
	@Autowired
	SanPhamService sanPhamService;
	@Autowired
	DanhMucService danhMucService;

	@GetMapping("{masanpham}")
	public String Default(@PathVariable int masanpham, ModelMap modelMap, HttpSession session) {
		SanPham sanPham = sanPhamService.chiTietSanPhamTheoMa(masanpham);
		List<DanhMucSanPham> danhMucSanPhams = (List<DanhMucSanPham>) danhMucService.listDanhMuc();
		if(session.getAttribute("giohang") != null) {
			List<GioHang> listGioHang = (List<GioHang>) session.getAttribute("giohang");
			modelMap.addAttribute("soluongsp", listGioHang.size());
			
		}
		modelMap.addAttribute("danhmucsanpham", danhMucSanPhams);
		modelMap.addAttribute("sanpham", sanPham);
		return "chitiet";
	}
}

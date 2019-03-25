package com.thuanleminh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thuanleminh.entity.DanhMucSanPham;
import com.thuanleminh.entity.SanPham;
import com.thuanleminh.service.DanhMucService;
import com.thuanleminh.service.SanPhamService;

@Controller
@RequestMapping("/sanpham/")
public class SanPhamController {
	
	@Autowired
	DanhMucService danhMucService;
	@Autowired
	SanPhamService sanPhamService;
	@GetMapping("{id}/{tendanhmuc}")
	public String Default(ModelMap modelMap, @PathVariable int id,@PathVariable String tendanhmuc) {
		List<SanPham> listSanPham = sanPhamService.listSanPhamTheoMa(id);
		for (SanPham sanPham : listSanPham) {
			System.out.println(sanPham.getMasanpham()+"------"+ sanPham.getTensanpham());
			
		}
		List<DanhMucSanPham> danhMucSanPhams = (List<DanhMucSanPham>) danhMucService.listDanhMuc();
		
		modelMap.addAttribute("danhmucsanpham", danhMucSanPhams);
		modelMap.addAttribute("listSanPhamDM", listSanPham);
		modelMap.addAttribute("tendanhmuc", tendanhmuc);
		return "sanpham";
	}
}

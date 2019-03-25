package com.thuanleminh.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thuanleminh.entity.ChiTietHoaDon;
import com.thuanleminh.entity.ChiTietHoaDonId;
import com.thuanleminh.entity.GioHang;
import com.thuanleminh.entity.HoaDon;
import com.thuanleminh.service.ChiTietHoaDonService;
import com.thuanleminh.service.HoaDonService;

@Controller
@RequestMapping("giohang/")
public class GioHangController {
	@Autowired
	HoaDonService hoaDonService;
	@Autowired
	ChiTietHoaDonService chiTietHoaDonService;
	@GetMapping
	public String Default(HttpSession session, ModelMap modelMap) {
		if (session.getAttribute("giohang") != null) {
			List<GioHang> listGioHang = (List<GioHang>) session.getAttribute("giohang");
			modelMap.addAttribute("soluongsp", listGioHang.size());
			modelMap.addAttribute("giohang", listGioHang);

		}

		return "giohang";
	}

	@PostMapping
	public String ThemHoaDon(@RequestParam String tenkhachhang, @RequestParam String sdt,
			@RequestParam String diachigiaohang, @RequestParam String hinhthucgiaohang, @RequestParam String ghichu,
			HttpSession session) {

		if (session.getAttribute("giohang") != null) {
			List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
			HoaDon hoaDon = new HoaDon(tenkhachhang, sdt, diachigiaohang, hinhthucgiaohang, ghichu);
			
			int idHoaDon = hoaDonService.ThemHoaDon(hoaDon);
			
			if (idHoaDon >  0) {
			
				for (GioHang gioHang : gioHangs) {
					ChiTietHoaDonId chiTietHoaDonId = new ChiTietHoaDonId();
					chiTietHoaDonId.setMachitietsanpham(gioHang.getMachitiet());
					chiTietHoaDonId.setMahoadon(hoaDon.getMahoadon());
					
					ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
					chiTietHoaDon.setChiTietHoaDonId(chiTietHoaDonId);
					chiTietHoaDon.setGiatien(gioHang.getGiatien().toString());
					chiTietHoaDon.setSoluong(gioHang.getSoluong());
					
					chiTietHoaDonService.ThemChiTietHoaDon(chiTietHoaDon);
				}
			} else {
				System.out.println("them that bai");
			}
			
		
			
		}
		
		return "giohang";

	}

}

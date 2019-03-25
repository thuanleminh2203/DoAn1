package com.thuanleminh.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.thuanleminh.entity.GioHang;
import com.thuanleminh.entity.NhanVien;
import com.thuanleminh.entity.SanPham;
import com.thuanleminh.service.NhanVienService;
import com.thuanleminh.service.SanPhamService;

@Controller
@RequestMapping("api/")
@SessionAttributes({ "email", "giohang" })
public class ApiController {
	@Autowired
	NhanVienService nhanVienService;
	@Autowired
	SanPhamService sanPhamService;

	@PostMapping("KiemTraDangNhap")
	@ResponseBody
	public String XyLyDangNhap(@RequestParam String email, @RequestParam String matkhau, ModelMap modelMap) {

		boolean check = nhanVienService.kiemTraDangNhap(email, matkhau);
		modelMap.addAttribute("email", email);
		return "" + check;
	}

	@PostMapping("KiemTraDangKy")
	@ResponseBody
	public String KiemTraDangKy(@RequestParam String email, @RequestParam String matkhau) {
		NhanVien nv = new NhanVien();
		nv.setEmail(email);
		nv.setMatkhau(matkhau);
		System.out.println("co vao day ko");

		boolean check = nhanVienService.kiemTraDangKy(nv);
		System.out.println("tra ve nhan vien");
		return "" + check;
	}
	
	@GetMapping("CapNhatGioHang")
	@ResponseBody
	public void CapNhatGioHang(HttpSession session,@RequestParam int soluong,@RequestParam int masp,@RequestParam int masize,@RequestParam int mamau) {
		if(session.getAttribute("giohang") != null ) {
			List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
			int vitri = kiemTraGioHang(masp	, masize, mamau, session);
			gioHangs.get(vitri).setSoluong(soluong);
			session.setAttribute("giohang", gioHangs);
			
		}
	}
	
	@GetMapping("XoaGioHang")
	@ResponseBody
	public String XoaGioHang(HttpSession session,@RequestParam int masp,@RequestParam int masize,@RequestParam int mamau) {
		if(session.getAttribute("giohang") != null ) {
			List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
			int vitri = kiemTraGioHang(masp	, masize, mamau, session);
			gioHangs.remove(vitri);
			session.setAttribute("giohang", gioHangs);
			return "true";
			
		}
		return "false";
	}

	@GetMapping("ThemGioHang")
	@ResponseBody
	public String ThemGioHang(@RequestParam int machitiet,@RequestParam int masp, @RequestParam int mamau, @RequestParam int masize,
			@RequestParam String tensp, @RequestParam String giatien, @RequestParam String tenmau,
			@RequestParam String tensize, @RequestParam int soluong,
			HttpSession session) {

		if (session.getAttribute("giohang") == null) {
			List<GioHang> gioHangs = new ArrayList<>();
			GioHang gioHang = new GioHang(machitiet,masp, mamau, masize, tensp, giatien, tenmau, tensize, 1);
			gioHangs.add(gioHang);
			session.setAttribute("giohang", gioHangs);
			return gioHangs.size()+"";
		} else {
			if (kiemTraGioHang(masp, masize, mamau, session) == -1) {
				List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
				GioHang gioHang = new GioHang(machitiet,masp, mamau, masize, tensp, giatien, tenmau, tensize, 1);
				gioHangs.add(gioHang);
				session.setAttribute("giohang", gioHangs);
				return gioHangs.size()+"";
			} else {
				int vitri = kiemTraGioHang(masp, masize, mamau, session);
				List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
				int slmoi = gioHangs.get(vitri).getSoluong() + 1;
				gioHangs.get(vitri).setSoluong(slmoi);
				session.setAttribute("giohang", gioHangs);
				return gioHangs.size()+"";
			}

		}
	}
	
	@GetMapping(path="TaiTrangSanPham", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String loadTrang(@RequestParam int spbatdau) {
		System.out.println(spbatdau);
		String html = "";
		List<SanPham> sanPhams = sanPhamService.layDanhSachSPLimit(spbatdau);
		for (SanPham sanPham : sanPhams) {
			System.out.println("tensp: "+ sanPham.getTensanpham());
		}
		for (SanPham sanPham : sanPhams) {
			html +="<tr>";
			html += "<td class='checkbox'><input type='checkbox' value='"+sanPham.getMasanpham()+"'/></td>";
			html +="<td class='stt'>"+sanPham.getMasanpham()+"</td>";
			html += "<td class='tensp'>"+sanPham.getTensanpham()+"</td>";
			html += "<td class='giatien'>"+sanPham.getGiatien() +" </td>";
			html += "<td><button class='btn btn-primary btn-sm btn-giohang'>Xóa</button></td>";
			html +="</tr>";
		}
		
		return html;
	}
	
	@GetMapping("XoaSanPham")
	@ResponseBody
	public String XoaSanPham(@RequestParam int xoasp) {
		sanPhamService.xoaSanPhamTheoMa(xoasp);
		return "true";
	}
	
	
	@Autowired
	ServletContext context;
	@PostMapping("UploadFile")
	@ResponseBody
	public String UploadFile(MultipartHttpServletRequest rq) {
		System.out.println("dao vao");
		String path_save_file = context.getRealPath("/resources/image/img/");
		Iterator<String> listName = rq.getFileNames();
		MultipartFile mpf = rq.getFile(listName.next());
		File file_save = new File(path_save_file+ mpf.getOriginalFilename());
		try {
			mpf.transferTo(file_save);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		System.out.println(path_save_file);
		return "true";
	}
	

	private int kiemTraGioHang(int ma, int size, int mau, HttpSession session) {
		List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
		for (int i = 0; i < gioHangs.size(); i++) {
			if (gioHangs.get(i).getMasp() == ma && gioHangs.get(i).getMasize() == size
					&& gioHangs.get(i).getMamau() == mau) {
				return i;
			}
		}
		return -1;
	}
	
	
}

package com.thuanleminh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dangnhap/")
public class DangNhapController {
	
	@GetMapping
	public String Default() {
		
		return "dangnhap";
	}
	
	@PostMapping
	public String dangKy() {
		
		return "dangnhap";
	}
}

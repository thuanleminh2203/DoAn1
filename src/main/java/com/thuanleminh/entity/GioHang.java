package com.thuanleminh.entity;

public class GioHang {
	private int machitiet;
	private int masp;
	private int mamau;
	private int masize;
	private String tensp;
	private String giatien;
	private String tenmau;
	private String tensize;
	private int soluong;
	
	public GioHang() {	
	}
	

	
	public GioHang(int machitiet, int masp, int mamau, int masize, String tensp, String giatien, String tenmau,
			String tensize, int soluong) {
		this.machitiet = machitiet;
		this.masp = masp;
		this.mamau = mamau;
		this.masize = masize;
		this.tensp = tensp;
		this.giatien = giatien;
		this.tenmau = tenmau;
		this.tensize = tensize;
		this.soluong = soluong;
	}

	public int getMasp() {
		return masp;
	}
	public int getMachitiet() {
		return machitiet;
	}

	public void setMachitiet(int machitiet) {
		this.machitiet = machitiet;
	}

	public void setMasp(int masp) {
		this.masp = masp;
	}
	public int getMamau() {
		return mamau;
	}
	public void setMamau(int mamau) {
		this.mamau = mamau;
	}
	public int getMasize() {
		return masize;
	}
	public void setMasize(int masize) {
		this.masize = masize;
	}
	public String getTensp() {
		return tensp;
	}
	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	public String getGiatien() {
		return giatien;
	}
	public void setGiatien(String giatien) {
		this.giatien = giatien;
	}
	public String getTenmau() {
		return tenmau;
	}
	public void setTenmau(String tenmau) {
		this.tenmau = tenmau;
	}
	public String getTensize() {
		return tensize;
	}
	public void setTensize(String tensize) {
		this.tensize = tensize;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	
	
}

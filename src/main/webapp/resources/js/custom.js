$(document).ready(function() {

	$("#btn-login").click(function() {
		var email = $("#email-login").val().trim();
		var matkhau = $("#pass-login").val().trim();
		if(email == "" || matkhau == ""){
			$("#ketqua").text("ko den chi ca a m");
		}else {
			
			$.ajax({
				url : "/minishop/api/KiemTraDangNhap",
				type : "post",
				data : {
					email : email,
					matkhau : matkhau
				},
				success : function(value) {
					if (value == "true") {
						duongDanHienTai = window.location.href;
						duongDan = duongDanHienTai.replace("dangnhap/", "");
						window.location = duongDan;
					} else {
						$("#ketqua").text("dang nhap that bai");
					}
				}
				
			})
		}

	});

	$("#btn-singup").click(function() {
		var email = $("#email-singup").val().trim();
		var matkhau = $("#pass-singup").val().trim();
		var confirm = $("#pass-singup-confirm").val().trim();
		
		 if (!(confirm==matkhau)) {
			$("#ketquadangky").text("mat khau khong giong nhau");

		} else {

			$.ajax({
				url : "/minishop/api/KiemTraDangKy",
				type : "post",
				data : {
					email : email,
					matkhau : matkhau,
					confirm : confirm
				},
				success : function(value) {
					if (value == "true") {
						$("#ketquadangky").text("dang ky thanh cong");
					} else {
						$("#ketquadangky").text("Tai khoan da ton tai");
					}
				}

			})
		}

	});
	$(".btn-giohang").click(function() {
		var machitiet = $(this).attr("data-machitiet");
		var tenmau= $(this).closest("tr").find(".mau").text();
		var mamau =  $(this).closest("tr").find(".mau").attr("data-mamau");
		var tensize= $(this).closest("tr").find(".size").text();
		var masize =  $(this).closest("tr").find(".size").attr("data-masize");
		var soluong = $(this).closest("tr").find(".soluong").text();
		var tensp = $("#tensp").text();
		var giatien = $("#giatien").attr("data-value");
		var masp= $("#tensp").attr("data-masp");

		
		$.ajax({
			url : "/minishop/api/ThemGioHang",
			type : "get",
			data : {
				machitiet:machitiet,
				masp : masp,
				mamau : mamau,
				masize: masize,
				tensp : tensp,
				giatien:giatien,
				tenmau:tenmau,
				tensize: tensize,
				soluong: soluong
				
			},
			success : function(value) {
			
				$("#giohang").find("div").addClass("circle-giohang");
				$("#giohang").find("div").text(value);
				
				
			}
		
		})
	});



	$(".form-login-here").click(function() {
		$(this).addClass("active");
		$(".form-signup-here").removeClass("active");
		$(".form-signup").hide();
		$(".form-login").show();
	});

	$(".form-signup-here").click(function() {
		$(this).addClass("active");
		$(".form-login-here").removeClass("active");
		$(".form-login").hide();
		$(".form-signup").show();
	});
	
	GanTongTienGioHang()
	
	function GanTongTienGioHang(isEventChange){
		var tongtiensanpham = 0;
		
		$(".giatien").each(function(){
			var soluong = $(this).closest("tr").find(".soluong-giohang").val();
			var giatien = $(this).closest("tr").find(".giatien").attr("data-value");
			
			var tongtien = parseInt(giatien) * soluong;
			var format = parseFloat(tongtien).toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString();
			if(!isEventChange){
				$(this).text(format);
			}
			tongtiensanpham = tongtiensanpham + tongtien;
			var formattongtien= tongtiensanpham.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString();
			$("#tongtien").text(formattongtien)
			
		});
	}
	
	$(".soluong-giohang").change(function(){
		var soluong = $(this).val();
		var giatien = $(this).closest("tr").find(".giatien").attr("data-value");
		var tongtien = soluong * parseInt(giatien);
		var format = tongtien.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1,").toString()
		$(this).closest("tr").find(".giatien").text(format);
		GanTongTienGioHang(true);
		
		
		var mamau =  $(this).closest("tr").find(".mau").attr("data-mamau");
		var masize =  $(this).closest("tr").find(".size").attr("data-masize");
		var masp=  $(this).closest("tr").find(".tensp").attr("data-masp");
		$.ajax({
			url : "/minishop/api/CapNhatGioHang",
			type : "get",
			data : {
				masp : masp,
				mamau : mamau,
				masize: masize,
				soluong: soluong
				
			},
			success : function(value) {
			
			}
		
		})
	
		
	});

	$(".xoa-giohang").click(function(){
		var self = $(this);
		var mamau =  $(this).closest("tr").find(".mau").attr("data-mamau");
		var masize =  $(this).closest("tr").find(".size").attr("data-masize");
		var masp=  $(this).closest("tr").find(".tensp").attr("data-masp");
		$.ajax({
			url : "/minishop/api/XoaGioHang",
			type : "get",
			data : {
				masp : masp,
				mamau : mamau,
				masize: masize,
			
				
			},
			success : function(value) {
				self.closest("tr").remove();
				GanTongTienGioHang(true);
			}
		
		})
	});
	
	$("body").on("click",".paging-item",function(){
		$(".paging-item").removeClass("active");
		$(this).addClass("active");
		var tranghientai = $(this).text();
		var spbatdau = (tranghientai - 1) * 5;
	
		$.ajax({
			url : "/minishop/api/TaiTrangSanPham",
			type : "get",
			data : {
				spbatdau : spbatdau,
				
				
			},
			success : function(value) {
				var tbodysp = $("#table-sanpham").find("tbody");
				tbodysp.empty();
				tbodysp.append(value);
			}
		
		})
	});
	
	$("#select-all").change(function(){
		if(this.checked){
		
			$("#table-sanpham input").each(function(){
				$(this).attr("checked", true);
			})
		}else{
		
			$("#table-sanpham input").each(function(){
				$(this).attr("checked", false);
			})
		}
	});
	
	$("#xoa-sp").click(function(){
		$("#table-sanpham input:checked").each(function(){
			var masp = $(this).val();
			var self = $("this");
			$.ajax({
				url : "/minishop/api/XoaSanPham",
				type : "get",
				data : {
					xoasp : masp,
					
					
				},
				success : function(value) {
					self.closest("tr").remove();
				}
				
			})
		})
	});
	
	var files=[];
	$("#hinhanh").change(function(event){
		files = event.target.files;
		forms = new FormData();
		forms.append("file",files[0]);
		alert("aaaaaaa");
		$.ajax({
			url : "/minishop/api/UploadFile",
			type : "post",
			data : forms,
			contentType: false,
		    processData: false,
			
			
			success : function(value) {
				
			}
			
		})
	});
	
	$("#them-sp").click(function(event){
		event.preventDefault();
		var formData = $("#form-sanpham").serializeArray();
		json={};
		arrayChiTiet=[];
	
		$.each(formData,function(i,field){
			json[field.name] = field.value;
			
		});
		$("#containerchitietsanpham > .chitietsanpham").each(function(){
			objectChiTiet={};
			sizesanpham	= $(this).find('select[name="sizesanpham"]').val();
			 mausanpham =  $(this).find('select[name="mausanpham"]').val();
			 soluong =  $(this).find('input[name="soluong"]').val();
			 alert(soluong)
			 objectChiTiet["sizesanpham"] = sizesanpham;
			 objectChiTiet["mausanpham"] = mausanpham;
			 objectChiTiet["soluong"] = soluong;
			 
			 arrayChiTiet.push(objectChiTiet);
		})
		json["chitietsanpham"] = arrayChiTiet;
		console.log(json);
		
	});

})
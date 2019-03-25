<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Pooled Admin Panel Category Flat Bootstrap Responsive Web
	Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 




</script>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Custom CSS -->
<link rel="stylesheet" href='<c:url value="/resources/css/style.css" />'>
<link rel="stylesheet"
	href='<c:url value="/resources/css/morris.css" />'>
<!-- Graph CSS -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/font-awesome.css" />'>

<!-- jQuery -->

<!-- //jQuery -->
<link
	href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400'
	rel='stylesheet' type='text/css' />
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet"
	href='<c:url value="/resources/css/icon-font.min.css" />'>
<!-- //lined-icons -->
</head>
<body>
	<div class="page-container">
		<!--/content-inner-->
		<div class="left-content" style="padding-left: 50px">
			<h3>Sản Phẩm</h3>
			<div style="float: right;">
				
				<button id="xoa-sp" class="btn btn-danger btn-sm">Xóa Sản
					Phẩm</button>
			</div>


			<div class="row " style="clear: both;">
				<form action="" id="form-sanpham">
					<div class="col-md-5 col-sm-12">
						<div class="form-group">
							<label for="tensanpham">Tên sản phẩm:</label> <input type="text"
								class="form-control" id="tensanpham" name="tensanpham"
								placeholder="Nhập vào tên sản phẩm">
						</div>
						<div class="form-group">
							<label for="giatien">Giá tiền:</label> <input type="text" name="giatien"
								class="form-control" id="giatien" placeholder="Nhập vào giá tiền">
						</div>
						<div class="form-group">
							<label for="danhmucsanpham">Danh mục sản phẩm:</label> 
								<select name="danhmucsanpham" class="form-control" id="danhmucsanpham">
									<c:forEach var="item" items="${danhmucsanpham}">
										<option value="${item.getMadanhmuc() }"><c:out value="${item.getTendanhmuc() }"></c:out></option>
									</c:forEach>
								</select>
						</div>
						<div class="form-group">
							<label for="mieuta">Miêu tả:</label>
							<textarea class="form-control" rows="5" id="mieuta" name="mieuta"
								placeholder="Nhập vào mô tả"></textarea>
						</div>
						<div class="form-group">
							<label for="hinhanh">Hình ảnh:</label> <input type="file" name="hinhanh"
								class="form-control" id="hinhanh" placeholder="Chọn mục hình ảnh">
						</div>
						<div id="containerchitietsanpham">
							<div class="chitietsanpham">
								
								<h4>Chi tiết</h4>
								<div class="form-group">
									<label for="sizesanpham">Size sản phẩm:</label> 
										<select name="sizesanpham" class="form-control" id="sizesanpham">
											<c:forEach var="item" items="${listSize}">
												<option value="${item.getMasize() }"><c:out value="${item.getSize() }"></c:out></option>
											</c:forEach>
										</select>
								</div>
								<div class="form-group">
									<label for="mausanpham">Màu sản phẩm:</label> 
										<select name="mausanpham" class="form-control" id="mausanpham">
											<c:forEach var="item" items="${listMau}">
												<option value="${item.getMamau() }"><c:out value="${item.getTenmau() }"></c:out></option>
											</c:forEach>
										</select>
								</div>
								<div class="form-group">
									<label for="soluong">Số lượng:</label> <input min="1" value="1"  type="number" name="soluong"
										class="form-control" id="soluong" placeholder="Số lượng cần nhập" />
								</div>
								
							</div>
						</div>
						<div id="chitietsanpham" class="chitietsanpham" style="display: none">
							<h4>Chi tiết</h4>
							<div class="form-group">
								<label for="sizesanpham">Size sản phẩm:</label> 
									<select name="danhmucsanpham" class="form-control" id="sizesanpham">
										<c:forEach var="item" items="${listSize}">
											<option value="${item.getMasize() }"><c:out value="${item.getSize() }"></c:out></option>
										</c:forEach>
									</select>
							</div>
							<div class="form-group">
								<label for="mausanpham">Màu sản phẩm:</label> 
									<select name="danhmucsanpham" class="form-control" id="mausanpham">
										<c:forEach var="item" items="${listMau}">
											<option value="${item.getMamau() }"><c:out value="${item.getTenmau() }"></c:out></option>
										</c:forEach>
									</select>
							</div>
							<div class="form-group">
								<label for="soluong">Số lượng:</label> <input type="number" name="soluong"
									class="form-control" id=""soluong"" placeholder="Số lượng cần nhập">
							</div>
						</div>
					<div style="float: right;"><button id="them-chitiet-sp" class="btn btn-success btn-sm">Thêm Chi Tiết</button></div>
					<div style="clear: both;"><button id="them-sp" class="btn btn-primary btn-sm">Thêm Sản Phẩm</button></div>
						
					</div>
				</form>
				<div class="col-md-7 col-sm-12">
					<table id="table-sanpham" class="table">
						<thead>
							<tr>
								<th style="border-bottom: none" class="checkbox"><input
									id="select-all" type="checkbox" /></th>
								<th>STT</th>
								<th>Tên sản phẩm</th>
								<th>Giá tiền</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="chitietsp" items="${listsp}">
								<tr>
									<td class="checkbox"><input type="checkbox"
										value="${chitietsp.getMasanpham() }" /></td>
									<td class="stt"><c:out
											value="${chitietsp.getMasanpham() }" /></td>
									<td class="tensp"><c:out
											value="${chitietsp.getTensanpham() }" /></td>
									<td class="giatien"><c:out
											value="${chitietsp.getGiatien() }" /></td>
									<td><button class="btn btn-primary btn-sm btn-giohang">Xóa</button></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<div style="text-align: center;">

						<ul class="pagination">
							<c:forEach var="i" begin="1" end="${page}">
								<c:choose>

									<c:when test="${i==1}">
										<li class="paging-item active"><a href="#"><c:out
													value="${i}" /></a></li>
									</c:when>
									<c:otherwise>
										<li class="paging-item"><a href="#"><c:out
													value="${i}" /></a></li>
									</c:otherwise>
								</c:choose>

							</c:forEach>

						</ul>
					</div>

				</div>

			</div>

		</div>
		<!--//content-inner-->
		<!--/sidebar-menu-->
		<div class="sidebar-menu">
			<header class="logo1">
				<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span>
				</a>
			</header>
			<div style="border-top: 1px ridge rgba(255, 255, 255, 0.15)"></div>
			<div class="menu">
				<ul id="menu">
					<li><a href="index.html"><i class="fa fa-tachometer"></i>
							<span>Dashboard</span>
							<div class="clearfix"></div></a></li>


					<li id="menu-academico"><a href="inbox.html"><i
							class="fa fa-envelope nav_icon"></i><span>Inbox</span>
							<div class="clearfix"></div></a></li>
					<li><a href="gallery.html"><i class="fa fa-picture-o"
							aria-hidden="true"></i><span>Gallery</span>
							<div class="clearfix"></div></a></li>
					<li id="menu-academico"><a href="charts.html"><i
							class="fa fa-bar-chart"></i><span>Charts</span>
							<div class="clearfix"></div></a></li>
					<li id="menu-academico"><a href="#"><i
							class="fa fa-list-ul" aria-hidden="true"></i><span> Short
								Codes</span> <span class="fa fa-angle-right" style="float: right"></span>
							<div class="clearfix"></div></a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="icons.html">Icons</a></li>
							<li id="menu-academico-avaliacoes"><a href="typography.html">Typography</a></li>
							<li id="menu-academico-avaliacoes"><a href="faq.html">Faq</a></li>
						</ul></li>
					<li id="menu-academico"><a href="errorpage.html"><i
							class="fa fa-exclamation-triangle" aria-hidden="true"></i><span>Error
								Page</span>
							<div class="clearfix"></div></a></li>
					<li id="menu-academico"><a href="#"><i class="fa fa-cogs"
							aria-hidden="true"></i><span> UI Components</span> <span
							class="fa fa-angle-right" style="float: right"></span>
							<div class="clearfix"></div></a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="button.html">Buttons</a></li>
							<li id="menu-academico-avaliacoes"><a href="grid.html">Grids</a></li>
						</ul></li>
					<li><a href="tabels.html"><i class="fa fa-table"></i> <span>Tables</span>
							<div class="clearfix"></div></a></li>
					<li><a href="maps.html"><i class="fa fa-map-marker"
							aria-hidden="true"></i> <span>Maps</span>
							<div class="clearfix"></div></a></li>
					<li id="menu-academico"><a href="#"><i
							class="fa fa-file-text-o"></i> <span>Pages</span> <span
							class="fa fa-angle-right" style="float: right"></span>
							<div class="clearfix"></div></a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-boletim"><a href="calendar.html">Calendar</a></li>
							<li id="menu-academico-avaliacoes"><a href="signin.html">Sign
									In</a></li>
							<li id="menu-academico-avaliacoes"><a href="signup.html">Sign
									Up</a></li>


						</ul></li>
					<li><a href="#"><i class="fa fa-check-square-o nav_icon"></i><span>Forms</span>
							<span class="fa fa-angle-right" style="float: right"></span>
							<div class="clearfix"></div></a>
						<ul>
							<li><a href="input.html"> Input</a></li>
							<li><a href="validation.html">Validation</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<script>
		var toggle = true;

		$(".sidebar-icon").click(
				function() {
					if (toggle) {
						$(".page-container").addClass("sidebar-collapsed")
								.removeClass("sidebar-collapsed-back");
						$("#menu span").css({
							"position" : "absolute"
						});
					} else {
						$(".page-container").removeClass("sidebar-collapsed")
								.addClass("sidebar-collapsed-back");
						setTimeout(function() {
							$("#menu span").css({
								"position" : "relative"
							});
						}, 400);
					}

					toggle = !toggle;
				});
	</script>
	<!--js -->
	<script src='<c:url value="/resources/js/jquery.nicescroll.js" />'></script>
	<script src='<c:url value="/resources/js/scripts.js" />'></script>

	<!-- Bootstrap Core JavaScript -->
	<script src='<c:url value="/resources/js/bootstrap.min.js" />'></script>

	<!-- /Bootstrap Core JavaScript -->
	<!-- morris JavaScript -->
	<script src='<c:url value="/resources/js/raphael-min.js" />'></script>

	<script>
		$(document).ready(function() {
					//BOX BUTTON SHOW AND CLOSE
					jQuery('.small-graph-box').hover(function() {
						jQuery(this).find('.box-button').fadeIn('fast');
					}, function() {
						jQuery(this).find('.box-button').fadeOut('fast');
					});
					jQuery('.small-graph-box .box-close').click(function() {
						jQuery(this).closest('.small-graph-box').fadeOut(200);
						return false;
					});

					//CHARTS
					function gd(year, day, month) {
						return new Date(year, month - 1, day).getTime();
					}

				
					});

				
	</script>
</body>
</html>
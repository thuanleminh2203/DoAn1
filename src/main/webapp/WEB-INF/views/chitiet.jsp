<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>

	<div class="header-chitiet">
		<nav class="navbar navbar-default none-nav">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="trangchu"><span
						style="color: red;">Yame</span><span style="color: white;">Shop</span></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/">TRANG CHỦ </a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Dropdown <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="test" items="${danhmucsanpham }">
									<li><a href="sanpham/${test.getMadanhmuc() }"><c:out value="${test.getTendanhmuc()}" /></a></li>
									<li role="separator" class="divider"></li>
								</c:forEach>

							</ul></li>
						<li><a href="#">DỊCH VỤ</a></li>
						<li><a href="#">LIÊN HỆ</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${email != null }">
								<li style="color: cornsilk; padding-top: 14px;"><c:out
										value="${email }" /></li>
							</c:when>
							<c:otherwise>
								<li><a href="dangnhap/">Đăng Nhập</a></li>

							</c:otherwise>
						</c:choose>
						<li id="giohang"><a href="#"><img alt="Img_oval"
								src='<c:url value="/resources/image/cart.png"/>' /></a> <c:if
								test="${soluongsp > 0}">
								<div class="circle-giohang">
									<span id="slsanpham"><c:out value="${soluongsp}" /></span>
								</div>

							</c:if> <c:if test="${soluongsp == null}">
								<div>
									<span id="slsanpham"><c:out value="${soluongsp}" /></span>
								</div>

							</c:if></li>


					</ul>
				</div>

				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>


	</div>
	<div class="container" style="margin-top: 10px">
		<div class="row">
			<div class="col-sm-2 col-md-2 ">
				<div class="mymenu">
					<h4>Danh mục sản phẩm</h4>
					<ul>
						<c:forEach var="test" items="${danhmucsanpham }">
							<li><a href="#"><c:out value="${test.getTendanhmuc()}" /></a></li>
						</c:forEach>


					</ul>
				</div>
			</div>
			<div class="col-sm-8 col-md-8">
				<div class="row">
					<div class="col-sm-6 col-md-6">
						<img style="height: 450px" alt="Img_oval"
							src='<c:url value="/resources/image/img/${sanpham.getHinhsanpham() }"/>' />
					</div>
					<div class="col-sm-6 col-md-6">
						<h3 id="tensp" data-masp="${sanpham.getMasanpham()}">
							<c:out value="${sanpham.getTensanpham()}" />
						</h3>
						<h4 id="giatien" data-value="${sanpham.getGiatien()}">
							<c:out value="${sanpham.getGiatien() }" />
							VND
						</h4>
						<table class="table">
							<thead>
								<th>Kích thước</th>
								<th>Màu sản phẩm</th>
								<th>Số lượng</th>
							</thead>
							<tbody>
								<c:forEach var="chitietsp"
									items="${sanpham.getChitietsanpham()}">
									<tr>
										<td class="size"
											data-masize="${chitietsp.getSizesanpham().getMasize()}"><c:out
												value="${chitietsp.getSizesanpham().getSize() }" /></td>
										<td class="mau"
											data-mamau="${chitietsp.getMauSanPham().getMamau()}"><c:out
												value="${chitietsp.getMauSanPham().getTenmau() }" /></td>
										<td class="soluong"><c:out
												value="${chitietsp.getSoluong() }" /></td>
										<td><button class="btn btn-primary btn-sm btn-giohang"
												data-machitiet="${chitietsp.getMachitietsanpham() }">Giỏ
												hàng</button></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>


			</div>
			<div class="col-sm-2 col-md-2">Contrary to popular belief,
				Lorem Ipsum is not simply random text. It has roots in a piece of
				classical Latin literature from 45 BC, making it over 2000 years
				old. Richard McClintock, a Latin professor at Hampden-Sydney College
				in Virginia, looked up one of the more obscure Latin words,
				consectetur, from a Lorem Ipsum passage, and going through the cites
				of the word in classical literature, discovered the undoubtable
				source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de
				Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by
				Cicero, written in 45 BC. This book is a treatise on the theory of
				ethics, very popular during the Renaissance.</div>


		</div>


	</div>



	<footer class="container-fluid">
		<div class="row footer-infor">
			<div class="col-md-4 col-sm-4 title ">
				<span>Thông tin shop</span>
				<p>Yame là một thương hiệu thời trang uy tín, luôn đảm bảo chất
					lượng sản phẩm tốt nhất cho khách hàng</p>
			</div>
			<div class="col-md-4 col-sm-4 title ">
				<span>Liên hệ</span>
				<p>Số 1 đường Giải Phóng đại học bách khoa Hà Nội</p>
				<p>anhku0j97@gmail.com</p>
				<p>0981 352 703</p>
			</div>
			<div class="col-md-4 col-sm-4 title ">
				<span>Góp ý</span><br />
				<form action="" method="post">
					<input name="tenNhanVien" class="feedback" type="text"
						placeholder="Email" />
					<textarea name="tuoi" class="feedback" rows="4" cols="50"
						placeholder="Content"></textarea>
					<br>
					<button type="submit">Submit</button>

				</form>
			</div>
		</div>

	</footer>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
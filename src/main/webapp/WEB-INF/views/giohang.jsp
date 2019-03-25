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
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">Separated link</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">One more separated link</a></li>
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
		<div class="col-md-6 col-sm-12">
				<h3>Thông tin người mua</h3>
				<form action="" method="post">
					<div class="form-group">
						<label for="tennguoimua">Tên người mua/nhận</label> <input class="form-control" id="tennguoimua" name="tenkhachhang"/>
						<label for="dienthoailienlac">Điện thoại liên lạc</label> <input class="form-control" id="dienthoailienlac"name="sdt"/>
							<div class="radio">
							  <label><input type="radio" name="hinhthucgiaohang" value="Giao hàng tận nơi" checked>Giao hàng tận nơi</label>
							</div>
							<div class="radio">
							  <label><input type="radio" name="hinhthucgiaohang" value="Nhận hàng tại cửa hàng">Nhận hàng tại cửa hàng</label>
							</div>
							
						<label for="diachinhanhang">Địa chỉ nhận hàng</label> <input class="form-control" id="diachinhanhang" name="diachigiaohang"/>
						<label for="ghichu">Ghi chú:</label> <textarea class="form-control" rows="5" id="ghichu" name="ghichu"></textarea><br/>
						<input type="submit" class="btn btn-primary btn-sm " value="Đặt hàng" />
					</div>
				</form>
				
				
			</div>

			<div class="col-md-6 col-sm-12">
				<h3>Danh sách sán phẩm trong giỏ hàng</h3>
				<table class="table">
					<thead>
						<th>Tên sản phẩm</th>
						<th>Màu sản phẩm</th>
						<th>Kích thước</th>
						<th>Số lượng</th>
						<th>Giá tiền</th>
					</thead>
					<tbody>
						<c:forEach var="test" items="${giohang}">
							<tr data-value="${test.getMachitiet() }">
								<td class="tensp" data-masp="${test.getMasp() }"><c:out value="${test.getTensp() }" /></td>
								<td class="mau" data-mamau="${test.getMamau()}"><c:out
										value="${test.getTenmau() }" /></td>
								<td class="size" data-masize="${test.getMasize()}"><c:out
										value="${test.getTensize()}" /></td>
								<td class="soluong"><input min="1" class="soluong-giohang" type="number"
									value="<c:out value="${test.getSoluong() }" />" /></td>
								<td class="giatien" data-value="${test.getGiatien()}"><c:out value="${test.getGiatien()}" /></td>
								<td><button class="xoa-giohang btn btn-danger btn-sm ">Xóa</button></td>
							</tr>
						</c:forEach>
					</tbody>
					


				</table>
				<h3 >Tổng tiền:<span style="color: red" id="tongtien"></span> </h3>
			</div>
			
			

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>

	<header>
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
						style="color: red;">ThuanDZ</span><span style="color: white;">Shop</span></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">TRANG CHỦ </a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Sản Phẩm <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="test" items="${danhmucsanpham }">
									<li><a href='<c:url value="/sanpham/${test.getMadanhmuc() }/${test.getTendanhmuc()}" />'><c:out value="${test.getTendanhmuc()}" /></a></li>
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
						<li><a href="#"><img alt="Img_oval"
								src='<c:url value="/resources/image/cart.png"/>' /></a><span><c:out
									value="${soluongsp}" /></span></li>

					</ul>
				</div>

				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<div class=" container wow shake">
			<div class="event-header">
				<span>Ngày 19/11 - 31/12/2018</span>
				<p style="font-size: 50px;">Mua 1 tặng 1</p>
				<button>XEM NGAY</button>
			</div>

		</div>

	</header>
	<section class="container">
		<div class="row text-section">
			<div class="col-12 col-md-4 col-sm-4 wow fadeInLeft"
				data-wow-duration="1s">
				<img alt="Img_oval" class="icon"
					src='<c:url value="/resources/image/quanlyti.png"/>' />
				<p>CHẤT LƯỢNG</p>
				<p>Chúng tôi cam kết sẽ mang đến cho các bạn chất lượng sản phẩm
					tốt nhất</p>

			</div>
			<div class="col-12 col-md-4 col-sm-4 wow fadeInDown"
				data-wow-duration="1s" data-wow-delay="1s">
				<img alt="Img_oval" class="icon"
					src='<c:url value="/resources/image/tietkiem.png"/>' />
				<p>TIẾT KIỆM CHI PHÍ</p>
				<p>Cam kết giá rẻ nhất Việt Nam, giảm chi phí lến tới 20% cho
					mỗi sản phẩm của bạn</p>

			</div>
			<div class="col-12 col-md-4 col-sm-4 wow fadeInUp"
				data-wow-duration="1s" data-wow-delay="2s">
				<img alt="Img_oval" class="icon"
					src='<c:url value="/resources/image/giaohang.png"/>' />
				<p>GIAO HÀNG</p>
				<p>Cam kết giao hàng tận nơi trong ngày. Để mang sản phẩm đến
					cho khách hàng nhanh nhất</p>

			</div>
		</div>
		<div class="container"
			style="text-align: center; font-size: x-large; margin-top: 60px">
			<span style="font-weight: bold;">SẢN PHẨM HOT</span>

			<div class="row">
				<c:forEach items="${listSanPham}" var="sp">
					<a href="chitiet/<c:out value='${sp.getMasanpham() }'/>">

						<div class="col-md-3 col-sm-6 ">
							<div class="product-hot wow fadeInUp">
								<img alt="Img_oval" style="width: 210px"
									src='<c:url value="/resources/image/img/${sp.getHinhsanpham() }"/>' />
								<p>
									<c:out value="${sp.getTensanpham() }" />
								</p>
								<span><c:out value="${sp.getGiatien()}" />VND</span>
							</div>

						</div>
					</a>
				</c:forEach>



			</div>
		</div>


	</section>
	<footer class="container-fluid">
		<div class="row footer-infor">
			<div class="col-md-4 col-sm-4 title wow tada">
				<span>Thông tin shop</span>
				<p>Yame là một thương hiệu thời trang uy tín, luôn đảm bảo chất
					lượng sản phẩm tốt nhất cho khách hàng</p>
			</div>
			<div class="col-md-4 col-sm-4 title wow tada">
				<span>Liên hệ</span>
				<p>Số 1 đường Giải Phóng đại học bách khoa Hà Nội</p>
				<p>anhku0j97@gmail.com</p>
				<p>0981 352 703</p>
			</div>
			<div class="col-md-4 col-sm-4 title wow tada">
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
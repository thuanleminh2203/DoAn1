<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<jsp:include page="header.jsp" />
</head>
<body id="body-login">
	<div id="body-flex-login">

		<div id="container-login">
			<div id="container-login-left">
				<div class="header-login" id="heafer-left">
					<span id="text-logo">Welcome</span>
					<p id="hint-text-login">Hãy tạo nên phong cách của bạn cùng
						MiniShop!</p>
				</div>
				<div>
					<p>
						<img alt="Img_oval"
							src='<c:url value="/resources/image/img_oval.png"/>' />Luôn cập
						nhật xu hướng thòi trang mới nhất
					</p>
					<p>
						<img alt="Img_oval"
							src='<c:url value="/resources/image/img_oval.png"/>' />Giảm giá
						50% cho toàn bộ khách VIP
					</p>
					<p>
						<img alt="Img_oval"
							src='<c:url value="/resources/image/img_oval.png"/>' />Tận tình
						tư vấn để tạo nên phong cách của bạn
					</p>
				</div>

			</div>
			<div id="container-login-right">
				<div class="header-login" id="header-top-right">
					<span class="form-login-here active">Đăng nhập</span>/ <span class="form-signup-here">Đăng ký</span>

				</div>
				<div class="form-login" >
					<form  method="post">
						<input id="email-login" name="email" class="input-icon-email" type="email" placeholder="Email" required />
						 <input id="pass-login" name="matkhau" class=" input-icon-password" type="password"placeholder="Password" required />
						 <input	class="metorial-primary-button" id="btn-login" type="button" value="Đăng Nhập" /><br />
					</form>
					<span style="color: red;" id="ketqua"></span>
				</div>

				<div class="form-signup" >
					<form  method="post">
					   <input id="email-singup"  name="email" class=" input-icon-email"type="email" placeholder="Email" required />
					   <input id="pass-singup"   name="matkhau"  class="input-icon-password" type="password"	placeholder="Password"  required/>
					   <input id="pass-singup-confirm" name="nhaplaimk" class=" input-icon-password" type="password" placeholder="Confirm Password"  required /> 
					   <input id="btn-singup" class="metorial-primary-button" type="button" value="Đăng Ký" />
					</form>
						<span style="color: red;" id="ketquadangky"></span>
				</div>
				<p style="color: red;"><c:out value="${email}" /></p>
				<div id="icon_login">
					<img alt="Img_oval" src='<c:url value="/resources/image/fb.png"/>'>
					<img alt="Img_oval" src='<c:url value="/resources/image/gg.png"/>'>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
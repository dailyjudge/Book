<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function chk_form() {
document.getElementById('frm').submit();
}
</script>
</head>
<body>
<div class="account-container">
		<div class="img-container">
				<a href="HC">
				<img class="account-img"
					src="assets/main.png" alt="">
					</a>
		</div>
		
		<div class="item-container2">
			<h3>${sessionScope.accountInfo.b_name }님 안녕하세요!</h3>
			<a href="User_info_controller" class="account-item">마이페이지</a>
			<a href="Logout_controller" class="account-item">로그아웃</a>
		</div>
	</div>
</body>
</html>
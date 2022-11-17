<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${r }
<div class="account-container">
		<div class="img-container">
			<img class="account-img"
				src="assets/main.png"
				alt=""
				onclick="location.href='HC'"
				>
		</div>
		<div class="item-container">
			<a class="account-item" href="Login_controller">로그인</a> 
			<a class="account-item" href="Account_register_controller">회원가입</a>
		</div>
	</div>
</body>
</html>
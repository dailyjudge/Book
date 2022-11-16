<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 정보</h1>
	<div>
		<img src="fileFolder/${sessionScope.accountInfo.b_pic }">
	</div>
	<div>ID ${sessionScope.accountInfo.b_id }</div>
	<div>NAME ${sessionScope.accountInfo.b_name }</div>
	<div>E-MAIL ${sessionScope.accountInfo.b_email }</div>
	<div>LIKES ${sessionScope.accountInfo.b_likes }</div>
	<button onclick="location.href='Logout_controller'">로그아웃</button>
	<button onclick="location.href='Update_info_controller'">정보수정</button>
	<button onclick="location.href='Delete_info_controller'">회원탈퇴</button>
</body>
</html>
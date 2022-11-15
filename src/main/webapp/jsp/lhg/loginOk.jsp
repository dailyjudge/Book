<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${sessionScope.accountInfo.b_id }(${sessionScope.accountInfo.b_name })님
	<br> 안녕하세요 <br>
	<button onclick="location.href='User_info_controller'">회원정보</button>
	<button onclick="location.href='Logout_controller'">로그아웃</button>
</body>
</html>
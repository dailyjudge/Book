<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Login_controller" method="post">
<div>ID</div>
<div><input name="id" id="id"></div>
<div>PW</div>
<div><input name="pw" id="pw"></div>
<button>로그인</button>
<button type="button" onclick="location.href='Account_register_controller'">회원가입</button>
</form>
</body>
</html>
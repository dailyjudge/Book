<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<script src="js/check.js"></script>
</head>
<body>
	<div class="login-container">
		<h1>로그인</h1>
		<form class="login-form" name="login-form" action="Login_controller"
			method="post" onsubmit="return login()">
			<input type="text" name="id" placeholder="아이디"> <input
				type="password" name="pw" placeholder="패스워드">
			<div class="button_area">
				<button>로그인</button>
			</div>
		</form>
		<div>
			<div class="login-other">
				<a id="naver" href=""><i class="xi-naver xi-3x"></i></a> <a
					id="kakao" href=""><i class="xi-kakaotalk xi-3x"></i></a> <a
					href=""><img id="google"
					src="https://cdn-icons-png.flaticon.com/512/2991/2991148.png"></a>
			</div>
		</div>
		<div class="register_area">
			<a class="find-id" type="button" href="Find_id_controller">아이디</a>&nbsp;
			<a>·</a>&nbsp; <a class="find-pw" type="button"
				href="Find_pw_controller">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
				class="reg-user" type="button" href="Account_register_controller">처음
				오셨나요?</a>
		</div>
	</div>
</body>
</html>

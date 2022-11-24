<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/findinfo.js"></script>
<link rel="stylesheet" href="css/findPw.css">
</head>
<body>
	<form action="Find_pw_controller" method="post" name="findPw"
		onsubmit="return pwCheck()">
		<div class="find-pw-container">
			<div>
				<h3 class="find-pw">비밀번호 찾기</h3>
			</div>
			<div class="find-id">
				<input name="id" class="btn-name"
					placeholder="등록한 아이디">
			</div>
			<br>
			<div class="find-email">
				<input name="email" class="btn-email"
					placeholder="등록한 이메일">
			</div>
			<br>
			<div class="find-button">
			<button>찾기</button>
			</div>
			</div>
	</form>
</body>
</html>
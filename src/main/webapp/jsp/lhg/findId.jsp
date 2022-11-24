<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/findinfo.js"></script>
</head>
<body>
	<form action="Find_id_controller" method="post" name="findId" onsubmit="return idCheck()">
		<div>
			<h3>이메일 본인 확인</h3>
		</div>
		<div class="find-name">
			<label>이름</label> 
			<input name="name" class="btn-name"	placeholder="등록한 이름">
		</div>
		<br>
		<div class="find-email">
			<label>이메일</label>
			<input name="email" class="btn-email" placeholder="등록한 이메일">
		</div>
		<br>
		<button>찾기</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Account_register_controller" name="myForm" method="post"
		enctype="multipart/form-data" onsubmit="return call()">
		<div>회원가입</div>
		<div>ID</div>
		<div>
			<input type="text" name="id" placeholder="한글x, 5글자 이상"> 
			<input type="button" value="중복확인" class="dup" onclick="winopen()"><br>
		</div>
		<div>
			이름<input name="name" placeholder="필수">
		</div>
		<div>
			E-MAIL<input name="email">
		</div>
		<div>PW</div>
		<div>
			<input name="pw" placeholder="3글자 이상, 대,소,숫 포함">
		</div>
		<div>PW 확인</div>
		<div>
			<input name="pw2" placeholder="비밀번호 일치 확인" autocomplete="off"><span
				id="pwConfirm" style="display: none;"></span>
		</div>
		<div>관심사</div>
		<div>
		Select All<input type="checkbox" name ="chk" value ="selectall" onclick="selectAll(this)">
		</div>
		<div>
			추리<input type="checkbox" name="chk" value="detective">
		</div>
		<div>
			로맨스<input type="checkbox" name="chk" value="romance">
		</div>
		<div>프사</div>
		<div>
			<input type="file" name="file">
		</div>
		<div>
			<button>가입</button>
		</div>
	</form>
</body>
</html>
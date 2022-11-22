<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/Update_info.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Update_info_controller" name="myForm" method="post"
		enctype="multipart/form-data" onsubmit="return call()">
		<h1>정보 수정</h1>
		<div>
			<img src="fileFolder/${sessionScope.accountInfo.b_pic }"> <br>
			<input type="file" name="file">
		</div>
		<div id="id">
			<input name="id" type="hidden"
				value="${sessionScope.accountInfo.b_id }">
		</div>
		<div id="pw">
			PW <input name="pw" value="${sessionScope.accountInfo.b_pw }">
		</div>
		<div id="name">
			NAME <input name="name" value="${sessionScope.accountInfo.b_name }">
		</div>
		<div id="email">
			E-MAIL <input name="email"
				value="${sessionScope.accountInfo.b_email }">
		</div>
		<div  id="likes">
			LIKES
			<div>
				추리 <input type="checkbox" name="chk" value="detective"> 로맨스
				<input type="checkbox" name="chk" value="romance">
			</div>
		</div>
		<button>수정</button>
	</form>
</body>
</html>
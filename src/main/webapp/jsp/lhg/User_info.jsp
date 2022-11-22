<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="css/myPage.css" />
</head>
<body>
	<h1>회원 정보</h1>
	<div class="user_info">
		<div id="file_container">
			<div id="file_img">
				<img src="fileFolder/${sessionScope.accountInfo.b_pic }" />
			</div>
		</div>
		<div>${sessionScope.accountInfo.b_id }</div>
		<div>${sessionScope.accountInfo.b_name }님</div>
		<div>${sessionScope.accountInfo.b_email }</div>
		<div>${sessionScope.accountInfo.b_likes }</div>
	</div>
	<div class="button_area">
		<button onclick="location.href='Logout_controller'">로그아웃</button>
		<button onclick="location.href='Update_info_controller'">정보수정</button>
		<button onclick="location.href='Delete_info_controller'">회원탈퇴</button>
	</div>
</body>
</html>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Account_register_controller" method="post" enctype="multipart/form-data">
<div>회원가입</div>
<div>ID</div>
<div><input name="id" placeholder="한글x, 5글자 이상"></div>
<div>이름<input name="name" placeholder="필수"></div>
<div>E-MAIL<input name="email"></div>
<div>PW</div>
<div><input name="pw" placeholder="3글자 이상, 대,소,숫 포함"></div>
<div>관심사</div>
<div>추리<input type="checkbox" name="chk" value="detective"></div>
<div>로맨스<input type="checkbox" name="chk" value="romance"></div>
<div>프사</div>
<div><input type="file" name="file"></div>
<div><button>가입</button></div>
</form>
</body>
</html>
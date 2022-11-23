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
	<form action="Find_id_controller" name="idfindscreen" method="post" onsubmit="return search()">
			<div>
				<h6 class="">이름</h6>
				<input type="text" name="name" id="name" class="btn-name">
				<font id="checkName" size="2"></font>
			</div>
			<div>
				<h6 class="">이메일</h6>
				<input type="text" name="email" id="email" class="btn-email">
				<font id="checkEmail" size="2"></font>
			</div>
			<br>
		<div class="btnSearch">
			<button>찾기</button>
		</div>
	</form>
	<script>
	$('.btn-name').focusout(function() {
		let userName = $('.btn-name').val();

		$.ajax({
			url : "http://localhost/Semi-Project/Info_check",
			type : "post",
			data : {
				userName : userName
			},
			dataType : 'json',
			success : function(result) {
				if (result == 0) {
					$("#checkName").html('이름이 확인되었습니다.');
					$("#checkName").attr('color', 'green');
				} else {
					$("#checkName").html('이름을 확인할 수 없습니다.');
					$("#checkName").attr('color', 'red');
				}
			},
			error : function() {
				alert("서버 요청 실패");
			}
		})

	})
	</script>
</body>
</html>
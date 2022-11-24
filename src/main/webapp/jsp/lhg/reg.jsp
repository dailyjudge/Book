<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function setThumbnail(event) {
		var reader = new FileReader();

		reader.onload = function(event) {
			var img = document.createElement("img");
			console.log(event.target);
			img.setAttribute("src", event.target.result);
			img.setAttribute("width", "100%");
			img.setAttribute("height", "100%");
			img.setAttribute("style", "border-radius: 50%");
			$("#test-img").css("display", "none");
			document.querySelector("div#image_container").appendChild(img);

		};

		reader.readAsDataURL(event.target.files[0]);
	}
</script>
<link rel="stylesheet" href="css/reg.css">
<link rel="stylesheet" href="css/index.css">

<body>
	<div class="reg-container top-container2">
		<form class="reg-form" method="post"
			action="Account_register_controller" name="myForm" method="post"
			enctype="multipart/form-data" onsubmit="return call()">
			
			<div id="profile-img-container">
				<div id="image_container">
					<img id="test-img"
						src="https://cdn-icons-png.flaticon.com/128/5309/5309035.png"
						alt="">
				</div>

				<label class="input-file-button" for="input-file"> <img
					class="input-file-img"
					src="https://cdn-icons-png.flaticon.com/128/7571/7571051.png"
					alt="">
				</label> <input onchange="setThumbnail(event);" type="file" name="file"
					id="input-file" style="display: none;" />
			</div>
			<div>
				<h6 class="reg-field">아이디</h6>
				<input type="text" name="id">
				<input type="text" name="id" class="input_id">
				<font id="checkId" size="2"></font>
			</div>
			<div>
				<h6 class="reg-field">비밀번호</h6>
				<input type="password" name="pw">
			</div>
			<div>
				<h6 class="reg-field">비밀번호 재입력</h6>
				<input type="password" name="pw2">
				<input type="password" name="pw2" id="pw2"> 
				<font id="pwConfirm" size="2"></font>
			</div>
			<div>
				<h6 class="reg-field">이름</h6>
				<input type="text" name="name">
			</div>
			<div>
				<h6 class="reg-field">이메일</h6>
				<input type="text" name="email">
			</div>
			<div>
				<h6 class="reg-field check-likes">관심사</h6>
			</div>
			<div class="check-list">
				소설<input class="like" type="checkbox" name="chk" value="101">
				시/에세이<input class="like" type="checkbox" name="chk" value="102">
				사회과학<input class="like" type="checkbox" name="chk" value="104">
			</div>

			<label class="input-file-button" for="input-file"> <img
				class="input-file-img"
				src="https://cdn-icons-png.flaticon.com/128/7571/7571051.png" alt="">
			</label> <input onchange="setThumbnail(event);" type="file" id="input-file"
				style="display: none;" name="file" />
	</div>
	<div>
		<h6 class="reg-field">아이디</h6>
		<input type="text" name="id" class="input_id"> <font
			id="checkId" size="2"></font>
	</div>
	<div>
		<h6 class="reg-field">비밀번호</h6>
		<input type="password" name="pw" id="pw">
	</div>
	<div>
		<h6 class="reg-field">비밀번호 재입력</h6>
		<input type="password" name="pw2" id="pw2"> <font
			id="pwConfirm" size="2"></font>
	</div>
	<div>
		<h6 class="reg-field">이름</h6>
		<input type="text" name="name">
	</div>
	<div>
		<h6 class="reg-field">이메일</h6>
		<input type="text" name="email">
	</div>
	<div>
		<h6 class="reg-field check-likes">관심사</h6>
	</div>
	<div class="check-list">
		소설<input class="like" type="checkbox" name="chk" value="101">
		시/에세이<input class="like" type="checkbox" name="chk" value="102">
		사회과학<input class="like" type="checkbox" name="chk" value="104">
	</div>

	<div class="check-list">
		역사와 문화<input class="like" type="checkbox" name="chk" value="105">
		국어/외국어<input class="like" type="checkbox" name="chk" value="115">
		자기계발<input class="like" type="checkbox" name="chk" value="118">
	</div>

	<div class="check-list">
		인문<input class="like" type="checkbox" name="chk" value="119">
		종교/역학<input class="like" type="checkbox" name="chk" value="120">
		여행<input class="like" type="checkbox" name="chk" value="128">
	</div>
	<div class="reg-button">
		<button>가입하기</button>
	</div>
	</form>

	<script src="js/check.js"></script>
	<script>
		$('.input_id').focusout(function() {
			let userId = $('.input_id').val();

			$.ajax({
				url : "http://localhost/Semi-Project/Id_check",
				type : "post",
				data : {
					userId : userId
				},
				dataType : 'json',
				success : function(result) {
					if (result == 0) {
						$("#checkId").html('사용할 수 없는 아이디입니다.');
						$("#checkId").attr('color', 'red');
					} else {
						$("#checkId").html('사용할 수 있는 아이디입니다.');
						$("#checkId").attr('color', 'green');
					}
				},
				error : function() {
					alert("서버 요청 실패");
				}
			})

		})
	</script>
	</div>
	<script>
	$('.input_id').focusout(function() {
		let userId = $('.input_id').val();

		$.ajax({
			url : "http://localhost/Semi-Project/Id_check",
			type : "post",
			data : {
				userId : userId
			},
			dataType : 'json',
			success : function(result) {
				if (result == 0) {
					$("#checkId").html('사용할 수 없는 아이디입니다.');
					$("#checkId").attr('color', 'red');
				} else {
					$("#checkId").html('사용할 수 있는 아이디입니다.');
					$("#checkId").attr('color', 'green');
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
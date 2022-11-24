<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/Update_info.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function setThumbnail(event) {
		let reader = new FileReader();

		reader.onload = function(event) {
			$("#target-img").remove();
			let img = document.createElement("img");
			console.log(event.target);
			img.setAttribute("src", event.target.result);
			img.setAttribute("width", "100%");
			img.setAttribute("height", "100%");
			img.setAttribute("style", "border-radius: 50%");
			
			img.setAttribute("id", "target-img");
			$("#test-img").css("display", "none");
			document.querySelector("div#image_container").appendChild(img);

		};

		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</head>
<body>
	<div class="update-container">
		<form class="update-form" action="Update_info_controller"
			name="myForm" method="post" enctype="multipart/form-data">
			<div id="profile-img-container">
				<div id="image_container">
					<img id="test-img"
						src="fileFolder/${sessionScope.accountInfo.b_pic }">
						<input name="oldfile" type="hidden" value="${sessionScope.accountInfo.b_pic }">
					<label class="input-file-button" for="input-file"> <img
						class="input-file-img"
						src="https://cdn-icons-png.flaticon.com/128/7571/7571051.png"
						alt="">
					</label> <input onchange="setThumbnail(event);" type="file" name="file"
						id="input-file" style="display: none;" />
				</div>
			</div>
			<div>
			<input type="hidden" name="id" value="${sessionScope.accountInfo.b_id }">
			</div>
			<div>
					<h6 class="update-guide">비밀번호</h6>
					<input class="update-field" type="password" name="pw" id="pw"
						value="${sessionScope.accountInfo.b_pw }">
				</div>
			<div>
				<h6 class="update-guide">비밀번호 재입력</h6>
				<input class="update-field" type="password" name="pw2" id="pw2"> 
				<font class="update-guide" id="pwConfirm" size="2"></font>
			</div>
			<div>
				<h6 class="update-guide">이름</h6>
				<input class="update-field" name="name" value="${sessionScope.accountInfo.b_name }">
			</div>
			<div>
				<h6 class="update-guide">이메일</h6>
				<input class="update-field" name="email" value="${sessionScope.accountInfo.b_email }">
			</div>
			<div class="check-list-container">
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
			</div>
			<div class="update-button">
				<button>수정</button>
			</div>
		</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>
<script>
	function setThumbnail(event) {
		let reader = new FileReader();
		
		reader.onload = function(event) {
			$('#user-reg-image').remove();
			let img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("width", "100%");
			img.setAttribute("height", "100%");
			img.setAttribute("id", "user-reg-image");
			img.setAttribute("style", "border-radius: 50%");
			$("#test-img").css("display", "none");
			document.querySelector("div#image_container").appendChild(img);
		};

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>
    <script>
      $(document).ready(function () {
        // id
        $(document).on("mouseover", ".reg-questionMark", function () {
          $(".user-rule-field").css("visibility", "visible");
        });

        $(document).on("mouseleave", ".reg-questionMark", function () {
          $(".user-rule-field").css("visibility", "hidden");
        });
        //pw
        $(document).on("mouseover", ".reg-questionMark2", function () {
          $(".user-rule-field2").css("visibility", "visible");
        });

        $(document).on("mouseleave", ".reg-questionMark2", function () {
          $(".user-rule-field2").css("visibility", "hidden");
        });
        //이름
        $(document).on("mouseover", ".reg-questionMark3", function () {
          $(".user-rule-field3").css("visibility", "visible");
        });

        $(document).on("mouseleave", ".reg-questionMark3", function () {
          $(".user-rule-field3").css("visibility", "hidden");
        });
        //이메일
        $(document).on("mouseover", ".reg-questionMark4", function () {
          $(".user-rule-field4").css("visibility", "visible");
        });

        $(document).on("mouseleave", ".reg-questionMark4", function () {
          $(".user-rule-field4").css("visibility", "hidden");
        });
      });
    </script>
    <link rel="stylesheet" href="css/reg.css" />
    <link rel="stylesheet" href="css/index.css" />
  </head>

  <body>
    <div class="reg-container">
      <form
        class="reg-form"
        method="post"
        action="Account_register_controller"
        name="myForm"
        method="post"
        enctype="multipart/form-data"
        onsubmit="return call()"
      >
        <div id="profile-img-container">
          <div id="image_container">
            <img
              id="test-img"
              src="https://cdn-icons-png.flaticon.com/128/5309/5309035.png"
              alt=""
            />
          </div>
          <label class="input-file-button" for="input-file">
            <img
              class="input-file-img"
              src="https://cdn-icons-png.flaticon.com/128/7571/7571051.png"
              alt=""
            />
          </label>
          <input
            onchange="setThumbnail(event);"
            type="file"
            name="file"
            id="input-file"
            style="display: none"
          />
        </div>
        <div>
          <h6 class="reg-field">아이디</h6>
          <input type="text" name="id" class="input_id" />
<<<<<<< HEAD
          <img class="reg-questionMark" alt="" src="assets/questionMark.png" />
=======
          <img
            class="reg-questionMark"
            src="assets/questionMark.png"
          />
>>>>>>> 45fcb75d5b2de991eb8bb32b09c5e6c41f6b2477
          <font id="checkId" size="2"></font>
        </div>
        <div>
          <h6 class="reg-field">비밀번호</h6>
          <input type="password" name="pw" id="pw" />
          <img class="reg-questionMark2" alt="" src="assets/questionMark.png" />
        </div>
        <div>
          <h6 class="reg-field">비밀번호 재입력</h6>
          <input type="password" name="pw2" id="pw2" />
          <font id="pwConfirm" size="2"></font>
        </div>
        <div>
          <h6 class="reg-field">이름</h6>
          <input type="text" name="name" />
          <img class="reg-questionMark3" alt="" src="assets/questionMark.png" />
        </div>
        <div>
          <h6 class="reg-field">이메일</h6>
          <input type="text" name="email" />
          <img class="reg-questionMark4" alt="" src="assets/questionMark.png" />
        </div>
        <div>
          <h6 class="reg-field check-likes">관심사</h6>
        </div>
        <div class="check-list">
          소설<input class="like" type="checkbox" name="chk" value="101" />
          시/에세이<input class="like" type="checkbox" name="chk" value="102" />
          사회과학<input class="like" type="checkbox" name="chk" value="104" />
        </div>
        <div class="check-list">
          역사와 문화<input
            class="like"
            type="checkbox"
            name="chk"
            value="105"
          />
          국어/외국어<input
            class="like"
            type="checkbox"
            name="chk"
            value="115"
          />
          자기계발<input class="like" type="checkbox" name="chk" value="118" />
        </div>
        <div class="check-list">
          인문<input class="like" type="checkbox" name="chk" value="119" />
          종교/역학<input class="like" type="checkbox" name="chk" value="120" />
          여행<input class="like" type="checkbox" name="chk" value="128" />
        </div>
        <div class="reg-button">
          <button>가입하기</button>
        </div>
      </form>
      <!-- 불러올아이 -->
      <div class="user-rule-container">
        <div class="user-rule-field">
          <h4>id</h4>
          <span>영어 + 숫자 조합, 5글자 이상</span>
        </div>
        <div class="user-rule-field2">
          <h4>Password</h4>
          <span>3글자 이상 입력</span> <br />
          <span>대,소문자 + 숫자 필수 포함</span>
        </div>
        <div class="user-rule-field3">
          <h4>이름</h4>
          <span>필수 입력!</span>
        </div>
        <div class="user-rule-field4">
          <h4>E-Mail</h4>
          <span>이메일 형식 준수</span>
        </div>
      </div>
    </div>
    <script>
      $(".input_id").focusout(function () {
        let userId = $(".input_id").val();

</script>
<link rel="stylesheet" href="css/reg.css">
<link rel="stylesheet" href="css/index.css">
</head>

<body>
	<div class="reg-container">
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
					id="input-file" style="display: none;" accept="image/gif, image/jpeg, image/png, image/jpg" />
			</div>
			<div>
				<h6 class="reg-field">아이디</h6>
				<input class="input_id" name="id" type="text"> <img class="reg-questionMark"
					alt="" src="assets/questionMark.png">
			</div>
			<div>
				<h6 class="reg-field">비밀번호</h6>
				<input name="pw" type="password"> <img class="reg-questionMark2"
					alt="" src="assets/questionMark.png">
			</div>
			<div>
				<h6 class="reg-field">비밀번호 재입력</h6>
				<input type="password">
			</div>
			<div>
				<h6 class="reg-field">이름</h6>
				<input name="name" type="text"> <img
					class="reg-questionMark3" alt="" src="assets/questionMark.png">
			</div>
			<div>
				<h6 class="reg-field">이메일</h6>
				<input name="email" type="text"> <img
					class="reg-questionMark4" alt="" src="assets/questionMark.png">
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
		<!-- 불러올아이 -->
		<div class="user-rule-container">
			<div class="user-rule-field">
				<h4>id</h4>
				<span>영어 + 숫자 조합, 5글자 이상</span>
			</div>
			<div class="user-rule-field2">
				<h4>Password</h4>
				<span>3글자 이상 입력</span> <br> <span>대,소문자 + 숫자 필수 포함</span>
			</div>
			<div class="user-rule-field3">
				<h4>이름</h4>
				<span>필수 입력!</span>
			</div>
			<div class="user-rule-field4">
				<h4>E-Mail</h4>
				<span>이메일 형식 준수</span>
			</div>
		</div>
	</div>
	<script src="js/check.js"></script>
	<script>
		$('.input_id').focusout(function() {
			let userId = $('.input_id').val();

			$.ajax({
				url : "Id_check",
				type : "post",
				data : {
					userId : userId
				},
				success : function(result) {
					console.log(result);
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


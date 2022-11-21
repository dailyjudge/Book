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
<body>
<<<<<<< HEAD
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
=======
	<div class="reg-container" action="Account_register_controller" name="myForm" method="post"
    enctype="multipart/form-data" onsubmit="return call()">
        <form class="reg-form" action="" method="post">
            <div id="profile-img-container">
                <div id="image_container">
                    <img id="test-img" src="https://cdn-icons-png.flaticon.com/128/5309/5309035.png" alt="">
                </div>
    
                <label class="input-file-button" for="input-file">
                    <img class="input-file-img"src="https://cdn-icons-png.flaticon.com/128/7571/7571051.png" alt="">
                  </label>
                  <input onchange="setThumbnail(event);" type="file" id="input-file" style="display: none;"/>
            </div>
            <div>
                <h6 class="reg-field">아이디</h6>
                <input type="text">
            </div>
            <div>
                <h6 class="reg-field">비밀번호</h6>
                <input type="text">
            </div>
            <div>
                <h6 class="reg-field">비밀번호 재입력</h6>
                <input type="text">
            </div>
            <div>
                <h6 class="reg-field">이름</h6>
                <input type="text">
            </div>
            <div>
                <h6 class="reg-field">이메일</h6>
                <input type="text">
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
                <button>회원가입</button>
            </div>
        </form>
    </div>
>>>>>>> 05ee71279cf52e3d52816fe29ea98442373d4b6c
</body>
</html>
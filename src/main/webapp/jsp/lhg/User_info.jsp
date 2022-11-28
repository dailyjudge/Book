<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/user_info.css">
<script type="text/javascript" src="js/account.js"></script>
</head>
<body>
        <div class="myPage-container">
            <div class="myPage">
                <h3>마이페이지</h3>
                <img class="myPage-img" src="fileFolder/${sessionScope.accountInfo.b_pic }" alt="">
            
                <div class="myPage-field">
                    <span class="myPage-field-classification">ID</span> <br>
                    <span>${sessionScope.accountInfo.b_id }</span>
                </div>
                
                <div class="myPage-field">
                    <span class="myPage-field-classification">이름</span> <br>
                    <span>${sessionScope.accountInfo.b_name }</span>
                </div>
                
                <div class="myPage-field">
                    <span class="myPage-field-classification">이메일</span> <br>
                    <span> ${sessionScope.accountInfo.b_email }</span>
                </div>
                
                <div class="myPage-field">
                    <span class="myPage-field-classification">관심사</span> <br>
                    <span>${sessionScope.accountInfo.b_likes }</span>
                </div>
                    
                <div class="myPage-field myPage-additional">
                    <a href="Update_info_controller">정보 수정</a>
                    <a onclick="delete_account('${sessionScope.accountInfo.b_id}')">회원 탈퇴</a>
                </div>
            </div>
        </div>
        
</body>
</html>
</html>
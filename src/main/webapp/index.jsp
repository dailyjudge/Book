<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/default.css">
<script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
<script type="text/javascript" src="js/check.js"></script>
<script type="text/javascript" src="js/validCheck.js"></script>
<script type="text/javascript" src="js/delCheck.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="js/slide.js"></script>
<link rel="stylesheet" href="css/slide.css"> 

</head>
<body>
  <div>
    <jsp:include page="${loginPage }"></jsp:include>
  </div>
	<div class="account-container">
        <div class="img-container">
            <img class="account-img" src="data:image/png;base64,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" alt="">
        </div>
        <div class="item-container">
            <a class="account-item" href="">로그인</a>
            <a class="account-item" href="">회원가입</a>
        </div>

  

    <div class="menu-container">
      <a href="" class="menu-item">베스트셀러</a>
      <a href="Book_search_controller" class="menu-item">서적 검색</a>
      <a href="" class="menu-item">중고 서적 게시판</a>
      <a href="Map_Controller" class="menu-item">서점 찾기</a>
    </div>

    <div>
      <jsp:include page="${contentPage }"></jsp:include>
    </div>
  </body>
</html>

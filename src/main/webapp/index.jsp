<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script
      src="https://code.jquery.com/jquery-3.6.1.js"
      integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
      crossorigin="anonymous"
    ></script>
    <script type="text/javascript" src="js/check.js"></script>
    <script type="text/javascript" src="js/validCheck.js"></script>
    <script type="text/javascript" src="js/delCheck.js"></script>
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/default.css" />
  </head>
  <body>
    <div>
      <jsp:include page="${loginPage }"></jsp:include>
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

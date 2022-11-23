<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/map.css">
<link rel="stylesheet" href="css/usedbooks.css">

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/check.js"></script>
<script type="text/javascript" src="js/validCheck.js"></script>
<script type="text/javascript" src="js/delCheck.js"></script>
<script type="text/javascript" src="js/slide.js"></script>
<link rel="stylesheet" href="css/slide.css">
<link rel="stylesheet" href="css/comment.css">

</head>

<body>
	<div>
		<jsp:include page="${loginPage }"></jsp:include>
	</div>


	<ul class="menu">
		<li class="menu-item"><a href="Book_bestSeller_controller"
			class="menu-link">베스트셀러</a></li>
		<li class="menu-item"><a href="Book_search_controller"
			class="menu-link">서적 검색</a></li>
		<li class="menu-item"><a href="UsedBooks_main_controller" class="menu-link">중고 서적 게시판</a></li>
		<li class="menu-item"><a href="Map_Controller" class="menu-link">서점
				찾기</a></li>
	</ul>


	<div>
		<jsp:include page="${contentPage }"></jsp:include>
	</div>
</body>
</html>

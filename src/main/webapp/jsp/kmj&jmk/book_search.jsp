<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"
		integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
		crossorigin="anonymous"></script>
<script type="text/javascript" src="js/book_search.js"></script>
</head>
<body>
	<div class="test">
	<input type="text" id="query">
	<button id="search">검색</button>	
	<button id="search-more">더보기</button>
	</div>
	<div id="search-result" class="book-container"></div>
	
</body>
</html>
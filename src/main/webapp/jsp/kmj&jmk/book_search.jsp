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
	<div class="search">
        <input id="query" class="search-input" type="text" placeholder="검색어 입력">
        <img id="search-img" class="search-img" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
    </div>
	<div id="search-result" class="book-container"></div>
	
</body>
</html>
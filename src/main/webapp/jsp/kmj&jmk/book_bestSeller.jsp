<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.ajax-cross-origin.min.js"></script>
<script type="text/javascript" src="js/book_bestSeller.js"></script>
</head>
<body>
<!-- 
	1. for문을 이용해 배열의 크기만큼 배열을 순회할 것
	2. if (101, 102, 104, 105, 115, 118, 119, 120, 128 ) 랑 같으면 
	해당 번호를 api cid에다 붙이고 해당 장르 div를 생성 하는 구조
 -->



<div class="book-container">
	<p class="book-classification">국내도서</p>
</div>
<div id="search-result" class="book-container"></div>

<div class="book-container">
	<p class="book-classification">해외도서</p>
</div>
<div id="search-result2" class="book-container"></div>

<div class="book-container">
	<p class="book-classification">음반</p>
</div>
<div id="search-result3" class="book-container"></div>

<div class="book-container">
	<p class="book-classification">DVD</p>
</div>
<div id="search-result4" class="book-container"></div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<div id="search-result" class="book-container"></div>
	<c:forEach items="${sessionScope.cid}" var="c">
		<c:if test="${c eq '101'}">
			<div class="book-container">
				<p class="book-classification">소설</p>
			</div>
			<div id="search-101" class="book-container"></div>
		</c:if>
		<c:if test="${c eq '102'}">
			<div class="book-container">
				<p class="book-classification">시/에세이</p>
			</div>
			<div id="search-102" class="book-container"></div>
		</c:if>
		<c:if test="${c eq '104'}">
			<div class="book-container">
				<p class="book-classification">사회과학</p>
			</div>
			<div id="search-104" class="book-container"></div>
		</c:if>
		<c:if test="${c eq '105'}">
			<div class="book-container">
				<p class="book-classification">역사와 문화</p>
			</div>
			<div id="search-105" class="book-container"></div>
		</c:if>
		<c:if test="${c eq '115'}">
			<div class="book-container">
				<p class="book-classification">국어/외국어</p>
			</div>
			<div id="search-115" class="book-container"></div>
		</c:if>
		<c:if test="${c eq '118'}">
			<div class="book-container">
				<p class="book-classification">자기계발</p>
			</div>
			<div id="search-118" class="book-container"></div>
		</c:if>
		<c:if test="${c eq '119'}">
			<div class="book-container">
				<p class="book-classification">인문</p>
			</div>
			<div id="search-119" class="book-container"></div>
		</c:if>
		<c:if test="${c eq '120'}">
			<div class="book-container">
				<p class="book-classification">종교/역학</p>
			</div>
			<div id="search-120" class="book-container"></div>
		</c:if>
		<c:if test="${c eq '128'}">
			<div class="book-container">
				<p class="book-classification">여행</p>
			</div>
			<div id="search-128" class="book-container"></div>
		</c:if>

	</c:forEach>
	

</body>
</html>
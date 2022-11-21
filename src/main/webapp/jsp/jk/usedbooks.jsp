<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<script>
	function createContent() {
		
		if(confirm("중고 서적 게시글을 등록하시겠습니까?")) {
			location.href="UsedBooks_create_controller";
		} 
	}
</script>
<body>
	
	<div class="usedbooks-header-container">
		<h2>중고 서적 게시판</h2>
		<button onclick="createContent()" class="usedbooks-header-button">중고 서적 등록하기</button>
	</div>
	<c:forEach var="i" items="${boards }">
		<div class="usedbooks-container">
		  <input style="display:none" value="${i.no }" name="board-number">
      	  <div class="usedbooks-item-1">
            <span class="usedbooks-item-title" onclick="location.href='UsedBooks_detail_controller?no=${i.no}'">${i.title }</span>
       	  </div>
          <div class="usedbooks-item-2">
            <span>${i.author }</span>
          </div>
          <div class="usedbooks-item-3">
            <span class="usedbooks-item-content">${i.content }</span>
            <span class="usedbooks-item-date">${i.date }</span>
          </div>
       </div>
	</c:forEach>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

      if (confirm("중고 서적 게시글을 등록하시겠습니까?")) {
         location.href = "UsedBooks_create_controller";
      }
   }
</script>

<body>
	<div style="text-align: center; justify-content: center;">
		<div class="usedbooks-header-container">
			<div class="usedbooks-board-container">
				<span class="usedbooks-board-container-span1">중고 서적 게시판</span> <span
					class="usedbooks-board-container-span2">후기 게시판</span>
			</div>
		</div>
		<!-- 리뷰게시판 div박스 -->
		<div class="contents-wrap review-container3" style="display: none">
			<c:forEach var="i" items="${reviews }">
				<div class="contents project-card"
					onclick="location.href='UsedBooks_detail_controller?no=${i.rv_no}'">
					<input style="display: none" value="${i.rv_no }" name="board-number">
					<div class="project-thumbnail" id="project-macbook">
						<img class="contents-img" src="review_img/${i.rv_img }" alt="">
					</div>
					<div class="project-explain">
						<div class="usedbooks-item-1">
							<span class="usedbooks-item-title">${i.rv_title }</span>
						</div>
						<div class="usedbooks-item-2">
							<span>작성자 : ${i.rv_author }</span>
						</div>
						<div class="usedbooks-item-2">
							<span class="usedbooks-item-date">작성 날짜 : ${i.rv_date }</span>
						</div>
               </div>
            </div>
         </c:forEach>
      </div>
      <!-- 중고게시판 div박스 -->
		<div class="contents-wrap usedbooks-container3" >
			<c:forEach var="i" items="${boards }">
				<div class="contents project-card"
					onclick="location.href='UsedBooks_detail_controller?no=${i.no}'">
					<input style="display: none" value="${i.no }" name="board-number">
					<div class="project-thumbnail" id="project-macbook">
						<img class="contents-img" src="board_img/${i.img }" alt="">
					</div>
					<div class="project-explain">
						<div class="usedbooks-item-1">
							<span class="usedbooks-item-title">${i.title }</span>
						</div>
						<div class="usedbooks-item-2">
							<span>작성자 : ${i.author }</span>
						</div>
						<div class="usedbooks-item-2">
							<span class="usedbooks-item-date">작성 날짜 : ${i.date }</span>
						</div>
               </div>
            </div>
         </c:forEach>
      </div>
      
      <div class="usedbooks-paging-container">
         <div
            style="display: flex; text-align: center; justify-content: center;">
            <c:choose>
               <c:when test="${curPageNo2 <= 1 }">
                  <div>
                     <img class="paging-icon" alt="" src="assets/previousPage.png">
                  </div>
               </c:when>
               <c:otherwise>
                  <div>
                     <a href="UsedBooks_pagingC?p=${curPageNo2 -1}"><img
                        class="paging-icon" alt="" src="assets/previousPage.png"></a>
                  </div>
               </c:otherwise>
            </c:choose>
            <div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <c:choose>
               <c:when test="${curPageNo2 >= pageCount2 }">
                  <div>
                     <img class="paging-icon" alt="" src="assets/nextPage.png">
                  </div>
               </c:when>
               <c:otherwise>
                  <div>
                     <a href="UsedBooks_pagingC?p=${curPageNo2 + 1 }"><img
                        class="paging-icon" alt="" src="assets/nextPage.png"></a>
                  </div>
               </c:otherwise>
            </c:choose>
         </div>
      </div>
      <div class="reviewbooks-paging-container" style="display: none">
         <div
            style="display: flex; text-align: center; justify-content: center;">
            <c:choose>
               <c:when test="${curPageNo <= 1 }">
                  <div>
                     <img class="paging-icon" alt="" src="assets/previousPage.png">
                  </div>
               </c:when>
               <c:otherwise>
                  <div>
                     <a href="ReviewBooks_pagingC?p2=${curPageNo -1}"><img
                        class="paging-icon" alt="" src="assets/previousPage.png"></a>
                  </div>
               </c:otherwise>
            </c:choose>
            <div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <c:choose>
               <c:when test="${curPageNo >= pageCount }">
                  <div>
                     <img class="paging-icon" alt="" src="assets/nextPage.png">
                  </div>
               </c:when>
               <c:otherwise>
                  <div>
                     <a href="ReviewBooks_pagingC?p2=${curPageNo + 1 }"><img
                        class="paging-icon" alt="" src="assets/nextPage.png"></a>
                  </div>
               </c:otherwise>
            </c:choose>
         </div>
      </div>
      
      
      
      
      <div class="usedbooks-header-container">
         <button onclick="createContent()" class="usedbooks-header-button">중고
            서적 등록하기</button>
      </div>
      <div class="usedbooks-header-container">
         <button style="display: none" onclick="createContentReview()" class="usedbooks-header-button review-create-button">후기 등록하기</button>
      </div>
   </div>
   <div class="review-container">아아아아아아</div>

</body>
</html>
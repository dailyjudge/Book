<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>
	function delete_usedBooks_board(no) {
		if (confirm("게시글을 정말 삭제하시겠습니까?")) {
			location.href = "UsedBooks_delete_controller?no=" + no;
			//	location.href=`UsedBooks_delete_controller?no=${no}`;
		}
	}

	function update_usedBooks_board(no) {
		if (confirm("게시글을 정말 수정하시겠습니까?")) {
			location.href = "UsedBooks_update_controller?no=" + no;
		}
	}
</script>
<body>

	<div class="usedbooks-detail-container">
		<h3>${target.title }</h3>
		<h3>이미지</h3>
		<img class="usedbooks-detail-img" src="./board_img/${target.img }">

		<div class="usedbooks-detail-content">
			<span>${target.content }</span>
		</div>

		<div class="usedbooks-detail-content2">
			<h4>작성자 : ${target.author }</h4>
			<h4>등록일 : ${target.date }</h4>
			<h4>가격 : ${target.price }원</h4>
		</div>

		<div class="usedbooks-detail-button">
			<button onclick="update_usedBooks_board('${target.no}')">수정</button>
			<button onclick="delete_usedBooks_board('${target.no}')">삭제</button>
		</div>
	</div>

	<c:if test="${sessionScope.accountInfo != null}">
		<div class="comment-container">
			<div>
				<img src="fileFolder/${sessionScope.accountInfo.b_pic }" alt="">
			</div>
			<div class="comment-container2">
				<div class="comment-id">
					<span>${sessionScope.accountInfo.b_id }</span> 
				</div>
				<div class="comment-text-container">
					<textarea class="comment-text-reg"></textarea>

					<div class="comment-button-container">
						<button>등록하기</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	
	<c:forEach var="c" items="${comments}">
		<div class="comment-container">
			<div>
				<img src="fileFolder/${c.image}" alt="">
			</div>
			<div class="comment-container2">
				<div class="comment-id">
					<span>${c.author_id }</span> <span>${c.date }</span>
				</div>
				<div class="comment-text-container">
					<textarea class="comment-text">${c.comment_content }</textarea>

					<div class="comment-button-container">
						<button>수정</button>
						<button>삭제</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

</body>
</html>
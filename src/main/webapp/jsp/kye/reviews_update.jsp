<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="usedbooks-create-container">
		<div class="usedbooks-create-header">
			<strong>게시글 수정</strong>
		</div>
		<div class="usedbooks-create-item">
			<strong>제목</strong><br> <input id="review-update-title"
				class="usedbooks-create-item-title" type="text" name="title"
				value="${review.rv_title }"> <input style="display: none"
				id="review-update-title-copy" class="usedbooks-create-item-title"
				type="text" name="title" value="${review.rv_title }">
		</div>

		<div class="usedbooks-create-item">
			<strong>내용</strong><br>
			<textarea id="review-update-content"
				class="usedbooks-create-textarea" name="content">${review.rv_content }</textarea>
			<textarea style="display: none" id="review-update-content-copy"
				class="usedbooks-create-textarea" name="content">${review.rv_content }</textarea>
		</div>



		<div
			class="usedbooks-create-button-container usedbooks-update-button-container">
			<button onclick="onReviewUpdate('${review.rv_no}')">수정하기</button>
			<button onclick="history.back(-1)">돌아가기</button>
		</div>
	</div>
</body>
</html>
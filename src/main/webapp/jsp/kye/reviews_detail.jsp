<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="usedbooks-detail-container">
		<div class="usedbooks-detail-title">
			<h2>${review.rv_title }</h2>
			<h5>등록일 : ${review.rv_date }</h5>
		</div>

		<div class="usedbooks-detail-writer">
			<h4>작성자 : ${review.rv_author }</h4>
		</div>

		<div class="usedbooks-detail-content-container">
			<img class="usedbooks-detail-img" src="./review_img/${review.rv_img }" />
			<div class="usedbooks-detail-content">
				<span>${review.rv_content }</span>
			</div>
		</div>
			<div class="usedbooks-detail-button">
				<button onclick="update_reviewbooks_board('${review.rv_no}')">수정</button>
				<button onclick="delete_reviewbooks_board('${review.rv_no}')">삭제</button>
			</div>
	</div>
</body>
</html>
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
		<form action="ReviewBooks_create_controller" method="post"
			enctype="multipart/form-data" onsubmit="return createReviewContent()">
			<div class="usedbooks-create-header">
				<strong>게시글 등록</strong>
			</div>
			<div class="usedbooks-create-item">
				<strong>제목</strong><br> <input
					id="reviewbooks-create-item-title"
					class="usedbooks-create-item-title" type="text" name="title">
			</div>

			<div class="usedbooks-create-item">
				<strong>내용</strong><br>
				<textarea id="reviewbooks-create-item-content" class="usedbooks-create-textarea" name="content"></textarea>
			</div>

			<div class="usedbooks-create-item">
				<strong>사진</strong> <input type="file" name="file">
			</div>

			<div class="usedbooks-create-button-container">
				<button>글 등록하기</button>
			</div>
		</form>


	</div>
</body>
</html>
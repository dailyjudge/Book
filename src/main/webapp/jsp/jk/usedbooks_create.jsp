<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function createContent() {
		if(confirm("중고 서적 게시글을 정말 등록하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
</script>

</head>
<body>
	 <div class="usedbooks-create-container">
        <form action="UsedBooks_create_controller" method="post" enctype="multipart/form-data" onsubmit="return createContent()">
            <div class="usedbooks-create-header">
                <strong>게시글 등록</strong>
            </div>
            <div class="usedbooks-create-item">
                <strong >제목</strong><br>
                <input class="usedbooks-create-item-title" type="text" name="title">
            </div>
            
            <div class="usedbooks-create-item">
                <strong>내용</strong><br>
                <textarea class="usedbooks-create-textarea"name="content"></textarea>
            </div>
            
            <div class="usedbooks-create-item">
                <strong >판매 가격</strong><span>원</span><br>
                <input class="usedbooks-create-item-price" type="number" name="price">
            </div>
            
            
            <div class="usedbooks-create-item">
                <strong>사진</strong>
                <input type="file" name="file">
            </div>
            
            <div class="usedbooks-create-button-container">
                <button>글 등록하기</button>
            </div>
        </form>


    </div>

</body>
</html>
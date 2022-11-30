<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function onUpdate(no){
    	if(confirm("게시글을 정말 수정하시겠습니까?")) {
    		// no, 제목, 내용, 가격
    		
    		let title = document.getElementById("usedbooks-title").value;
    		let content = document.getElementById("usedbooks-content").value;
    		let price = document.getElementById("usedbooks-price").value;
    		
    		location.href = "UsedBooks_update_controller?no=" + no + "&title=" + title + "&content=" + content + "&price=" + price;
    	}
	}
	
</script>
</head>
<body>
	 <div class="usedbooks-create-container">
            <div class="usedbooks-create-header">
                <strong>게시글 수정</strong>
            </div>
            <div class="usedbooks-create-item">
                <strong >제목</strong><br>
                <input id="usedbooks-title" class="usedbooks-create-item-title" type="text" name="title" value="${target.title }">
            </div>
            
            <div class="usedbooks-create-item">
                <strong>내용</strong><br>
                <textarea id="usedbooks-content" class="usedbooks-create-textarea"name="content">${target.content }</textarea>
            </div>
            
            <div class="usedbooks-create-item">
                <strong >판매 가격</strong><span>원</span><br>
                <input id="usedbooks-price" class="usedbooks-create-item-price" type="number" name="price" value="${target.price }">
            </div>
                       
            <div class="usedbooks-create-button-container usedbooks-update-button-container">
				<button onclick="onUpdate('${target.no}')">수정하기</button>            	
				<button onclick="history.back(-1)">돌아가기</button>
            </div>
    </div>
</body>
</html>
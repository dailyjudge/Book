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
	<div class="usedbooks-detail-container">
                <input id="usedbooks-title" value="${target.title }"> 

                <div class="usedbooks-detail-content">
	                <input id="usedbooks-content" value="${target.content }">
                </div>

             <div class="usedbooks-detail-content2">
                <input id="usedbooks-price" value="${target.price }">
            </div>
			
            <div class="usedbooks-detail-button">
				<button onclick="onUpdate('${target.no}')">수정하기</button>            	
				<button onclick="history.back(-1)">돌아가기</button>
				            	
            </div>
        </div>
</body>


</html>
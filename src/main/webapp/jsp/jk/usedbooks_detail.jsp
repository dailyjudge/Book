<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<script type="text/javascript">
	
	function selectAllContent() {
		const searchParams = new URLSearchParams(location.search);
		let no = searchParams.get('no');
		console.log("게시글 번호: " + no);
		$.ajax({
			type: "GET",
			data: {
				no : no,
			},
			dataType: 'json',
			url: "Comment_getAll_controller",
			success: function(data) {
				console.log(data);
				
			},
			error: function(request,status,error){

				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}

</script>
</head>
<script src="js/reply.js">
</script>
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
	
	function reg_comment3(no) {
		console.log(no)
		console.log($("#comment-textarea").val());
		$.ajax({
			type: "POST",
			url: "Comment_create_controller",
			data: {
				no : no,
				content: $("#comment-textarea").val(),
			},
			dataType: 'json',
			success: function(res) {
				console.log(res.comment_number);
				console.log(res.author_id);
				console.log(res);
				console.log(res.board_number);
				console.log(res.date);
				console.log(res.image);
				
				//comment-textarea
				$("#comment-container2").append(`
						<div class="comment-container" id="comment-container">
						<div>
							<img src="fileFolder/${res.image }" alt="">
						</div>
						
						<div class="comment-container2">
							<div class="comment-id">
								<span>${res.author_id}</span> <span>${res.date}</span>
							</div>
							<div class="comment-text-container">
								<textarea class="comment-text">${res.comment_content }</textarea>

								<div class="comment-button-container">
									<button>수정</button>
									<button>삭제</button>
								</div>
							</div>
						</div>
					</div>	 
		        
						`);
				
				
			},
			error: function(request,status,error){

				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
		
	}
</script>

<script>

</script>
<body>
	<div class="usedbooks-detail-container">
		<div class="usedbooks-detail-title">
			<h2>${target.title }</h2>
			<h5>등록일 : ${target.date }</h5>
		</div>

		<div class="usedbooks-detail-writer">
			<h4>작성자 : ${target.author }</h4>
		</div>

		<div class="usedbooks-detail-content-container">
			<img class="usedbooks-detail-img" src="./board_img/${target.img }" />
			<div class="usedbooks-detail-content">
				<h4>가격 : ${target.price }원</h4>
				<span>${target.content }</span>
			</div>
		</div>

		<c:if test="${sessionScope.accountInfo.b_id == target.author}">
			<div class="usedbooks-detail-button">
				<button onclick="update_usedBooks_board('${target.no}')">수정</button>
				<button onclick="delete_usedBooks_board('${target.no}')">삭제</button>
			</div>
		</c:if>
	</div>



	<c:if test="${sessionScope.accountInfo != null }">
		<div class="comment-container">
			<div>
				<img src="fileFolder/${sessionScope.accountInfo.b_pic }" alt="">
			</div>
			<div class="comment-container2">
				<div class="comment-id">
					<span>${sessionScope.accountInfo.b_id }</span>
				</div>
				<div class="comment-text-container">
					<textarea id="comment-textarea" class="comment-text-reg"></textarea>

					<div class="comment-button-container">
						<button onclick="reg_comment('${target.no}')">등록</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<div id="comment-container2">

		<c:forEach var="c" items="${comments }">

			<div class="comment-container"
				id="comment-container-${c.comment_number }">
				<div>
					<img src="fileFolder/${c.image }" alt="">
				</div>
				<div class="comment-container2">
					<div class="comment-id">
						<span>${c.author_id }</span> <span>${c.date }</span>
					</div>
					<div class="comment-text-container">
						<textarea id="comment-modify-text-${c.comment_number }"
							disabled="disabled" class="comment-text">${c.comment_content }</textarea>
						<input id="comment-modify-copyText-${c.comment_number }"
							value='${c.comment_content }' style="display: none">

						<c:if test="${sessionScope.accountInfo.b_id ==  c.author_id}">
							<div class="comment-button-container">
								<button id="comment-button-update-${c.comment_number }"
									onclick="update_click_comment('${c.comment_number}')">수정</button>
								<button id="comment-button-delete-${c.comment_number }"
									onclick="del_comment(${c.comment_number })">삭제</button>
								<button id="comment-button-update-done-${c.comment_number }"
									onclick="update_cooment('${c.comment_number}')"
									style="display: none;">완료</button>
								<button id="comment-button-cancel-${c.comment_number }"
									onclick="comment_update_back('${c.comment_number}')"
									style="display: none;">취소</button>
							</div>
						</c:if>
					</div>
				</div>
				<a class="more-reply reply-more-${c.comment_number }" onclick="getReply(${c.comment_number})">답글
					보기</a>
				<a style="display: none" class="more-reply reply-close-${c.comment_number }" onclick="closeReply(${c.comment_number})">답글
					닫기</a>	
			</div>
			<div class="reply-container-${c.comment_number }">
				<c:if test="${sessionScope.accountInfo != null }">
					<div class="comment-container reply-reg-container-${c.comment_number }"
						style="display: none">
						<div>
							<img src="fileFolder/${sessionScope.accountInfo.b_pic }" alt="">
						</div>
						<div class="comment-container2">
							<div class="comment-id">
								<span>${sessionScope.accountInfo.b_id }</span>
							</div>
							<div class="comment-text-container">
								<textarea id="comment-textarea" class="comment-text-reg reply-textarea-${c.comment_number }"></textarea>

								<div class="comment-button-container">
									<button onclick="reg_reply('${c.comment_number}')">등록</button>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<div class="reply2-container-${c.comment_number }"></div>
			</div>
		</c:forEach>

	</div>
</body>
</html>

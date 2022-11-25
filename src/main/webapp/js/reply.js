function getReply(no) {
	console.log(no);

	$(`.reply-more-${no}`).css("display", "none");
	$(`.reply-close-${no}`).css("display", "block");

	$.ajax({

		type: "GET",
		url: "ReplyOfComment_controller",
		data: {
			no: no,
		},
		dateType: 'json',
		success: function(res) {
			console.log(res);
			let button;
			if(res.loginId != res.id) {
				button = ``;
			} else {
				button = ``;
			}
			for (let i = 0; i < res.length; i++) {
				$(".reply-reg-container-" + res[i].commentNo).css("display", "block");
				if(res[i].loginId == res[i].id) {
				$(".reply2-container-" + no).append(`
					<div class="comment-container-${res[i].replyNo} reply-list-container-${res[i].commentNo} commentOfComment-container" id="comment-container-${res[i].replyNo}">
							<div>
								<img src="fileFolder/${res[i].img}"'alt="">
							</div>
						<div class="comment-container2">
							<div class="comment-id">
								<span>${res[i].id}</span> <span>${res[i].date}</span>
							</div>
							<div class="comment-text-container">
								<textarea id="comment-modify-text-${res[i].replyNo}" disabled="disabled" class="comment-text">${res[i].content}</textarea>
								<input id="comment-modify-copyText-${res[i].replyNo}" value='${res[i].content}' style="display: none">
								
							<div class="comment-button-container">
								<button id="comment-button-delete-${res[i].replyNo}" onclick="del_reply(${res[i].replyNo})">삭제</button>
							</div>
						</div>
					</div>
				</div> 	
					
					`);
				} else {
					$(".reply2-container-" + no).append(`
					<div class="comment-container-${res[i].replyNo} reply-list-container-${res[i].commentNo} commentOfComment-container" id="comment-container-${res[i].replyNo}">
							<div>
								<img src="fileFolder/${res[i].img}"'alt="">
							</div>
						<div class="comment-container2">
							<div class="comment-id">
								<span>${res[i].id}</span> <span>${res[i].date}</span>
							</div>
							<div class="comment-text-container">
								<textarea id="comment-modify-text-${res[i].replyNo}" disabled="disabled" class="comment-text">${res[i].content}</textarea>
								<input id="comment-modify-copyText-${res[i].replyNo}" value='${res[i].content}' style="display: none">
								
							<div class="comment-button-container">
							</div>
						</div>
					</div>
				</div> 	
					
					`);
					
					
				}
				
			}

		},
		error: function(request, status, error) {

			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}

	})
}

function closeReply(no) {
	$(`.reply-more-${no}`).css("display", "block");
	$(`.reply-close-${no}`).css("display", "none");
	$(".reply-reg-container-" + no).css("display", "none");

	$(`.reply-list-container-${no}`).remove();
}

function reg_reply(no) {
	// comment_number 받음
	console.log(no)
	console.log(".reply-textarea-" + no);
	console.log($(".reply-textarea-" + no).val());

	if (confirm("대댓글을 등록하시겠습니까?")) {
		$.ajax({
			type: "POST",
			url: "Reply_create_controller",
			data: {
				no: no,
				content: $(".reply-textarea-" + no).val(),
			},
			dataType: 'json',
			success: function(res) {
				console.log("good");
				console.log(res);
				
				$(".reply2-container-" + res.commentNo).prepend(`
					<div class="comment-container-${res.replyNo} reply-list-container-${res.commentNo} comment-container commentOfComment-container" id="comment-container">
						<div>
							<img src="fileFolder/${res.img}" alt="">
						</div>
						
						<div class="comment-container2">
							<div class="comment-id">
								<span>${res.author}</span> <span>${res.date}</span>
							</div>
							<div class="comment-text-container">
								<textarea class="comment-text">${res.content}</textarea>

								<div class="comment-button-container">
									<button id="comment-button-delete-${res.replyNo}" onclick="del_reply(${res.replyNo})">삭제</button>
								</div>
							</div>
						</div>
					</div>	 
				
				`);
				$(".reply-textarea-" + res.commentNo).val("");
				alert("댓글 등록이 완료되었습니다!");
			},
			error: function(request, status, error) {

				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		})
	}

}

function del_reply(no) {
	console.log("클릭!");
	console.log(no);
	if (confirm("정말 댓글을 삭제하시겠습니까?")) {
		$.ajax({
			type: "GET",
			url: "Reply_delete_controller",
			data: {
				no: no,
			},
			success: function() {
				console.log("good");
				$('.comment-container-' + no).remove();
				alert("삭제가 완료되었습니다!");
			}
		})
	}
}
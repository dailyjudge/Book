
function reg_comment(no) {
	if (confirm("정말 댓글을 등록하시겠습니까?")) {
		$.ajax({
			type: "POST",
			url: "Comment_create_controller",
			data: {
				no: no,
				content: $("#comment-textarea").val(),
			},
			dataType: 'json',
			success: function(res) {
				console.log(res.comment_content);
				$("#comment-container2").prepend(`
						<div class="comment-container" id="comment-container">
						<div>
							<img src="fileFolder/${res.image}" alt="">
						</div>
						<div class="comment-container2">
							<div class="comment-id">
								<span>${res.author_id}</span> <span>${res.date}</span>
							</div>
							<div class="comment-text-container">
								<textarea class="comment-text">${res.comment_content}</textarea>

								<div class="comment-button-container">
									<button>수정</button>
									<button>삭제</button>
								</div>
							</div>
						</div>
					</div>`);
				$("#comment-textarea").val('');

				alert("등록이 완료되었습니다!")
			},
			error: function(request, status, error) {

				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		})
	}
}


function del_comment(no) {
	// a : 인덱스
	// b : 댓글 고유 넘버
	// comment-container-${c.comment_number }	
	console.log(no);

	if (confirm("정말 댓글을 삭제하시겠습니까?")) {
		$.ajax({
			type: "GET",
			url: "Comment_delete_controller",
			data: {
				no: no,
			},
			success: function(res) {
				alert("댓글이 성공적으로 삭제되었습니다!");
				$(`#comment-container-${no}`).remove();
			},
			error: function(request, status, error) {

				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		})
	}

}

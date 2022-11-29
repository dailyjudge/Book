
function reg_comment(no, pic, id) {
	console.log("no: " + no);
	console.log("pic: " + pic);
	console.log("id: " + id);
	
	if (confirm("정말 댓글을 등록하시겠습니까?")) {
		
		if($("#comment-textarea").val() == "") {
			alert("댓글을 입력하세요.");
			$("#comment-textarea").focus();
			return;
		}
		
		$.ajax({
			type: "POST",
			url: "Comment_create_controller",
			data: {
				no: no,
				content: $("#comment-textarea").val(),
			},
			dataType: 'json',
			success: function(res) {
				console.log(res);
				$("#comment-container2").prepend(`
				<div class="comment-container" id="comment-container-${res.comment_number}">
					<div>
						<img src="fileFolder/${res.image}" alt="">
					</div>
						
					<div class="comment-container2">
						<div class="comment-id">
							<span>${res.author_id}</span> <span>${res.date}</span>
						</div>
							<div class="comment-text-container">
								<textarea id="comment-modify-text-${res.comment_number }" disabled="disabled" class="comment-text">${res.comment_content }</textarea>
								<input id="comment-modify-copyText-${res.comment_number }" value='${res.comment_content }' style="display: none">								
								
								<div class="comment-button-container">
									<button id="comment-button-update-${res.comment_number }" onclick="update_click_comment('${res.comment_number}')">수정</button>
									<button id="comment-button-delete-${res.comment_number }" onclick="del_comment(${res.comment_number })">삭제</button>
									<button id="comment-button-update-done-${res.comment_number }" onclick="update_cooment('${res.comment_number}')" style="display:none;">완료</button>
									<button id="comment-button-cancel-${res.comment_number }" onclick="comment_update_back('${res.comment_number}')" style="display:none;">취소</button>								
								</div>
							</div>
					</div>
							
							<a class="more-reply reply-more-${res.comment_number }"
							onclick="getReply(${res.comment_number})">답글 보기</a> <a
							style="display: none"
							class="more-reply reply-close-${res.comment_number }"
							onclick="closeReply(${res.comment_number})">답글 닫기</a>
					</div>	
					<div class="reply-container-${res.comment_number } reply-reg">
					<div
						class="comment-container reply-reg-container-${res.comment_number } reply-reg"
						style="display: none">
						<div>
							<img src="fileFolder/${pic }" alt="">
						</div>
						<div class="comment-container2">
							<div class="comment-id">
								<span>${id }</span>
							</div>
							<div class="comment-text-container">
								<textarea id="comment-textarea"
									class="comment-text-reg reply-textarea-${res.comment_number }"></textarea>

								<div class="comment-button-container">
									<button onclick="reg_reply('${res.comment_number}')">등록</button>
								</div>
							</div>
						</div>
					</div>
				<div class="reply2-container-${res.comment_number }"></div>
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

function update_click_comment(no) {
	if (confirm("댓글을 정말 수정하시겠습니까?")) {


		//comment-modify-text-${c.comment_number }
		let textarea = document.getElementById(`comment-modify-text-${no}`);
		$(`#comment-modify-text-${no}`).attr('disabled', false);
		textarea.focus();

		// 커서를 문자 끝으로
		value = textarea.value;
		textarea.value = "";
		textarea.value = value;

		// 보이는 버튼 바꾸기
		//comment-button-update-${c.comment_number }
		//comment-button-delete-${c.comment_number }
		//comment-button-update-done-${c.comment_number }
		//comment-button-cancel-${c.comment_number }
		document.getElementById(`comment-button-update-${no}`).style.display = "none";
		document.getElementById(`comment-button-delete-${no}`).style.display = "none";
		document.getElementById(`comment-button-update-done-${no}`).style.display = "block";
		document.getElementById(`comment-button-cancel-${no}`).style.display = "block";


		//comment-modify-copyText-${c.comment_number }
	}
}


function comment_update_back(no) {

	if (confirm("댓글 수정을 취소하시겠습니까?")) {
		// 버튼 교체
		document.getElementById(`comment-button-update-${no}`).style.display = "block";
		document.getElementById(`comment-button-delete-${no}`).style.display = "block";
		document.getElementById(`comment-button-update-done-${no}`).style.display = "none";
		document.getElementById(`comment-button-cancel-${no}`).style.display = "none";

		// textarea 기본 값으로
		document.getElementById(`comment-modify-text-${no}`).value =
			document.getElementById(`comment-modify-copyText-${no}`).value;
	}

}

function update_cooment(no) {

	if (confirm("정말 댓글을 수정하시겠습니까?")) {

		let textarea = document.getElementById(`comment-modify-text-${no}`);
		let textareaVal = textarea.value;

		// 아무것도 입력되지 않았을 때
		if (textareaVal == "") {
			alert("내용을 입력해주세요.")
			textarea.focus();
			return;
		}

		// 기존 값과 비교
		let copyText = document.getElementById(`comment-modify-copyText-${no}`);
		let copyVal = document.getElementById(`comment-modify-copyText-${no}`).value;

		if (textareaVal == copyVal) {
			alert("수정된 내용이 없습니다.");
			textarea.focus();
			return;
		}

		// 비동기로 값 변경

		$.ajax({
			type: "GET",
			url: "Comment_update_controller",
			data: {
				no: no,
				content: textareaVal,
			},
			success: function() {
				console.log("수정 완료");
				// 버튼 변경
				document.getElementById(`comment-button-update-${no}`).style.display = "block";
				document.getElementById(`comment-button-delete-${no}`).style.display = "block";
				document.getElementById(`comment-button-update-done-${no}`).style.display = "none";
				document.getElementById(`comment-button-cancel-${no}`).style.display = "none";

				// 수정된 값으로
				copyText.value = textareaVal;

				// textarea 수정 불가하게
				$(`#comment-modify-text-${no}`).attr('disabled', true);

				alert("댓글 수정이 완료되었습니다!");
			},
			error: function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		})
	}
}
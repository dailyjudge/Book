function createContent() {
	if (confirm("중고 서적 게시글을 정말 등록하시겠습니까?")) {
		let title = document.getElementById("usedbooks-create-title");
		let content = document.getElementById("usedbooks-create-content");
		let price = document.getElementById("usedbooks-create-price");
		let img = document.getElementById("usedbooks-create-img");

		// 빈 문자열 확인
		if (title.value == "") {
			alert("제목을 입력하세요.");
			return false;
		}

		if (content.value == "") {
			alert("내용을 입력하세요.");
			return false;
		}

		if (price.value == "") {
			alert("가격을 입력하세요.");
			return false;
		}

		if (img.value == "") {
			if (confirm("게시글 등록 후엔 사진 등록이 불가합니다.\n정말 등록하시겠습니까?")) {
				return true;
			} else {
				return false;
			}
		}
	}
}

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
			no: no,
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
					</div>	 
		        
						`);


		},
		error: function(request, status, error) {

			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	})

}

function selectAllContent() {
	const searchParams = new URLSearchParams(location.search);
	let no = searchParams.get('no');
	console.log("게시글 번호: " + no);
	$.ajax({
		type: "GET",
		data: {
			no: no,
		},
		dataType: 'json',
		url: "Comment_getAll_controller",
		success: function(data) {
			console.log(data);

		},
		error: function(request, status, error) {

			console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	})
}

function onUpdate(no) {
	if (confirm("게시글을 정말 수정하시겠습니까?")) {
		// no, 제목, 내용, 가격

		let title = document.getElementById("update-title");
		let titleCopy = document.getElementById("update-title-copy");
		
		let content = document.getElementById("update-content");
		let contentCopy = document.getElementById("update-content-copy");
		
		let price = document.getElementById("update-price");
		let priceCopy = document.getElementById("update-price-copy");
		
		if(title.value == "") {
			alert("제목을 입력해주세요.");
			return;
		}
		
		if(content.value == "") {
			alert("내용을 입력해주세요.");
			return;
		}
		
		if(price.value == "") {
			alert("가격을 입력해주세요.");
			return;
		}
		
		if(title.value == titleCopy.value && content.value == contentCopy.value && price.value == priceCopy.value) {
			alert("변경된 사항이 없습니다.");
			return;
		}		
		
		location.href = "UsedBooks_update_controller?no=" + no + "&title=" + title.value + "&content=" + content.value + "&price=" + price.value;
	}
}
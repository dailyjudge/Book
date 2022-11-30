
$(document).ready(function() {

	$(document).on("click", ".usedbooks-board-container-span2", function() {
		$(".usedbooks-board-container-span1").css("visibility", "visible");
		$(".usedbooks-board-container-span2").css("visibility", "hidden");

		$(".usedbooks-header-button").css("display", "none");
		$(".usedbooks-container3").css("display", "none");

		$(".review-container3").css("display", "block");
		$(".review-create-button").css("display", "block");

	});
	$(document).on("click", ".usedbooks-board-container-span1", function() {
		$(".usedbooks-board-container-span2").css("visibility", "visible");
		$(".usedbooks-board-container-span1").css("visibility", "hidden");

		$(".usedbooks-header-button").css("display", "block");
		$(".usedbooks-container3").css("display", "block");

		$(".review-container3").css("display", "none");
		$(".review-create-button").css("display", "none");
	});
})

function createContentReview() {
	// 등록하러 가야됨
	if (confirm("등록하시겠습니?")) {
		console.log("hi");
		location.href = "ReviewBooks_create_controller";
	}

}

function createReviewContent() {
	return true;
}

function update_reviewbooks_board(no) {
	// 수정 페이지로
	// Model 일해야지
	if (confirm("게시물을 수정하시겠습니까?")) {
		// 값 받아오기. (제목, 내용)


		//location.href=`ReviewBooks_delete_controller?no=${no}`;
		location.href = "ReviewBooks_update_controller?no=" + no;
	}
}

function onReviewUpdate(no) {

	if (confirm("수정완료하시겠습니까?")) {

		let title_input = document.getElementById("review-update-title");
		let content_input = document.getElementById("review-update-content");

		let title = title_input.value;
		let content = content_input.value;

		location.href = "ReviewBooks_update_controller?no=" + no + "&title=" + title + "&content=" + content;

	}
}
function delete_reviewbooks_board(no) {

	if (confirm("게시물을 삭제하시겠습니까?")) {
		//location.href=`ReviewBooks_delete_controller?no=${no}`;


		location.href = "ReviewBooks_delete_controller?no=" + no;
	}

}
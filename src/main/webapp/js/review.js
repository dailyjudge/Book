$(document).ready(function () {
  $(document).on("click", ".usedbooks-board-container-span2", function () {
    $(document).on("click", ".usedbooks-board-container-span2", function () {
      ;
    });
    $(document).on("click", ".usedbooks-board-container-span1", function () {
      location.href = "UsedBooks_main_controller";
    });
  });
});

function createContentReview() {
  // 등록하러 가야됨
  if (confirm("등록하시겠습니?")) {
    console.log("hi");
    location.href = "ReviewBooks_create_controller";
  }
}

function createReviewContent() {
  let title = document.getElementById("reviewbooks-create-item-title");
  let content = document.getElementById("reviewbooks-create-item-content");

  if (title.value == "") {
    alert("제목을 입력하세요.");
    title.focus();
    return false;
  }

  if (content.value == "") {
    alert("내용을 입력하세요.");
    content.focus();
    return false;
  }

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
    let title_input_old = document.getElementById("review-update-title-copy");
    let content_input_old = document.getElementById(
      "review-update-content-copy"
    );

    let title = title_input.value;
    let content = content_input.value;
    let old_title = title_input_old.value;
    let old_content = content_input_old.value;

    if (title == "") {
      alert("제목을 입력하세요");
      title_input.focus();
      return false;
    }
    if (content == "") {
      alert("내용을 입력하세요");
      content_input.focus();
      return false;
    }

    if (old_title == title && old_content == content) {
      alert("수정된 내용이 없습니다!");
      return false;
    }

    location.href =
      "ReviewBooks_update_controller?no=" +
      no +
      "&title=" +
      title +
      "&content=" +
      content;
  }
}
function delete_reviewbooks_board(no) {
  if (confirm("게시물을 삭제하시겠습니까?")) {
    //location.href=`ReviewBooks_delete_controller?no=${no}`;

    location.href = "ReviewBooks_delete_controller?no=" + no;
  }
}

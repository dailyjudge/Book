<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <<<<<<< HEAD
  <style>
    body {
      margin-top: 300px;
    }
  </style>

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

      <div class="usedbooks-detail-button">
        <button onclick="update_usedBooks_board('${target.no}')">수정</button>
        <button onclick="delete_usedBooks_board('${target.no}')">삭제</button>
      </div>
    </div>
  </body>
</html>

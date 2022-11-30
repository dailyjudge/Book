<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <div class="usedbooks-create-container">
      <div class="usedbooks-create-header">
        <strong>게시글 수정</strong>
      </div>
      <div class="usedbooks-create-item">
        <strong>제목</strong><br />

        <input
          id="update-title"
          class="usedbooks-create-item-title"
          type="text"
          name="title"
          value="${target.title }"
        />
        <input
          id="update-title-copy"
          class="usedbooks-create-item-title-copy"
          style="display: none"
          type="text"
          value="${target.title }"
        />
      </div>

      <div class="usedbooks-create-item">
        <strong>내용</strong><br />

        <textarea
          id="update-content"
          class="usedbooks-create-textarea"
          name="content"
        >
${target.content }</textarea
        >
        <textarea
          id="update-content-copy"
          class="usedbooks-create-textarea-copy"
          style="display: none"
          name="content"
        >
${target.content }</textarea
        >
      </div>

      <div class="usedbooks-create-item">
        <strong>판매 가격</strong><span>원</span><br />

        <input
          id="update-price"
          class="usedbooks-create-item-price"
          type="number"
          name="price"
          value="${target.price }"
        />
        <input
          id="update-price-copy"
          class="usedbooks-create-item-price-copy"
          style="display: none"
          type="number"
          name="price"
          value="${target.price }"
        />
      </div>

      <div
        class="usedbooks-create-button-container usedbooks-update-button-container"
      >
        <button onclick="onUpdate('${target.no}')">수정하기</button>
        <button onclick="history.back(-1)">돌아가기</button>
      </div>
    </div>
  </body>
</html>

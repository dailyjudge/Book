<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="js/findinfo.js"></script>
    <link rel="stylesheet" href="css/findId.css" />
  </head>
  <body>
    <form
      action="Find_id_controller"
      method="post"
      name="findId"
      onsubmit="return idCheck()"
    >
      <div class="find-id-container">
        <div>
          <h3 class="find-id">아이디 찾기</h3>
        </div>
        <div class="find-name">
          <input name="name" class="btn-name" placeholder="등록한 이름" />
        </div>
        <br />
        <div class="find-email">
          <input name="email" class="btn-email" placeholder="등록한 이메일" />
        </div>
        <br />
        <div class="find-button">
          <button>찾기</button>
        </div>
      </div>
    </form>
  </body>
</html>
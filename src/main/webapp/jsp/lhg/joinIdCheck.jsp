<%@page import="com.book.account.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>아이디중복체크</h2>
<% 
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id"); 

int result = AccountDAO.getAdao().joinIdCheck(id);

if (result == 1){
	out.print("사용가능한 아이디입니다");
	%>
	 <input type="button" value="아이디 사용하기" onclick="result();">
	<%
	
}else if(result == 0){
	out.print("중복된 아이디입니다.");
}else{
	out.print("에러 발생!(-1)"); 
}
%>

<fieldset>
	<form action="joinIdCheck.jsp" method="post" name="wfr">
		ID : <input type="text" name="userid" value="<%=id%>">
		<input type="submit" value="중복 확인">	 
	</form>
</fieldset>

<script type="text/javascript">
    function result(){
    	opener.document.myForm.id.value = document.wfr.userid.value;
       	opener.document.fr.id.readOnly=true;
    	window.close();
    }
 </script>
 
</body>
</html>
<%@page import="com.book.main.Recommend"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


	<div id="visual">
	
		<div class="on">
			<a href="${recommends0.link }"><img src="${recommends0.urlImg }" alt="1"
				width="100%" height="100%"></a>
		</div>
		<div>
			<a href="${recommends1.link }"><img src="${recommends1.urlImg }" alt="2"
				width="100%" height="100%"></a>
		</div>
		<div>
			<a href="${recommends2.link }"><img src="${recommends2.urlImg }" alt="3"
				width="100%" height="100%"></a>
		</div>
		<div>
			<a href="${recommends3.link }"><img src="${recommends3.urlImg }" alt="4"
				width="100%" height="100%"></a>
		</div>
		<section id="control">
			<a class="on" href="#"></a> <a href="#"></a> <a href="#"></a> <a
				href="#"></a>
		</section>
	</div>
</body>
</html>
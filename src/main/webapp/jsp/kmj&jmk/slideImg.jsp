<%@page import="com.book.main.Recommend"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../../js/slide.js"></script>
<link rel="stylesheet" href="../../css/slide.css">
</head>
<body>

	<div id="visual">
		<div class="on">
			<div style="width: 50%; height:100%; float:left;">
				<a href="${recommends0.link }"><img src="${recommends0.urlImg }" alt="1"
				width="100%" height="100%"></a>
			</div>
			<div style="width: 50%; height:100%; float:left;">
				<a href="${recommends1.link }"><img src="${recommends1.urlImg }" alt="2"
				width="100%" height="100%"></a>
			</div>
			
		</div>
		
		<div>
			<div style="width: 50%; height:100%; float:left;">
				<a href="${recommends2.link }"><img src="${recommends2.urlImg }" alt="3"
				width="100%" height="100%"></a>
			</div>
			<div style="width: 50%; height:100%; float:left;">
				<a href="${recommends3.link }"><img src="${recommends3.urlImg }" alt="4"
				width="100%" height="100%"></a>
			</div>
		</div>
		<div>
			<div style="width: 50%; height:100%; float:left;">
				<a href="${recommends4.link }"><img src="${recommends4.urlImg }" alt="3"
				width="100%" height="100%"></a>
			</div>
			<div style="width: 50%; height:100%; float:left;">
				<a href="${recommends5.link }"><img src="${recommends5.urlImg }" alt="4"
				width="100%" height="100%"></a>
			</div>
		</div>
		<div>
			<div style="width: 50%; height:100%; float:left;">
				<a href="${recommends6.link }"><img src="${recommends6.urlImg }" alt="3"
				width="100%" height="100%"></a>
			</div>
			<div style="width: 50%; height:100%; float:left;">
				<a href="${recommends7.link }"><img src="${recommends7.urlImg }" alt="4"
				width="100%" height="100%"></a>
			</div>
		</div>
		<div>
			<div style="width: 50%; height:100%; float:left;">
				<a href="${recommends8.link }"><img src="${recommends8.urlImg }" alt="3"
				width="100%" height="100%"></a>
			</div>
			<div style="width: 50%; height:100%; float:left;">
				<a href="${recommends9.link }"><img src="${recommends9.urlImg }" alt="4"
				width="100%" height="100%"></a>
			</div>
		</div>
		<section id="control">
			<a class="on" href="#"></a> <a href="#"></a> <a href="#"></a> <a href="#"></a> <a href="#"></a> 
		</section>
	</div>
</body>
</html>
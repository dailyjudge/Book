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



<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<script type="text/javascript"
	src="https://book.interpark.com/api/newBook.api?key=B1702425132364B8C55D9F1581CDD3DE16CE0A575A0CF8FCAD4649310AE5AC61&categoryId=100&output=json"></script>
<script>
	$(function() {
		$('.center').slick({
			centerMode : true,
			centerPadding : '60px',
			slidesToShow : 3,
			responsive : [ {
				breakpoint : 768,
				settings : {
					arrows : false,
					centerMode : true,
					centerPadding : '40px',
					slidesToShow : 3
				}
			}, {
				breakpoint : 480,
				settings : {
					arrows : false,
					centerMode : true,
					centerPadding : '40px',
					slidesToShow : 1
				}
			} ]

		});

	});
</script>


</head>
<body>

	<div id="visual">
		<div class="on">
			<div style="width: 50%; height: 100%; float: left;">
				<a href="${recommends0.link }"><img src="${recommends0.urlImg }"
					alt="1" width="100%" height="100%"></a>
			</div>
			<div style="width: 50%; height: 100%; float: left;">
				<a href="${recommends1.link }"><img src="${recommends1.urlImg }"
					alt="2" width="100%" height="100%"></a>
			</div>

		</div>

		<div>
			<div style="width: 50%; height: 100%; float: left;">
				<a href="${recommends2.link }"><img src="${recommends2.urlImg }"
					alt="3" width="100%" height="100%"></a>
			</div>
			<div style="width: 50%; height: 100%; float: left;">
				<a href="${recommends3.link }"><img src="${recommends3.urlImg }"
					alt="4" width="100%" height="100%"></a>
			</div>
		</div>
		<div>
			<div style="width: 50%; height: 100%; float: left;">
				<a href="${recommends4.link }"><img src="${recommends4.urlImg }"
					alt="3" width="100%" height="100%"></a>
			</div>
			<div style="width: 50%; height: 100%; float: left;">
				<a href="${recommends5.link }"><img src="${recommends5.urlImg }"
					alt="4" width="100%" height="100%"></a>
			</div>
		</div>
		<div>
			<div style="width: 50%; height: 100%; float: left;">
				<a href="${recommends6.link }"><img src="${recommends6.urlImg }"
					alt="3" width="100%" height="100%"></a>
			</div>
			<div style="width: 50%; height: 100%; float: left;">
				<a href="${recommends7.link }"><img src="${recommends7.urlImg }"
					alt="4" width="100%" height="100%"></a>
			</div>
		</div>
		<div>
			<div style="width: 50%; height: 100%; float: left;">
				<a href="${recommends8.link }"><img src="${recommends8.urlImg }"
					alt="3" width="100%" height="100%"></a>
			</div>
			<div style="width: 50%; height: 100%; float: left;">
				<a href="${recommends9.link }"><img src="${recommends9.urlImg }"
					alt="4" width="100%" height="100%"></a>
			</div>
		</div>
		<section id="control">
			<a class="on" href="#"></a> <a href="#"></a> <a href="#"></a> <a
				href="#"></a> <a href="#"></a>
		</section>
	</div>


	<div class="center">
		<div>1</div>
		<div>2</div>
		<div>3</div>
		<div>4</div>
		<div>5</div>
		<div>6</div>
	</div>


</body>
</html>
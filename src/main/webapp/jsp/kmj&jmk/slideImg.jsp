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

	<div id="first-view">
		<div id="newBook">
			<h1>신 간 도 서</h1>
			<div id="visual">
				<div class="on">
					<div style="width: 50%; height: 100%; float: left;">
						<a href="${recommends0.link }"><img
							src="${recommends0.urlImg }" alt="1" width="100%" height="100%"></a>
					</div>
					<div style="width: 50%; height: 100%; float: left;">
						<a href="${recommends1.link }"><img
							src="${recommends1.urlImg }" alt="2" width="100%" height="100%"></a>
					</div>

				</div>

				<div>
					<div style="width: 50%; height: 100%; float: left;">
						<a href="${recommends2.link }"><img
							src="${recommends2.urlImg }" alt="3" width="100%" height="100%"></a>
					</div>
					<div style="width: 50%; height: 100%; float: left;">
						<a href="${recommends3.link }"><img
							src="${recommends3.urlImg }" alt="4" width="100%" height="100%"></a>
					</div>
				</div>
				<div>
					<div style="width: 50%; height: 100%; float: left;">
						<a href="${recommends4.link }"><img
							src="${recommends4.urlImg }" alt="3" width="100%" height="100%"></a>
					</div>
					<div style="width: 50%; height: 100%; float: left;">
						<a href="${recommends5.link }"><img
							src="${recommends5.urlImg }" alt="4" width="100%" height="100%"></a>
					</div>
				</div>
				<div>
					<div style="width: 50%; height: 100%; float: left;">
						<a href="${recommends6.link }"><img
							src="${recommends6.urlImg }" alt="3" width="100%" height="100%"></a>
					</div>
					<div style="width: 50%; height: 100%; float: left;">
						<a href="${recommends7.link }"><img
							src="${recommends7.urlImg }" alt="4" width="100%" height="100%"></a>
					</div>
				</div>
				<div>
					<div style="width: 50%; height: 100%; float: left;">
						<a href="${recommends8.link }"><img
							src="${recommends8.urlImg }" alt="3" width="100%" height="100%"></a>
					</div>
					<div style="width: 50%; height: 100%; float: left;">
						<a href="${recommends9.link }"><img
							src="${recommends9.urlImg }" alt="4" width="100%" height="100%"></a>
					</div>
				</div>
				<section id="control">
					<a class="on" href="#"></a> <a href="#"></a> <a href="#"></a> <a
						href="#"></a> <a href="#"></a>
				</section>
			</div>
		</div>
		<div id="scholarInfo">
			<h1>학술 정보</h1>
			<div id="scholarInfo-grid">
				<div class="grid-element">
				<!-- 알라딘 -->
					<a href="https://www.aladin.co.kr/home/welcome.aspx"><img class="logo" alt=""
						src="https://image.aladin.co.kr/img/m/2018/shopping_app1.png"></a>
				</div>
				<div>
				<!-- 인터파크 -->
					<a href="http://www.interpark.com/malls/index.html"><img class="logo" alt=""
						src="data:image/png;base64,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"></a>
				</div>
				<div>
				<!-- DBpia -->
					<a href="https://www.dbpia.co.kr/"><img class="logo" alt=""
						src="https://yt3.ggpht.com/z_yPzNUrFQsvo7TTDAo2R-hCLGdfnZKcqA-dBMgA1woZ9CLW8TIokXXA5gQftWDxNszTjv-S7w=s900-c-k-c0x00ffffff-no-rj"></a>
				</div>
				<div>
				<!-- 인프런 -->
					<a href="https://www.inflearn.com/"><img class="logo" alt=""
						src="https://cdn.inflearn.com/wp-content/uploads/avatars/17/b415d9fa24d186c4adf22ca9a49116b5-bpfull.png"></a>
				</div>
			</div>
		</div>
	</div>

	<!-- <div class="center">
		<div>1</div>
		<div>2</div>
		<div>3</div>
		<div>4</div>
		<div>5</div>
		<div>6</div>
	</div> -->


</body>
</html>
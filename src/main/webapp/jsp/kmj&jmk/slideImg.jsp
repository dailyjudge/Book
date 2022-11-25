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

<script src="js/new_book.js"></script>



<script type="text/javascript">
	$(document)
			.ready(
					function() {

						function good() {
							console.log("값 받기 완료");
						}

						$.ajax(
										{
											method : "GET",
											url : "http://book.interpark.com/api/newBook.api",
											data : {
												key : '9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58',
												categoryId : 102,
												output : 'json',
												nosniff : "off",
												callback : good
											},
											dataType : "jsonp"
										})
								.done(
										function(msg) {
											console.log("받기 완료");
											console.log(msg.item);

											for (let i = 0; i < msg.item.length; i++) {
												let src = msg.item[i].coverLargeUrl;
												let url = msg.item[i].link;

												$('#slider-div')
														.slick('slickAdd',
																"<div><a href="+url+"><img src=" + src + "></a></div>");
											}

										});

						$('#slider-div')
								.slick(
										{
											slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
											infinite : true, //무한 반복 옵션    
											slidesToShow : 5, // 한 화면에 보여질 컨텐츠 개수
											slidesToScroll : 2, //스크롤 한번에 움직일 컨텐츠 개수
											speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
											arrows : true, // 옆으로 이동하는 화살표 표시 여부
											autoplay : true, // 자동 스크롤 사용 여부
											autoplaySpeed : 2000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
											pauseOnHover : false, // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
											vertical : false, // 세로 방향 슬라이드 옵션
											prevArrow : false,
											nextArrow : false,
											draggable : true, //드래그 가능 여부 
											//focusOnSelect : true,
											variableWidth : true,
											centerPadding : '20px',

											responsive : [ {
												breakpoint : 900,
												settings : {

													slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
													infinite : true, //무한 반복 옵션    
													slidesToShow : 4, // 한 화면에 보여질 컨텐츠 개수
													slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
													speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
													arrows : true, // 옆으로 이동하는 화살표 표시 여부
													autoplay : true, // 자동 스크롤 사용 여부
													autoplaySpeed : 2000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
													pauseOnHover : false, // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
													vertical : false, // 세로 방향 슬라이드 옵션
													//prevArrow : "<button type='button' class='slick-prev'>이전</button>", // 이전 화살표 모양 설정
													//nextArrow : "<button type='button' class='slick-next'>이후</button>", // 다음 화살표 모양 설정
													draggable : true, //드래그 가능 여부 
													//focusOnSelect : true,
													variableWidth : true,
													centerMode : true,
													centerPadding : '20px',

												},

												breakpoint : 680,
												settings : {
													slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
													infinite : true, //무한 반복 옵션    
													slidesToShow : 3, // 한 화면에 보여질 컨텐츠 개수
													slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
													speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
													arrows : true, // 옆으로 이동하는 화살표 표시 여부
													autoplay : true, // 자동 스크롤 사용 여부
													autoplaySpeed : 2000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
													pauseOnHover : false, // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
													vertical : false, // 세로 방향 슬라이드 옵션
													//prevArrow : "<button type='button' class='slick-prev'>이전</button>", // 이전 화살표 모양 설정
													//nextArrow : "<button type='button' class='slick-next'>이후</button>", // 다음 화살표 모양 설정
													draggable : true, //드래그 가능 여부 
													//focusOnSelect : true,
													variableWidth : true,
													centerMode : true,
													centerPadding : '20px',

												},
												breakpoint : 450,
												settings : {
													slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
													infinite : true, //무한 반복 옵션    
													slidesToShow : 2, // 한 화면에 보여질 컨텐츠 개수
													slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
													speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
													arrows : true, // 옆으로 이동하는 화살표 표시 여부
													autoplay : true, // 자동 스크롤 사용 여부
													autoplaySpeed : 2000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
													pauseOnHover : false, // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
													vertical : false, // 세로 방향 슬라이드 옵션
													//prevArrow : "<button type='button' class='slick-prev'>이전</button>", // 이전 화살표 모양 설정
													//nextArrow : "<button type='button' class='slick-next'>이후</button>", // 다음 화살표 모양 설정
													draggable : true, //드래그 가능 여부 
													//focusOnSelect : true,
													variableWidth : true,
													centerMode : true,
													centerPadding : '20px',

												},
												breakpoint : 200,
												settings : {
													slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
													infinite : true, //무한 반복 옵션    
													slidesToShow : 1, // 한 화면에 보여질 컨텐츠 개수
													slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
													speed : 1000, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
													arrows : true, // 옆으로 이동하는 화살표 표시 여부
													autoplay : true, // 자동 스크롤 사용 여부
													autoplaySpeed : 2000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
													pauseOnHover : false, // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
													vertical : false, // 세로 방향 슬라이드 옵션
													//prevArrow : "<button type='button' class='slick-prev'>이전</button>", // 이전 화살표 모양 설정
													//nextArrow : "<button type='button' class='slick-next'>이후</button>", // 다음 화살표 모양 설정
													draggable : true, //드래그 가능 여부 
													//focusOnSelect : true,
													variableWidth : true,
													centerMode : true,
													centerPadding : '20px',

												},

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

	<div id="slider-div"></div>


</body>
</html>
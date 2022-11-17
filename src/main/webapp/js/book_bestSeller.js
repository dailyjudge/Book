$(document).ready(function() {
	
	
	//  book.interpark.com/api/bestSeller.api?key=9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58&categoryId=100&output=json



	function good() { console.log("값 받기 완료"); }
	
	let maxPageNum1 = 0;
	let maxPageNum2 = 0;
	let maxPageNum3 = 0;
	let maxPageNum4 = 0;
	
	// 100 - 국내도서
	$.ajax({
		method: "GET",
		url: "http://book.interpark.com/api/bestSeller.api",
		data: {
			key: '9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58',
			categoryId: 100, output: 'json', nosniff: "off",
			callback: good
		},
		dataType: "jsonp"
	}).done(function(msg) {
		console.log("100 받기 완료");
		maxPageNum1 = msg.item.length;

		let list = msg.item;
		console.log(list[0]);
		for (let i = 0; i < list.length; i++) {

			let url = list[i].coverLargeUrl != "" ? list[i].coverLargeUrl
				: "data:image/jpeg;base64,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";

			$("#search-result").append(`
		   <div class="book-item bestseller">
			   <div class="item-img">
						  <img class='thumbnail' src=${url} alt=''>
					   </div>
			   <div class="item-desc">
						   <p>『${list[i].title}』</p>
						   <p>『${list[i].description.slice(0, 100)}...』</p>
					   	   <p>\\${list[i].priceStandard}</p>
					   	   <input id="hidden-search-url" value=${list[i].link} type="hidden">
					   </div>
			   </div>
			   `);

		}
		$("#search-result").append("<div class='more-container'><button id='item-more1' class='item-more'>더보기</button></div>");


		
		for(let i = 0; i < 4; i++) {
			$(`#search-result`).children(`.bestseller:eq(${i})`).css("display","block");
		}
	})
	
	
	$.ajax({
		method: "GET",
		url: "http://book.interpark.com/api/bestSeller.api",
		data: {
			key: '9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58',
			categoryId: 200, output: 'json', nosniff: "off",
			callback: good
		},
		dataType: "jsonp"
	}).done(function(msg) {
		console.log("200 받기 완료");
		maxPageNum2 = msg.item.length;

		let list = msg.item;

		for (let i = 0; i < list.length; i++) {

			let url = list[i].coverLargeUrl != "" ? list[i].coverLargeUrl
				: "data:image/jpeg;base64,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";

			$("#search-result2").append(`
		   <div class="book-item bestseller">
			   <div class="item-img">
						  <img class='thumbnail' src=${url} alt=''>
					   </div>
			   <div class="item-desc">
						   <p>『${list[i].title}』</p>
						   <p>『${list[i].description.slice(0, 100)}...』</p>
					   	   <p>\\${list[i].priceStandard}</p>
					   	   <input id="hidden-search-url" value=${list[i].link} type="hidden">
					   </div>
			   </div>
			   `);

		}
		$("#search-result2").append("<div class='more-container'><button id='item-more2' class='item-more'>더보기</button></div>");


		
		for(let i = 0; i < 4; i++) {
			$(`#search-result2`).children(`.bestseller:eq(${i})`).css("display","block");
		}
	})
	
	$.ajax({
		method: "GET",
		url: "http://book.interpark.com/api/bestSeller.api",
		data: {
			key: '9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58',
			categoryId: 300, output: 'json', nosniff: "off",
			callback: good
		},
		dataType: "jsonp"
	}).done(function(msg) {
		console.log("300 받기 완료");
		maxPageNum3 = msg.item.length;

		let list = msg.item;

		for (let i = 0; i < list.length; i++) {

			let url = list[i].coverLargeUrl != "" ? list[i].coverLargeUrl
				: "data:image/jpeg;base64,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";

			$("#search-result3").append(`
		   <div class="book-item bestseller">
			   <div class="item-img">
						  <img class='thumbnail' src=${url} alt=''>
					   </div>
			   <div class="item-desc">
						   <p>『${list[i].title}』</p>
						   <p>『${list[i].description.slice(0, 100)}...』</p>
					  	   <p>\\${list[i].priceStandard}</p>
					  	   <input id="hidden-search-url" value=${list[i].link} type="hidden">
					   </div>
			   </div>
			   `);

		}
		$("#search-result3").append("<div class='more-container'><button id='item-more3' class='item-more'>더보기</button></div>");


		
		for(let i = 0; i < 4; i++) {
			$(`#search-result3`).children(`.bestseller:eq(${i})`).css("display","block");
		}
	})
	
	$.ajax({
		method: "GET",
		url: "http://book.interpark.com/api/bestSeller.api",
		data: {
			key: '9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58',
			categoryId: 400, output: 'json', nosniff: "off",
			callback: good
		},
		dataType: "jsonp"
	}).done(function(msg) {
		console.log("400 받기 완료");

		maxPageNum4 = msg.item.length;
		console.log(msg.item);
		console.log(maxPageNum4);
		let list = msg.item;

		for (let i = 0; i < list.length; i++) {

			let url = list[i].coverLargeUrl != "" ? list[i].coverLargeUrl
				: "data:image/jpeg;base64,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";

			$("#search-result4").append(`
		   <div class="book-item bestseller">
			   <div class="item-img">
						  <img class='thumbnail' src=${url} alt=''>
					   </div>
			   <div class="item-desc">
						   <p>『${list[i].title}』</p>
						   <p>『${list[i].description.slice(0, 100)}...』</p>
					       <p>\\${list[i].priceStandard}</p>
					       <input id="hidden-search-url" value=${list[i].link} type="hidden">
					   </div>
			   </div>
			   `);

		}
		$("#search-result4").append("<div class='more-container'><button id='item-more4' class='item-more'>더보기</button></div>");


		
		for(let i = 0; i < 4; i++) {
			$(`#search-result4`).children(`.bestseller:eq(${i})`).css("display","block");
		}
	})
	
	
	let pageNum1 = 4;
	$(document).on("click", "#item-more1",function () {	
	
		for(let i = pageNum1; i < pageNum1 + 4; i++) {
			$(`#search-result`).children(`.bestseller:eq(${i})`).css("display","block");
		}	
		
        
		pageNum1 += 4;
		if(pageNum1 > maxPageNum1) {
			$('#item-more1').remove();
		}
    })
    
    let pageNum2 = 4;
    $(document).on("click", "#item-more2",function () {	
	
		for(let i = pageNum2; i < pageNum2 + 4; i++) {
			$(`#search-result2`).children(`.bestseller:eq(${i})`).css("display","block");
		}	
		
        
		pageNum2 += 4;
		if(pageNum2 > maxPageNum2) {
			$('#item-more2').remove();
		}
    })
    
    let pageNum3 = 4;
    $(document).on("click", "#item-more3",function () {	
	
		for(let i = pageNum3; i < pageNum3 + 4; i++) {
			$(`#search-result3`).children(`.bestseller:eq(${i})`).css("display","block");
		}	
		
        
		pageNum3 += 4;
		if(pageNum3 > maxPageNum3) {
			$('#item-more3').remove();
		}
    })
    
     let pageNum4 = 4;
    $(document).on("click", "#item-more4",function () {	
	
		for(let i = pageNum4; i < pageNum4 + 4; i++) {
			$(`#search-result4`).children(`.bestseller:eq(${i})`).css("display","block");
		}	
		
        
		pageNum4 += 4;
		if(pageNum4 > maxPageNum4) {
			$('#item-more4').remove();
		}
    })
    
	$(document).on("mouseover", ".item-img", function() {
		$(this).fadeOut('slow');
		$(this).next().fadeIn('slow');
	});

	$(document).on("mouseleave", ".item-desc", function() {
		$(this).fadeOut('slow');
		$(this).prev().fadeIn('slow');
	});


	$(document).on("click", ".item-desc", function() {
		location.href = this.children[3].value;
	});

})
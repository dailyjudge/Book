$(document).ready(function() {

	function good() { console.log("값 받기 완료"); }

	// 100 - 국내도서
	$.ajax({
		method: "GET",
		url: "http://book.interpark.com/api/newBook.api",
		data: {
			key: '9D94365668C72FEE72038FC3AF671C5CF7E548299872BFA5789AA93394BBEA58',
			categoryId: 101, output: 'json', nosniff: "off",
			callback: good
		},
		dataType: "jsonp"
	}).done(function(msg) {
		console.log("100 받기 완료");
		console.log(msg.item);


		for (let i = 0; i < msg.item.length; i++) {

			let src = msg.item[i].coverLargeUrl;

			//$(".autoplay").append(`
				
			
		 		//<img class="slide-item-img" src="${src}">
		 	
		 		
	
			
			//`)
		}
	});

});


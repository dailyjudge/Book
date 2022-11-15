$(document).ready(function () {
    var pageNum = 1;

    $("#search").click(function () {
       $("#search-result").html("");
		
        $.ajax({
            method: "GET",
            url: "https://dapi.kakao.com/v3/search/book?target=title",
            data: { query: $("#query").val(), page: pageNum},
            headers: {Authorization: "KakaoAK 362cca98cf4fe85293ae140cbbcadeff"}, // ########부분에 본인의 REST API 키를 넣어주세요.
        })
        .done(function (msg) {
            console.log(msg);

            for (var i = 0; i < 8; i++){
	
				$("#search-result").append(`
				<div class="book-item">
            		<div class="item-img">
               		   <img class='thumbnail' src=${msg.documents[i].thumbnail} alt=''>
           		    </div>
            		<div class="item-desc">
               			<p>『${msg.documents[i].title}』</p>
               			<p>『${msg.documents[i].contents.slice(0, 100)}...』</p>
              			<p>\\${msg.documents[i].price}</p>
           		    </div>
              	</div>    
           		    `);
        		
   				
            }
        });
    })
    
	$("#search-more").click(function () {
        $.ajax({
            method: "GET",
            url: "https://dapi.kakao.com/v3/search/book?target=title",
            data: { query: $("#query").val(), page: ++pageNum},
            headers: {Authorization: "KakaoAK 362cca98cf4fe85293ae140cbbcadeff"} // ########부분에 본인의 REST API 키를 넣어주세요.

        })
        .done(function (msg) {
            console.log(msg);
           for (var i = 0; i < 8; i++){
	
				$("#search-result").append(`
				<div class="book-item">
            		<div class="item-img">
               		   <img class='thumbnail' src=${msg.documents[i].thumbnail} alt=''>
           		    </div>
            		<div class="item-desc">
               			<p>『${msg.documents[i].title}』</p>
               			<p>『${msg.documents[i].contents.slice(0, 100)}...』</p>
              			<p>\\${msg.documents[i].price}</p>
           		    </div>
              	</div>    
           		    `);
        		
   				
            }
        });
    })
    

            $(document).on("mouseover", ".item-img", function(){
               	console.log(111);
                $(this).fadeOut('slow');
                $(this).next().fadeIn('slow');
                
            });

            $(document).on("mouseleave",".item-desc", function(){
                $(this).fadeOut('slow');
                $(this).prev().fadeIn('slow');
            });

    
})
$(document).ready(function () {
    var pageNum = 1;

    $("#search").click(function () {
        $("div").html("");

        $.ajax({
            method: "GET",
            url: "https://dapi.kakao.com/v3/search/book?target=title",
            data: { query: $("#query").val(), page: pageNum},
            headers: {Authorization: "KakaoAK 362cca98cf4fe85293ae140cbbcadeff"} // ########부분에 본인의 REST API 키를 넣어주세요.

        })
        .done(function (msg) {
            console.log(msg);
            for (var i = 0; i < 10; i++){
                $("#search-result").append("<h2><a href='"+ msg.documents[i].url +"'>" + msg.documents[i].title + "</a></h2>");
                $("#search-result").append("<strong>저자:</strong> " + msg.documents[i].authors + "<br>");
                $("#search-result").append("<strong>출판사:</strong> " + msg.documents[i].publisher + "<br>");
                $("#search-result").append("<strong>요약:</strong> " + msg.documents[i].contents + "...<br>");
                $("#search-result").append("<img src='" + msg.documents[i].thumbnail + "'/><br>");
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
            for (var i = 0; i < 10; i++){
                $("#search-result").append("<h2><a href='"+ msg.documents[i].url +"'>" + msg.documents[i].title + "</a></h2>");
                $("#search-result").append("<strong>저자:</strong> " + msg.documents[i].authors + "<br>");
                $("#search-result").append("<strong>출판사:</strong> " + msg.documents[i].publisher + "<br>");
                $("#search-result").append("<strong>요약:</strong> " + msg.documents[i].contents + "...<br>");
                $("#search-result").append("<img src='" + msg.documents[i].thumbnail + "'/><br>");
            }
        });
    })
})
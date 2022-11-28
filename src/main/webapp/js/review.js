
$(document).ready(function () {
	
 $(document).on("click", ".usedbooks-board-container-span2", function(){
                $(".usedbooks-board-container-span1").css("visibility", "visible");
                $(".usedbooks-board-container-span2").css("visibility", "hidden");
                
                $(".usedbooks-header-button").css("display", "none");
                $(".usedbooks-container").css("display", "none");
                
                $(".review-container").css("display", "block");
                
            });
  $(document).on("click", ".usedbooks-board-container-span1", function(){
                $(".usedbooks-board-container-span2").css("visibility", "visible");
                $(".usedbooks-board-container-span1").css("visibility", "hidden");
                
                $(".usedbooks-header-button").css("display", "block");
                $(".usedbooks-container").css("display", "block");
                
                $(".review-container").css("display", "none");
            });
})
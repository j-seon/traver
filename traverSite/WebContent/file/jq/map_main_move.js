$(document).ready(function () {
	$(".left_open").click(function(){
		$(".left-side").toggleClass("open"); 
		// main_left_side 열렸다 닫혔다 번갈아가며 실행
          
		if($(".left-side").hasClass("open")) {
		// 메뉴 닫겨있으면 열기
			$(".side__open_img").attr("src", "../../file/img/close.png");
            $(".left-side").animate({left:0}, 300)
            $(".main-top_area").animate({left:"300px"}, 300)
        } else {
        // 열려있으면 닫기
            $(".side__open_img").attr("src", "../../file/img/open.png");
            $(".left-side").animate({left:"-273px"}, 300)
            $(".main-top_area").animate({left:"20px"}, 300)
        }
    })
	$(".right_open").click(function(){
        $(".right-side").toggleClass("open"); 
        // main_left_side 열렸다 닫혔다 번갈아가며 실행
          
        if($(".right-side").hasClass("open")) {
        // 메뉴 닫겨있으면 열기
            $(".side__open_img").attr("src", "../../file/img/close.png");
            $(".right-side").animate({right:0}, 300)
            
        } else {
        // 열려있으면 닫기
            $(".side__open_img").attr("src", "../../file/img/open.png");
            $(".right-side").animate({right:"-291px"}, 300)
        }
    })
})
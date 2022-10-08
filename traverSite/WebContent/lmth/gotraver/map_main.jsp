<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("utf-8");
ArrayList<PlaceInfo> placeList = (ArrayList<PlaceInfo>)request.getAttribute("placeList");
String placeCategory = request.getParameter("placeCategory");

boolean isHaveLodging = false;
boolean isHaveRestaurant = false;
boolean isHaveTourist = false;

for (int i = 0; i < placeList.size(); i++ ) { // 장소들을 가져온다.
	PlaceInfo pi = placeList.get(i);
	if(pi.getPi_ctgr().equals("1")) { //카테고리가 숙소인게 있다면
		isHaveLodging = true;
	} else if(pi.getPi_ctgr().equals("2")) { // 카테고리가 음식점이라면
		isHaveRestaurant = true;
	} else if (pi.getPi_ctgr().equals("3")) { // 카테고리가 관광지인게 있다면
		isHaveTourist = true;
	}
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
  <style>

	button{
		background: inherit ; 
		border:none; 
		box-shadow:none;
		border-radius:0; 
		padding:0; 
		overflow:visible; 
		cursor:pointer;
	} 
	body { 
		overflow:hidden 
	}
	#map {	
		position: absolute; 
		width: 100%; 
		height: 100vh;	
	}
	
	.float_r { 
		float: right; 
	}
	.clearfix:after { 
		content: ''; 
		display: block;	
		clear: both; 
	}
	
	
	
	.left-side { 
		position: absolute; 
		width: 270px; 
		top: 100px;
		height: 96vh; 
		z-index: 20; 
		background-color: #fdfdfd;
	}
	.side__open { 
		position: absolute;
	    width: 28px;
	    height: 70px;
	    top: 40%;
	    z-index: 10;
	    border: 0px;
	    /* box-shadow: 1px 0px 3px 0px rgb(58 98 120 / 14%); */
	}
	.left_open {
		left: 270px; 
	}
	.right_open {
		right: 290px;
	}
	
	.schedule-info {
	    padding-top: 10px;
	    width: 100%;
	    height: 60px;
	    margin: 1em auto;
	    text-align: center;
	    display: flex;
	    flex-direction: column;
	}
	.schedule_day_num {
		font-size: 25px;
	}
	.schedule_day_date {
	    padding-top: 10px;
	}

	.schedule-area {
	    height: 70%;
	}
	.schedule-list { 
		list-style-type: none; 
		margin: 0 auto; 
		width: 80%; 
		overflow-y: auto;
		max-height: 72vh;
		margin-top: -2px;
	}
	.schedule { 
		margin: 0 3px 5px 3px; 
		padding: 0.4em 1.5em; 
		font-size: 1.0em; 
		height: 18px; 
		text-align: center;
		border: 0.12em solid #7285bd;
	    background-color: #fff;		
	}
	
	.schedule-del_box {
	    position: absolute;
	    width: 100%;
	    height: 50px;
	    padding-top: 10px;
	    margin: 0.5em auto;
	    text-align: center;
	    bottom: 70px;
	}
	.schedule__del { 
		position:relative; 
		height: 90%; 
		background: inherit ; 
		border:none; 
		box-shadow:none; 
		border-radius:0; 
		padding:0; 
		overflow:visible; 
		cursor:pointer; 
	    color: #19255c;
	}
	.schedule__all_del {
	    height: 35px;
	    width: 76%;
	    font-size: 15px;
	    text-align: center;
	    background-color: #fff;
	    border: 0.13em solid #7285bd;
	}
	
	
	
	
	.right-side {
		position: fixed;
		right: 0;
		top: 100px;
		height: 100vh;
		width: 290px;
		background: #f1ecec;
		z-index: 10;
	}
	
	.right-side_header {
		position: relative;
	    height: 94px;
	    padding: 20px 20px 2px;
	    background-color: #b4d6f1;
	}
	
	.place-area {
		overflow-y: auto;
		max-height: 72vh;
		margin-top: -2px;
	}
	
	.place-section {
		position: relative;
	    padding: 9px 6px 8px;
	    margin-top: 4px;
	    background-color: #fff;
	}
	
	.place-section:first-child {
		border-top: 0 none;
	}
	
	.place-section__title {
		padding: 14px 12px 7px;
	}
	
	.place-section__title:after {
	    display: block;
	    visibility: hidden;
	    height: 0;
	    font-size: 0;
	    clear: both;
	    content: '';
	}
	
	.place-list {
		display: flex;
		flex-direction: column;
	}
	
	.place {
		display:  flex;
		align-items: center;
		position: relative;
	    padding: 18px 14px 20px;
	    border-top: 1px solid #eee;
	}
	
	.place:first-child {
	    border-top: 0 none;
	}
	
	.place__img {
		display:  flex;
		justify-content: center;
		align-items: center;
		word-break: keep-all;
		width: 80px;
		height: 80px;
		border:  1px solid #888;
	}
	.place__img img {
		width: 100%;
		height: 100%;
		object-fit: contain;
	}
	
	.place-info {
		display: flex;
		flex-direction: column;
		padding-left: 20px;
	}
	
	.place_info_option_box {
	    border: 1px solid;
	    margin-top: 19px;
	    text-align: center;
	    height: 50px;
	    width: 222px;
	    display: flex;
	    align-items: center;
	    justify-content: space-evenly;
	    color: #4b89b7;
	}
	.place_info_option {
	    width: 50px;
	    height: 30px;
	    top: 10px;
    }
	.place_info_option:last-child {
	    border: 0 none;
	    padding: 0;
    }
	
	.place__title {
		
	}
	.place__option-box {
	    padding-top: 10px;
    }
	
	.ctgr-box {
		width: 100%;
	    display: grid;
	    grid-template-columns: repeat(3, 1fr);
	    grid-gap: 5px;
	}
	
	.ctgr {
		border: 0;
	    text-align: center;
	    padding: 6px 15px;
	    border-radius: 7px;
	    box-shadow: 0 2px 1px 0 rgb(28 91 114 / 32%);
	    background-color: #ffffff;
	}
	.search-box {
		display: flex;
	    top: 0;
	    left: 0;
	    right: 0;
	    width: 253px;
	    height: 44px;
	    border-radius: 3px;
	    background-color: #fff;
	    box-shadow: 0 2px 1px 0 rgb(28 91 114 / 32%);
	    position: flex;
	    margin-bottom: 10px;
	    align-items: center;
	}
	.search__txt {
		width: 180px;
	    height: 19px;
	    padding: 16px 16px 15px;
	    border: 0 none;
	    font-weight: bold;
	    font-size: 16x;
	    line-height: 19px;
	    background-color: transparent;
	    outline: 0;
	}
	.search__del {
		width: 30px;
	    font-size: 16px;
	    color: #888c8e;
	    margin-right: 10px;
	}
	.main-top_area {
	    display: flex;
	    position: absolute;
	    left: 300px;
	    top: 30px;
	    z-index: 3;
	    height: 25px;
	    gap: 10px;
	}
	
	.main-select_box select {
		height: 100%;
	}
	
	.schedule_date {
	    border: 1px solid #5d7c95ab;
	    background-color: #fff;
	}
	.frm_input {
	    height: 20px;
	    width: 70px;
	    border: 0px none;
	    text-align: center;
	}
	.schedule_day, .schedule_group {
	    height: 100%;
	    border: 1px solid #5d7c95ab;
	}
	.main-bottom-area {
	    position: fixed;
	    margin: 0 auto;
	    bottom: 20px;
	    width: 100%;
	    height: 50px;
	    z-index: 5;
    }
    .schedule_all_view_box {
	    width: 170px;
	    margin: auto;
	    height: 50px;
	}
	
	.schedule_all_view_button {
	    width: 100%;
	    height: 100%;
	    font-size: 17px;
	    background-color: #fff;
	    border-radius: 7px;
	    box-shadow: 0px 1px 1px 1px rgb(28 91 114 / 61%);
	    border: 0px none;
    }
    
	
	
	.main {
	    position: relative;
	}
	
	.go_schedule_area_box {
	    position: absolute;
	    width: 100%;
	    height: 100vh;
	    background-color: #11141a80;
	    z-index: 20;
	    /* display: none; */
	}
	.go_schedule_area {
	    background-color: #fff;
	    height: 700px;
	    width: 1200px;
	    padding: 0 30px;
	    margin: auto;
	    margin-top: 100px;
	    z-index: 50;
	    position: relative;
	}
	.go_schedule_left {
	    position: absolute;
	    top: 50%;
	    left: 10px;
	}
	.go_schedule_right {
	    position: absolute;
	    top: 50%;
	    right: 10px;
	}
	
	.go_schedule_top {
	    display: flex;
	    justify-content: space-between;
	    padding: 20px;
	}

	.go_schedule_contnt {
	    display: grid;
	    grid-template-columns: repeat(5, 1fr);
	    grid-gap: 10px;
	}
	
	.go_scheduel_day_box {
	    position: relative;
	    height: 650px;
	}
	
	.chedule_button {
	    height: 31px;
	    font-size: 15px;
	    text-align: center;
	    color: #fff;
	    background-color: #63aecf;
	    border-radius: 7px;
	    border: 0px;
	    padding: 0 7px;
	    margin: 0 5px;
	}
	
	
	
	.place_review_box { 
		width: 600px; margin: auto; border: 1px solid #98aab9;
		padding: 20px 20px 20px 20px; background-color: #fff;
		position: absolute; top: 225px; right: 290px; z-index: 30; 
	    max-height: 400px;
	    overflow-y: auto;	
	}
	.place_review_title_box {
	    padding-bottom: 15px;
	}
	.place_review_title {
	    font-size: 20px;
	}	
	.place_review_add {
	    width: 76px;
	    height: 28px;
	    border: 1px solid #73adda;
	    order: 1px solid;
	    margin: 0 15px;
	    font-size: 13px;
	    background-color: #ffffff;
	    color: #4f7fa4;
	}
	.place_x { 
		float: right;
		width: 20px; 
	}
	
	
	.review_item{
		height: 50%;
	    padding: 5px;
	    padding-bottom: 20px;
	    border-bottom: 1px solid #9dbad1;
	    margin-bottom: 20px;
    }
    .review_item:last-child{
	    height: 50%;
	    padding: 5px;
	    padding-bottom: 20px;
	    border: 0px none;
	    margin: 0px;
    }
    .review_x { 
		float: right;
		width: 20px; 
	}
	.review_img_box {
		display: flex;
	    padding-bottom: 0px;
	    margin-bottom: 15px;
	}
	.review__img { 
		width: 120px;
	    height: 120px;
	    margin-right: 8px;
		padding-bottom:0px; 
	}
	.review_info {
	    padding-bottom: 15px;
	}
	.review_option_box {
		float: right;
	}
	
	.review_add_back {
	    float: right;
	    padding-right: 10px;
	}
	.review_add_text {
	    width: 90%;
	    height: 100px;
	    margin-bottom: 15px;
	}
	.add_img_title {
	    font-size: 15px;
	    display: flex;
	    flex-direction: column;
	    padding-bottom: 5px;
	}
	.add_img_content {
	    font-size: 5px;
	    padding: 7px;
	}
	.add_img_option>button {
	    border: 1px solid #767676;
	    padding: 3px;
	    border-radius: 3px;
	    font-size: 11px;
	}
	.result {
	    float: right;
	}
	
	
	
	#place_info_box { 
		width: 600px; margin: auto; border: 1px solid #496c88;
		padding: 20px 20px 20px 20px; background-color: #fff;
		position: absolute; top: 225px; right: 290px; z-index: 30; 
	}
	#x { float: right; width: 20px; }
	#placeimg { width: 300px; height: 300px; margin-bottom: 5px; }
	.descimg { width:65px; height:65px; margin-right:8px; padding-bottom:0px; }
	#placedesc { float: right; }
	#placedetail { width: 270px; }
	#placename { margin-bottom: 10px; }
	#placeinfo { margin-top: 20px; line-height:1.7; }
	
	
	
	.display_none {
		display : none;
	}
	
    
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	window.onload = function(){
		const goMap = document.querySelector('.go_map'); 
		const goSchedule = document.querySelector('.go_schedule');	
		const scheduleBox = document.querySelector('.go_schedule_area_box');
		
		const placeInfoOpen = document.querySelector('.place__info');
		const placeInfoClose = document.querySelector('.place_x');
		const placeInfoBox = document.querySelector('#place_info_box');
		

		
		const reviewViewOpen = document.querySelector('.place__review');
		const reviewAddOpen = document.querySelector('.review_add');
		const reviewAddBack = document.querySelector('.review_add_back');
		const reviewClose = document.querySelector('.review_x');
		const reviewViewBox = document.querySelector('.review_view_box');
		const reviewAddBox = document.querySelector('.review_add_box');
		
		// 지도로 돌아가기를 누르면 디스플레이 끄기 클래스 추가 
		goMap.addEventListener('click', function() {
			scheduleBox.classList.add('display_none');
		});
		
		// 내 일정보기를 누르면 디스플레이 끄기 클래스 삭제
		goSchedule.addEventListener('click', function() {
			scheduleBox.classList.remove('display_none');
		});
		
		
		// 장소 정보 버튼을 누르면 디스플레이 클래스 삭제 (보이기)
		placeInfoOpen.addEventListener('click', function() {
			placeInfoBox.classList.remove('display_none');
		});
		
		// 장소 보기창 - x버튼을 누르면 디스플레이 클래스 추가 (가리기)
		placeInfoClose.addEventListener('click', function() {
			placeInfoBox.classList.add('display_none');
		});
		
		

		// 장소 리뷰 버튼 누르면 디스플레이 보이기 (리뷰보기 띄우기)
		reviewViewOpen.addEventListener('click', function() {
			reviewViewBox.classList.remove('display_none');
		});
		
		// 리뷰추가 버튼 - 리뷰 display 없애기, 리뷰add 띄우기 (리뷰보기 -> 리뷰작성 화면으로)
		reviewAddOpen.addEventListener('click', function() {
			reviewViewBox.classList.add('display_none');
			reviewAddBox.classList.remove('display_none');
			
		});
		
		// 작성취소 버튼 - 리뷰작성 display없애기, 리뷰 view 띄우기 (리뷰 작성->보기화면으로)
		reviewAddBack.addEventListener('click', function() {
			reviewViewBox.classList.remove('display_none');
			reviewAddBox.classList.add('display_none');
		});
		
		// 리뷰 x버튼을 누르면 디스플레이 클래스 추가 (리뷰보기/작성 없애기)
		reviewClose.addEventListener('click', function() {
			reviewViewBox.classList.add('display_none');
			reviewAddBox.classList.add('display_none');
		});
	}
	
	$( function() {
		$( ".schedule-list" ).sortable();
		// 스케줄 드래그앤 드롭 함수
	} );
	
	function scheDel() {
		alert('일정 삭제 이벤트 발생');
		// 스케줄 삭제 X버튼 함수
	}
	function scheAllDel() {
		alert('일차 전체 삭제 이벤트 발생');
		// Day 일차 전체삭제 버튼 함수
	}
	
	function removeDa() { // 시작일자 선택 시 종료일자 컨트롤 활성화
		document.getElementById('edate').removeAttribute('disabled');	
	}
	
	function limitDate() { // 종료일자 값 제한
		var sdate = document.getElementById('sdate');
		var edate = document.getElementById('edate');
		var strDate1 = sdate.value;
		var strDate2 = edate.value;
		var arr1 = strDate1.split('-');
		var arr2 = strDate2.split('-');
		var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
		var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
		var diffDay = (dat2 - dat1) / ( 24 * 60 * 60 * 1000);
		
		if ( edate.value < sdate.value ) { // 종료일이 시작일보다 이를 경우
			alert('여행 종료일은 시작일 이후로 입력해주세요');
			edate.value = sdate.value;
		} else if ( diffDay > 9 ) { // 10일 이상일 경우
			alert('트레버 여행 일정은 최대 10일까지 가능합니다.');
			edate.value = dat2.getFullYear() + "-" + dat2.getMonth() + "-" + (dat1.getDate() + 9) ;
		}
	}
	
	function setDay(sdate, edate, target) {	// 선택한 날짜를 계산하여 day(일차) select의 option을 변경
		
		var strDate1 = sdate;
		var strDate2 = edate;
		var arr1 = strDate1.split('-');
		var arr2 = strDate2.split('-');
		var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
		var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
		var diffDay = (dat2 - dat1) / ( 24 * 60 * 60 * 1000);
		
		for (var i = target.options.length -1; i >= 0; i--) {
			target.options[i] = null;
		}	// 기존 day 삭제
		
		if ( sdate != "" && edate != "" ) {
			for ( var i = 0; i < diffDay + 1; i++) {
				target.options[i] = new Option("day" + (i+1) + "", i+1);
			}
			target.options[0].selected = true;
		}
	}
	
	function enterkey(searchKeyword) {
		if (window.event.keyCode == 13) {
			alert(searchKeyword);
			placeSearchChange(searchKeyword);
	    }
	}
	
	function schDel() {
		alert('검색어 삭제 이벤트 발생');
		// 검색어 삭제 X버튼 함수
	}
	function test() {
		alert('버튼 동작 확인!');
	}
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
    function swapImg(img) {
		var big = document.getElementById("placeimg");
		big.src = "../../file/img/" + img;
	}

	function placeCategoryChange(placeCategory) {
	// 카테고리 변경
		$.ajax({
			type : "POST",
			url : "/traverSite/placeList",
			data : {
				"placeCategory" : placeCategory, 
			},
			success : function(placeList) {
				if (placeList.size() == 0) {
					alert("카테고리 변경에 실패했습니다.\n다시 시도하세요.");
				}
			}
		});
	}
	
	function placeSearchChange(searchKeyword) {
	// 검색어로 장소 리스트 변경
		$.ajax({
			type : "POST",
			url : "/traverSite/placeList",
			data : {
				"searchKeyword" : searchKeyword, 
			},
			success : function(placeList) {
				if (placeList.size() == 0) {
					alert("검색에 실패했습니다.\n다시 시도하세요.");
				}
			}
		});
	}
	
</script>
</head>
<body>
<%@ include file="../../cni/header.jsp" %>
<!-- 좌측 사이드박스 -->
<form action="#">
<div class="left-side open">
	<div class="schedule-info">
		<span class="schedule_day_num">Day N</span>
		<span class="schedule_day_date">2022-09-18</span>
	</div>
	<div class="schedule-area">
		<ul class="schedule-list sortable">
			<li class="schedule ui-state-default">제주호텔
				<button type="button" class="schedule__del float_r" value="X" onclick="scheDel()">X</button>
				<input type="hidden" />
			</li>
			<li class="schedule ui-state-default">제주음식점
				<button type="button" class="schedule__del float_r" value="X" onclick="scheDel()">X</button>
				<input type="hidden" />
			</li>
		</ul>
	</div>
	<div class="schedule-del_box">
		<input type="button" class="schedule__all_del" value="전체 삭제" onclick="scheAllDel()"/>
	</div>
	<div>
		<button class="side__open left_open"><img src="../../file/img/open.png" class="side__open_img"></button>
	</div>
</div>
<!-- //좌측 사이드 박스 -->


 

<!-- 우측 사이드 박스 -->
<div class="right-side open">
	<div class="right-side_header">
		<div class="search-box">
			<input type="text" class="search__txt" placeholder="검색어를 입력하세요" onkeyup="enterkey(this.value)"/>
			<button class="schedule__del search__del" value="X" onclick="schDel()">X</button>
		</div>
		<div class="ctgr-box">
		<!-- 검색 시, 보여줘야 할 00 개수 여부에따라 버튼 활성화/비활성화 -->
		<!-- js를 통해 버튼에 선택에 따라 btnSelect클래스 생성/삭제, select 클래스가있으면 배경색상변경 -->
		<!-- 검색값 여부에  따라 btnNone 클래스 생성/삭제, btnNone 클래스가 있으면 버튼 비활성화 (=onclick 이벤트 삭제) -->
			<button name="placeCategory" value="1" class="ctgr btnSelect" onclick="placeCategoryChange(this.value)">숙소</button>
			<button name="placeCategory" value="2" class="ctgr" onclick="placeCategoryChange(this.value)">음식점</button>
			<button name="placeCategory" value="3" class="ctgr btnNone" onclick="placeCategoryChange(this.value)">관광지</button>
		</div>
	</div>
	<div class="place-area">
	<% if (isHaveLodging) { %>
		<!-- 숙소 -->
		<div class="place-section">
		<% //if (카테고리 분류가 전체보기면)%>
			<div class="place-section__title">숙소</div>
		<% //} %>
			<div class="place-list">
		<% 
		for(int i = 0; i < placeList.size() ; i ++) { 
			PlaceInfo pi = placeList.get(i);
			if (pi.getPi_ctgr().equals("1")) {
		%>
				<div class="place">
					<div class="place__img">
						<img src="<%=pi.getPi_img1() %>" alt="<%=pi.getPi_name() %>섬네일 이미지" />
					</div>
					<div class="place-info">
						<div class="place__title"><%=pi.getPi_name() %></div>
						<div class="place__option-box">
							<button class="place__option place__info">정보</button>
							<button class="place__option place__add">추가</button>
							<button class="place__option place__review">리뷰</button>
							<button class="place__option place__love">찜</button>
						</div>
					</div>
				</div>
		<% 	
			} 
		}
		%>
			</div>
		</div>
		<!-- //숙소 -->
	<% } %>
	<% if (isHaveRestaurant) {  %>
		<!-- 음식점 -->
		<div class="place-section">
		<% //if (카테고리 분류가 전체보기면)%>
			<div class="place-section__title">음식점</div>
		<% //} %>
			<div class="place-list">
		<% 
		for(int i = 0; i < placeList.size() ; i ++) { 
			PlaceInfo pi = placeList.get(i);
			if (pi.getPi_ctgr().equals("2")) {
		%>
				<div class="place">
					<div class="place__img">
						<img src="#" alt="" />
					</div>
					<div class="place-info">
						<div class="place__title"><%=pi.getPi_name() %></div>
						<div class="place__option-box">
							<button class="place__option place__info">정보</button>
							<button class="place__option place__add">추가</button>
							<button class="place__option place__review">리뷰</button>
							<button class="place__option place__love">찜</button>
						</div>
					</div>
				</div>
		<% 	
			} 
		}
		%>
			</div>
		</div>
		<!-- //음식점 -->
	<% } %>
	<% if (isHaveTourist) {  %>
		<!-- 관광지 -->
		<div class="place-section">
		<% //if (카테고리 분류가 전체보기면)%>
			<div class="place-section__title">관광지</div>
		<% //} %>
			<div class="place-list">
		<% 
		for(int i = 0; i < placeList.size() ; i ++) { 
			PlaceInfo pi = placeList.get(i);
			if (pi.getPi_ctgr().equals("3")) {
		%>
				<div class="place">
					<div class="place__img">
						<img src="#" alt="" />
					</div>
					<div class="place-info">
						<div class="place__title"><%=pi.getPi_name() %></div>
						<div class="place__option-box">
							<button class="place__option place__info">정보</button>
							<button class="place__option place__add">추가</button>
							<button class="place__option place__review">리뷰</button>
							<button class="place__option place__love">찜</button>
						</div>
					</div>
				</div>
		<% 	
			} 
		}
		%>
			</div>
		</div>
		<!-- //관광지 -->
	<% } %>
	</div>
	<button class="side__open right_open"><img src="../../file/img/open.png" class="side__open_img"></button>
</div>

<!-- //우측 사이드 박스 -->



<!-- 컨테이너 -->
<div class="main">
	<div class="main-top_area">
		<div class="schedule_date">
			 <input type="date" class="" id="sdate" name="sdate" onchange="removeDa();">~
			 <input type="date" id="edate" name="edate" disabled onchange="limitDate(); setDay(this.form.sdate.value, this.value, this.form.schedule_day);">
		</div>
		<div class="">
			<select name="schedule_day" class="schedule_day">
				<option value="" class="schedule_day1">일차 선택</option>
			</select>
			<select name="schedule_group" class="schedule_group" id="">
				<option value="1">전체보기</option>
				<option value="2">추가한 장소</option>
				<option value="3">찜한 장소</option>
				<option value="4">추가 + 찜한 장소</option>
			</select>
		</div>
	</div>
	<div class="main-bottom-area">
		<div class="schedule_all_view_box">
			<input type="button" class="schedule_all_view_button go_schedule" value="일정 보러가기" />
		</div>
	</div>
	<!-- 일정 보러가기 -->
	<div class="go_schedule_area_box display_none">
		<div class="go_schedule_area">
			<div class="go_schedule_left">
				<button><img src="" alt="&lt;" /></button>
			</div>
			<div class="schedule_item">
				<div class="go_schedule_top">
					<input type="text" class="schedule_title" placeholder="일정명을 입력하세요" />
					<div class="chedule_button_box">
						<input type="button" class="chedule_button go_map" value="지도로 돌아가기"/>
						<input type="button" class="chedule_button save_schdule" value="내 일정 등록"/>
					</div>
				</div>
				<div class="go_schedule_contnt-area">
					<div class="go_schedule_contnt">
						<div class="go_scheduel_day_box">
							<div class="schedule-info">
								<span class="schedule_day_num">Day 1</span>
								<span class="schedule_day_date">2022-09-18</span>
							</div>
							<div class="schedule-area">
								<ul class="schedule-list sortable">
									<li class="schedule ui-state-default">제주호텔
										<button type="button" class="schedule__del float_r" value="X" onclick="scheDel()">X</button>
										<input type="hidden" />
									</li>
									<li class="schedule ui-state-default">제주음식점
										<button type="button" class="schedule__del float_r" value="X" onclick="scheDel()">X</button>
										<input type="hidden" />
									</li>
								</ul>
							<div class="schedule-del_box">
								<input type="button" class="schedule__all_del" value="전체 삭제" onclick="scheAllDel()"/>
							</div>
							</div>
						</div>
						<div class="go_scheduel_day_box">
							<div class="schedule-info">
								<span class="schedule_day_num">Day 2</span>
								<span class="schedule_day_date">2022-09-19</span>
							</div>
							<div class="schedule-area">
								<ul class="schedule-list sortable">
									<li class="schedule ui-state-default">호텔신라
										<button type="button" class="schedule__del float_r" value="X" onclick="scheDel()">X</button>
										<input type="hidden" />
									</li>
									<li class="schedule ui-state-default">음식점신라
										<button type="button" class="schedule__del float_r" value="X" onclick="scheDel()">X</button>
										<input type="hidden" />
									</li>
								</ul>
							<div class="schedule-del_box">
								<input type="button" class="schedule__all_del" value="전체 삭제" onclick="scheAllDel()"/>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="go_schedule_right">
				<button><img src="" alt="&gt;" /></button>
			</div>
		</div>
	</div>
	<!-- //일정 보러가기 -->
</div>
</form>
<!-- //컨테이너 -->


<%@ include file="place_review.jsp" %>
<!-- //리뷰 보기 -->

<%@ include file="place_review_form.jsp" %>
<!-- //리뷰작성 -->

<%@ include file="place_info.jsp" %>
<!-- //장소보기 -->



<!-- 지도 -->
<div id="map">
</div>
<!-- //지도 -->
<!-- services와 카카오지도 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b05cef42f58551f118588eb3f26ff67&libraries=services"></script>
<script>
	var mapContainer = document.getElementById('map'),  // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(33.3580, 126.57000), // 지도의 중심좌표
	    level: 9 // 지도의 확대 레벨
	};
	
	window.onresize = function(event){ // 윈도우 크기 size 변경되면 
	var latlng = map.getCenter(); 
	var mainPoint = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()); // 중심위치 받아와서
	map.relayout();
	map.setCenter(mainPoint); // 윈도우 크기에 맞춰 중심위치 변경
	}
	
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	<% 
	for (int i = 0; i < placeList.size(); i++ ) {
	PlaceInfo pi = placeList.get(i);
	%>
	var position<%=pi.getPi_id()%> = new kakao.maps.LatLng<%=pi.getPi_coords()%>;
	
	var marker = new kakao.maps.Marker({
	    position: position<%=pi.getPi_id()%>
	});
	marker.setMap(map);
	
	
	<% } %>
</script>
</body>
</html>
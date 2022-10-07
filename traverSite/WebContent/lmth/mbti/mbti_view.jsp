<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 글 보기</title>
<style>
.container-default_box { position: relative; }
.btn { 
	height: 20px;
	background: inherit ; border: none; box-shadow: none; border-radius: 0; 
	padding: 0; overflow: visible; cursor: pointer;
	float: right; margin-right: 10px; text-align: middle;
}
#section1 { width: 1000px; margin: 50px auto; padding-bottom: 50px; position: relative; }
#title { font-size: 25px; font-weight: bold; }
#goodicon { width: 30px; vertical-align: middle; margin-right: 5px;}
.ctt_font { font-size: 16px; line-height: 1.5; }
#lastup { font-size: 13px; }
hr { margin: 15px 0;}
#schname, #placename { font-size: 20px; font-weight: bold; }
#schdetail { font-size: 15px; }
#dayselect { width: 100px; height: 30px; }
#map { border: 1px solid black; }
#contentbox { width: 100%; margin-bottom: 20px;  }
#update, #delete { float: left; margin-right: 5px; }
#list { float: right; top: -500px;  }


#section2 { 
	width: 600px; margin: auto; border: 1px solid black; 
	padding: 20px 20px 20px 20px; background-color: #fff;
	position: absolute; top: 225px; left: 280px;   
}
#x { float: right; width: 20px; }
#placeimg { width: 300px; height: 300px; margin-bottom: 5px; }
.descimg { width:65px; height:65px; margin-right:8px; padding-bottom:0px; }
#placedesc { float: right; }
#placedetail { width: 270px; }
#placename { margin-bottom: 10px; }
#placeinfo { margin-top: 20px; line-height:1.7; }

.display_none { display: none; }
</style>
<script>
window.onload = function(){
	const goodbtn = document.querySelector('#goodbtn');
	const goodicon = document.querySelector('#goodicon');
	const pin = document.querySelector('#pin');
	const section2 = document.querySelector('#section2');
	const x = document.querySelector('#x');
	
	goodbtn.addEventListener('click', function() {
		goodicon.src = "../../file/img/good2.png";
	});
	
	pin.addEventListener('click', function() {
		section2.classList.remove('display_none');
	});
	
	x.addEventListener('click', function() {
		section2.classList.add('display_none');
	});
}
</script>
<script>
function postDel() {
	confirm("게시물을 삭제하시겠습니까?")
}
</script>
<script>
	function swapImg(img) {
		var big = document.getElementById("placeimg");
		big.src = "../../file/img/" + img;
	}
</script>
</head>
<body>
<%@ include file="../../cni/header.jsp" %>
<div class="container">
   <div class="container-default_box">
   		<div id="section1">
			<p id="title">글 제목</p><br> <!-- post_proc_up? -->
			<button type="button" class="btn"><img src="../../file/img/" id="report" alt="신고"></button>
			<button type="button" class="btn"><img src="../../file/img/" id="interest" alt="관심등록"></button>
			<button type="button" class="btn" id="goodbtn"><img src="../../file/img/good1.png" id="goodicon" alt="좋아요"><span id="goodcnt"> 50</span></button>
			<span class="ctt_font" id="writer">작성자명(ENTP)</span><br>
			<span class="ctt_font" id="lastup">마지막 수정 : <% %></span>
			<hr>
			<p id="schname">일정이름<% %></p><br>
			<span class="ctt_font" id="schdetail">상세일정<% %></span>
			<br>
   			<hr>
   			<select id="dayselect">
   				<option value="day1">1일차</option>
   				<option value="day1">여기두 나중에 수정</option>
   			</select><button type="button" class="btn" id="pin">지도 핀</button><br><br>
			<div id="map" style="width:100%;height:350px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2b05cef42f58551f118588eb3f26ff67&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div ID 넣기
			    mapOption = { 
			        center: new kakao.maps.LatLng(33.3880, 126.60000), // 지도의 중심좌표 : 제주도로 설정해놨어
			        level: 10 // 지도의 확대 레벨 : 줄이거나 늘리면댐
			    };
			
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			</script>
			<br>
			<div id="contentbox">
   				<span class="ctt_font" id="content">일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)일정 소개가 입력되는 곳 (Content)</span>
   			</div>
   			<hr>
   			<a href="mbti_form_up.jsp"><button type="button" class="btn" id="update"><img src="../../file/img/" id="update" alt="수정"></button></a>
   			<button type="button" class="btn" id="delete" onclick="postDel();"><img src="../../file/img/" id="delete" alt="삭제"></button>
   			<a href="mbti_list.jsp"><button type="button" class="btn" id="list"><img src="../../file/img/" id="list" alt="목록"></button></a>
   		</div>
   		<div class="display_none" id="section2">
   			<img src="../../file/img/silla1.jpg" id="placeimg">
			<div id="placedesc">
			<img src="../../file/img/x.png" id="x"><br>
				<br>
				<div id="placedetail">
				<span id="placename">신라 호텔</span><br><br>
				<div id="placeinfo">
					<span>
					번호 : 064 – 123 - 4567<br>
					위치 : 제주 특별자치도 제주시 도련일동 1789-2<br>
					홈페이지 : jeju.co.kr<br>
					주차 시설 완벽, 주변 관광지와 가까움<br>
					주변에 맛집도 많음<br>
					</span>
				</div>
				</div>
			</div>
			<img src="../../file/img/silla1.jpg" id="placeimg1" class="descimg" onclick="swapImg('silla1.jpg');">
			<img src="../../file/img/silla2.jpg" id="placeimg2" class="descimg" onclick="swapImg('silla2.jpg');">
			<img src="../../file/img/silla3.jpg" id="placeimg3" class="descimg" onclick="swapImg('silla3.jpg');">
			<img src="../../file/img/silla4.jpg" id="placeimg4" class="descimg" onclick="swapImg('silla4.jpg');">
		</div>
   </div>
</div>
<%@ include file="../../cni/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천 글 수정</title>
<style>
.container-default_box { position: relative; }
#section1 { width:1000px; margin: 50px auto; position: relative; }
.btn {
	background: inherit ; border: none; box-shadow: none; border-radius: 0; 
	padding: 0; overflow: visible; cursor: pointer;
	float: right; margin-right: 10px;
}
.sub_font { font-size: 19px; font-weight: bold; }
input[type="text"] {
	hegith: 30px; font-size: 16px; margin-left:10px;
	border: none; border-bottom: 1px solid #888;
}
hr { margin: 15px 0;}
#map { border: 1px solid #888; }
textarea { border: 1px solid #888; width: 100%;}
#dayselect, #schselect { width: 100px; height: 30px; } 
#content { padding: 5px; lint-height: 1.5; }
#ctcnt { float: right; }
#upbtn { margin: 16px 450px 40px 0; right: }
</style>
<script src="../../file/js/jquery-3.6.1.js"></script>
</head>
<body>
<%@ include file="../../cni/header.jsp" %>
<div class="container">
	   <div class="container-default_box">
	   		<div id="section1">
				<label for="title" class="sub_font"> 제목 </label><input type="text" placeholder="<% %>" size="50" autofocus>
				<hr>
				<label for="sch_name" class="sub_font"> 일정 </label><input type="text" placeholder="<% %>" size="20" readonly><br>
	   			<br>여기는 나중에~~<br><br>
	   			<select id="dayselect">
	   				<option value="day1">1일차</option>
	   				<option value="day1">여기두 나중에 수정</option>
	   			</select><br><br>
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
	   			<hr>
	   			<label for="content" class="sub_font">일정소개</label><br><br>
	   			<textarea id="content" cols="117" rows="5"></textarea>
	   			<span id="ctcnt"><span id="count">0</span> / 1000</span>
	   			<br><br>
	   			<a href="mbti_view.jsp"><button type="button" class="btn" id="upbtn"><image src="../../file/img/" alt="수정하기"></button></a>
	   		</div>
	   </div>
</div>
<%@ include file="../../cni/footer.jsp" %>
</body>
</html>
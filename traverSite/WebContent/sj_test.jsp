<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.*"%>
<%@ page import="vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
/* 	function addPlace(place) {
		console.log(place);
        let piid = place.getAttribute("value");
        console.log(piid);
        let piname = place.parentElement.parentElement.querySelector(".place__title").innerText;
        console.log(piname);
        
      $.ajax({
         type : "POST",
         url : "/traverSite/test",
         data : {
            "piid" : piid,
            "piname" : piname
         },
         success : function(v) {
            if(v == 0) {
               console.log("장소 추가 실패");
            }
         }
      })
	} */
	
	window.addEventListener("load", function() {
		var addBtnList = document.querySelectorAll(".place__add");
		for (var i = 0; i < addBtnList.length; i++) {
			var btn = addBtnList.item(i);

			btn.addEventListener("click", function(event) { // 각 버튼에 클릭 eventListener 추가
				let btn = event.currentTarget; // 이벤트가 발생한 '현재 엘리먼트'을 가져온다
				let piid = btn.getAttribute("value");
				console.log(piid);
				
				let piname = btn.parentElement.parentElement.querySelector('.place__title').innerText;
				console.log(piname);

				$.ajax({
					type : "POST",
					url : "/traverSite/test",
					data : {
						"piid" : piid,
						"piname" : piname
					},
					success : function(v) {
						if (v == 0) {
							console.log("장소 추가 실패");
						}
					}
				})
			});
		}
	})
	

</script>
<body>
	<%
		ArrayList<PlaceInfo> addPlaceList = (ArrayList<PlaceInfo>) session.getAttribute("addPlaceList"); // 세션에있는 어레이리스트 값 받아오기
		for (int i = 0; i < addPlaceList.size(); i++) {
			// 장소 이름 뽑아낼 반복문! 
			String piname = addPlaceList.get(i).getPi_name();
			String piid = addPlaceList.get(i).getPi_id();
	%>
	<h2><%=piname%></h2>
	<h2><%=piid%></h2>
	<%
		}
	%>
		<!-- 장소 추가하는 버튼! 오른쪽 사이드박스의 추가버튼. 누르면 ajax로 value값을 보내고, 그 값을 세션에 저장!-->
	<div>
		<div class="place__title">마초그릴</div>
		<div>
			<button value="1111" class="place__add" >추가</button>
		</div>
	</div>
	<div>
		<div class="place__title">제주항</div>
		<div>
			<button value="2222" class="place__add" >추가</button>
		</div>
	</div>
	<div>
		<div class="place__title">신라호텔</div>
		<div>
			<button value="3333" class="place__add" onclick="addPlace(this)">추가</button>
		</div>
	</div>
	<div>
		<div class="place__title">음식점</div>
		<div>
			<button value="4444" class="place__add" onclick="addPlace(this)">추가</button>
		</div>
	</div>
	<div>
		<div class="place__title">관광지</div>
		<div>
			<button value="abcd" class="place__add" onclick="addPlace(this)">추가</button>
		</div>
	</div>

</body>
</html>
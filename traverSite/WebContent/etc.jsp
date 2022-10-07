<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	
	function placePiid(piid) { // ajax로 컨트롤에 보낸다!
	// 여기에 document. 이런거해서 '선택한 Day' 이런것들 추가로 받아와서 더 보낼 예정!
		let piname1 = document.queryselector("#placeName").value;
	
		$.ajax({
			type : "POST",
			url : "/traverSite/test",
			data : {
				"piid" : piid,
				"piname" : piname
			},
			success : function(v) {
				location.reload();
			}
		})
	}
</script>
<body>
<%
ArrayList<PlaceInfo> addPlaceList = (ArrayList<PlaceInfo>)session.getAttribute("addPlaceList"); // 세션에있는 어레이리스트 값 받아오기
for (int i = 0; i < addPlaceList.size(); i++) {
	// 장소 이름 뽑아낼 반복문! 
	String piname = addPlaceList.get(i).getPi_name();
	String piid = addPlaceList.get(i).getPi_id();
%>
	<h2><%=piname %></h2>
	<h2><%=piid %></h2>
<%
}
%>
<form action="">
<!-- 장소 추가하는 버튼! 오른쪽 사이드박스의 추가버튼. 누르면 ajax로 value값을 보내고, 그 값을 세션에 저장!-->
<button value="abcd" name="add123" id="addButton" onclick="placePiid(this.value)" >추가</button>
<span id="placeName1" value="제주항"></span>
<h2>안녕하세요 브런치 실험입니다. 브런치 얘기하니까 배가고프네요.</h2>
</form>

</body>
</html>
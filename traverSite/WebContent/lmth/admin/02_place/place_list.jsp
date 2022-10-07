<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
request.setCharacterEncoding("utf-8");
ArrayList<PlaceInfo> placeInfo = (ArrayList<PlaceInfo>)request.getAttribute("placeInfo");

AdminPlaceInfo adminPlaceInfo = (AdminPlaceInfo)request.getAttribute("adminPlaceList");

int cpage = adminPlaceInfo.getCpage(),psize = adminPlaceInfo.getPsize(),rcnt = adminPlaceInfo.getRcnt();
int spage = adminPlaceInfo.getSpage(),bsize = adminPlaceInfo.getBsize(),pcnt = adminPlaceInfo.getPcnt();

String schtype = adminPlaceInfo.getSchtype(), keyword = adminPlaceInfo.getKeyword();
String schargs = "", args = "";
if (schtype != null && !schtype.equals("") && keyword != null && !keyword.equals("")) {
	schargs = "&schtype=" + schtype + "&keyword=" + keyword;
	// 검색조건과 검색어가 있으면 검색관련 데이터들을 쿼리스트링으로 지정
}
args = "&cpage=" + cpage + schargs;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레버</title>
<link href="/traverSite/lmth/admin/file/css/reset.css" type="text/css" rel="stylesheet">
<link href="/traverSite/lmth/admin/file/css/style.css" type="text/css" rel="stylesheet">
<script src="/traverSite/lmth/admin/file/js/jquery-3.6.1.js"></script>
<script>
$(document).ready(function() {
	$("#chkAll").click(function() {
		if($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});

	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;

		if(total != checked) $("#chkAll").prop("checked", false);
		else $("#chkAll").prop("checked", true); 
	});
});


</script>
</head>
<body>
	<%@ include file="../cni/header.jsp"%>
	<div class="place_main">
		<div class="container">
			<div class="place_contents">
				<h2>장소 관리</h2>
				<div class="subP">
				<!-- 찾기 영역 -->
				<form action="" name="frm_place">
					<select name="schtype">
						<option value="name" <% if (schtype.equals("name")) { %>selected="selected" <% } %>>장소명</option>
						<option value="phone" <% if (schtype.equals("phone")) { %>selected="selected" <% } %>>번호</option>
						<option value="ctgr" <% if (schtype.equals("ctgr")) { %>selected="selected" <% } %>>분류</option>
						<option value="date" <% if (schtype.equals("date")) { %>selected="selected" <% } %>>등록일</option>
						<option value="addr1" <% if (schtype.equals("addr1")) { %>selected="selected" <% } %>>주소</option>
					</select> 
					<input type="text" name="keyword" placeholder="검색란" value="<%=keyword %>"> 
					<input type="submit" value="찾기">
				</form>
				<form action="placeFormIn" name="frm_place_svc" method="post">
					<ul>
						<li><span class="count">총 장소 수 : <span class="place_num"><%=rcnt %></span></span></li>
						<li><input type="button" value="장소 삭제" id="palceDel" onclick="location.href='placeProcDel'"></li>
						<li><input type="button" value="장소 추가" id="palceIn" onclick="location.href='/traverSite/lmth/admin/02_place/place_form_in.jsp';"></li>
					</ul>
				</form>
				</div>
			</div>
			<form action="" name="frm_place_table" method="post">
			<div class="place_table">
				<table>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" id="chkAll"></th>
							<th scope="col">장소명</th>
							<th scope="col">번호</th>
							<th scope="col">분류</th>
							<th scope="col">등록일</th>
							<th scope="col">주소</th>
							<th scope="col">관리</th>
						</tr>
					</thead>
					<tbody>
					<%
					if (placeInfo.size() > 0) {	
						for (int i = 0; i < placeInfo.size(); i++) {
							PlaceInfo pl = placeInfo.get(i);
								%>
								<tr align="center">
									<td><input type="checkbox" name="chk" value="<%=pl.getPi_id() %>"></td>
									<td><%=pl.getPi_name() %></td>
									<td><%=pl.getPi_phone() %></td>
									<td>
									<% if (pl.getPi_ctgr().equals("1")){ %>
									호텔
									<% } else if (pl.getPi_ctgr().equals("2")) { %>
									음식점
									<% } else {%>
									관광지
									<% } %>
									</td>
									<td><%=pl.getPi_date() %></td>
									<td><%=pl.getPi_addr1() %></td>
									<td><input type="button" value="수정" onclick="location.href='#'"></td>
								</tr>
								<%
						}
					} else {	// 글목록이 없으면
						out.println("<tr><td colspan='7' align='center'>");
						out.println("검색결과가 없습니다.</td></tr>");
					}
					%>
					</tbody>
				</table>
				<div class="num_list">
					<tr>
					<td>
					<%
					if (rcnt > 0) {	// 게시글이 있으면 - 페이징 영역을 보여줌
						String lnk = "adminPlaceList?cpage=";
						pcnt = rcnt / psize;
						if (rcnt % psize > 0)	pcnt++;	// 전체 페이지 수
					
						if (cpage == 1) {
							out.println("[처음]&nbsp;&nbsp;&nbsp;[이전]&nbsp;&nbsp;");
						} else {
							out.println("<a href='" + lnk + "1" + schargs + "'>[처음]</a>&nbsp;&nbsp;&nbsp;");
							out.println("<a href='" + lnk + (cpage - 1) + schargs + "'>[이전]</a>&nbsp;&nbsp;");
						}
					
						spage = (cpage - 1) / bsize * bsize + 1;	// 현재 블록에서의 시작 페이지 번호
						for (int i = 1, j = spage ; i <= bsize && j <= pcnt ; i++, j++) {
						// i : 블록에서 보여줄 페이지의 개수만큼 루프를 돌릴 조건으로 사용되는 변수
						// j : 실제 출력한 페이지 번호로 전체 페이지 개수(마지막 페이지 번호)를 넘지 않게 사용해야 함
							if (cpage == j) {
								out.println("&nbsp;<strong>" + j + "</strong>&nbsp;");
							} else {
								out.println("&nbsp;<a href='" + lnk + j + schargs + "'>" + j + "</a>&nbsp;");
							}
						}
					
						if (cpage == pcnt) {
							out.println("&nbsp;&nbsp;[다음]&nbsp;&nbsp;&nbsp;[마지막]");
						} else {
							out.println("&nbsp;&nbsp;<a href='" + lnk + (cpage + 1) + schargs + "'>[다음]</a>");
							out.println("&nbsp;&nbsp;&nbsp;<a href='" + lnk + pcnt + schargs + "'>[마지막]</a>");
						}
					}
					%>
					</td>
					</tr>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>
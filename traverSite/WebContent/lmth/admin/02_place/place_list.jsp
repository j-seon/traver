<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레버</title>
<link href="/traverSite/lmth/admin/file/css/reset.css" type="text/css" rel="stylesheet">
<link href="/traverSite/lmth/admin/file/css/style.css" type="text/css" rel="stylesheet">
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
					<select name="palacSel">
						<option value="장소명">장소명</option>
						<option value="번호">번호</option>
						<option value="분류">분류</option>
						<option value="등록일">등록일</option>
						<option value="주소">주소</option>
					</select> 
					<input type="text" name="" placeholder="검색란"> 
					<input type="button" value="찾기">
				</form>
					<ul>
						<li><span class="count">총 장소 수 : <span class="place_num">30개</span></span></li>
						<li><input type="button" value="장소 삭제" id="palceDel" onclick="confirm('장소를 삭제하시겠습니까?')"></li>
						<li><input type="button" value="장소 추가" id="palceIn" onclick="location.href='../placeFormIn';"></li>
					</ul>
				</div>
			</div>
			<div class="place_table">
				<table>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox"></th>
							<th scope="col">장소명</th>
							<th scope="col">번호</th>
							<th scope="col">분류</th>
							<th scope="col">등록일</th>
							<th scope="col">주소</th>
							<th scope="col">관리</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td><input type="checkbox"></td>
							<td>제주 호텔</td>
							<td>064-123-4567</td>
							<td>숙소</td>
							<td>2022-09-01</td>
							<td>제주특별자치도 제주시 00읍 00번지</td>
							<td><input type="button" value="수정" onclick="location.href='./place_form.jsp'"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
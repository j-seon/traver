<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/traverSite/lmth/admin/file/css/reset.css" type="text/css" rel="stylesheet">
<link href="/traverSite/lmth/admin/file/css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="../cni/header.jsp"%>
	<div class="main">
		<div class="container">
			<div class="sch_contents">
				<h2>전체 게시글</h2>
				<div class="subS">
					<!-- 찾기 영역 -->
					<form action="">
						<select name="schSel">
							<option value="아이디">아이디</option>
							<option value="닉네임">닉네임</option>
							<option value="이름">이름</option>
							<option value="일정명">일정명</option>
							<option value="아이피">아이피</option>
							<option value="등록일">등록일</option>
						</select> <input type="text" name="" placeholder="검색란"> <input
							type="button" value="찾기">
					</form>
					<ul>
						<li><span class="count">총 일정 수 : <span class="sch_num">22개</span></span></li>
						<li><input type="button" value="선택 삭제" id="schDel" onclick="confirm('일정을 삭제하시겠습니까?')"></li>
					</ul>
				</div>
			</div>
			<div class="schs_table">
				<table>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox"></th>
							<th scope="col">아이디</th>
							<th scope="col">닉네임</th>
							<th scope="col">이름</th>
							<th scope="col">일정명</th>
							<th scope="col">아이피</th>
							<th scope="col">등록일</th>
							<th scope="col">관리</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td><input type="checkbox"></td>
							<td>admin</td>
							<td>관리자</td>
							<td>홍길동</td>
							<td>제주여행 7박 8일짜리!!</td>
							<td>112.174.123.822</td>
							<td>2022-09-01 18:47:12</td>
							<td><input type="button" value="수정"
								onclick="location.href='#'"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
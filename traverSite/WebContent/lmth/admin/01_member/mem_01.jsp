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

	<div class="main">
		<div class="container">
			<div class="mem_contents">
				<h2>회원 관리</h2>
				<div class="subM">
					<!-- 찾기 영역 -->
					<form action="" name="frm_mem">
						<select name="memSel">
							<option value="아이디">아이디</option>
							<option value="닉네임">닉네임</option>
							<option value="이름">이름</option>
							<option value="번호">번호</option>
							<option value="이메일">이메일</option>
							<option value="상태">상태</option>
							<option value="가입일">가입일</option>
							<option value="주소">주소</option>
						</select> <input type="text" name="" placeholder="검색란"> <input
							type="button" value="찾기">
					</form>
					<ul>
						<li><span class="count">총 회원수 : <span class="mem_num">82명</span></span></li>
						<li><input type="button" value="회원 삭제" id="memDel"  onclick="confirm('회원을 삭제하시겠습니까?')"></li>
						<li><input type="button" value="회원 추가" id="memIn"></li>
					</ul>
				</div>
			</div>
			<div class="mem_table">
				<table>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox"></th>
							<th scope="col">아이디</th>
							<th scope="col">닉네임</th>
							<th scope="col">이름</th>
							<th scope="col">번호</th>
							<th scope="col">이메일</th>
							<th scope="col">상태</th>
							<th scope="col">가입일</th>
							<th scope="col">주소</th>
							<th scope="col">관리</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td><input type="checkbox"></td>
							<td>test1</td>
							<td>ㅇㅇㅇ</td>
							<td>홍길동</td>
							<td>010-1234-5678</td>
							<td>test1244@naver.com</td>
							<td>정상</td>
							<td>2022-09-28</td>
							<td>충청남도 천안시 동남구 구성동 정골 1길 55-5번지</td>
							<td><input type="button" value="수정" onclick="location.href='./mem_02.jsp'"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
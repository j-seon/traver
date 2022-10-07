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

	<div class="content">
		<div class="inner">
			<div class="sub_nav">
				<h2>게시물 관리</h2>
				<ul>
					<li><a href="/traverSite/lmth/admin/04_bbs/bbs_01.jsp">전체 게시글</a></li>
					<li><a href="/traverSite/lmth/admin/04_bbs/bbs_02.jsp">전체 리뷰</a></li>
				</ul>
			</div>
			<div class="content_area">
				<div class="main">
					<div class="container">
						<div class="bss_contents">
							<h2>전체 게시글</h2>
							<div class="subB">
								<!-- 찾기 영역 -->
								<form action="">
									<select name="bbsSel">
										<option value="게시물 링크">게시물 링크</option>
										<option value="닉네임">닉네임</option>
										<option value="아이디">아이디</option>
										<option value="MBTI">MBTI</option>
										<option value="등록일">등록일</option>
										<option value="아이피">아이피</option>
										<option value="추천수">추천수</option>
									</select> 
									<input type="text" name="" placeholder="검색란"> 
									<input type="button" value="찾기">
								</form>
								<ul>
									<li><span class="count">총 게시물 : <span class="bbs_num">42개</span></span></li>
									<li><input type="button" value="게시글 삭제" id="bbsDel" onclick="confirm('게시글을 삭제하시겠습니까?')"></li>
								</ul>
							</div>
						</div>
						<div class="bbs_table">
							<table>
								<thead>
									<tr>
										<th scope="col"><input type="checkbox"></th>
										<th scope="col">게시물 링크</th>
										<th scope="col">닉네임</th>
										<th scope="col">아이디</th>
										<th scope="col">MBTI</th>
										<th scope="col">등록일</th>
										<th scope="col">아이피</th>
										<th scope="col">추천수</th>
										<th scope="col">관리</th>
									</tr>
								</thead>
								<tbody>
									<tr align="center">
										<td><input type="checkbox"></td>
										<td><a href="http://naver.com" target="_blank">http://naver.com</a></td>
										<td>admin</td>
										<td>test1</td>
										<td>INFJ</td>
										<td>2022-09-01 18:47:12</td>
										<td>112.174.123.822</td>
										<td>12</td>
										<td><input type="button" value="수정" onclick="location.href='bbs_01_sub.jsp'"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
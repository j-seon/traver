<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 일정 목록</title>
<script>
link = 'mschdList';
function enterKey(e) {
    if (e.keyCode == 13){
   		location.href = link;
    }
}
</script>
<style>
.container-default_box { padding: 0px 40px 0px 40px; }

/* 재덕 수정 시작 */
.sch_h2 {margin: 40px 0;}
.contents_sch {height: 100px;}
.contents_con {height: 600px;}
 
/* 재덕 수정 끝 */

#title { color: #000; }
select { height: 29px; vertical-align: middle; cursor: pointer; }
#search-box {
	display: inline-block;
    width: 190px;
    height: 26px;
    border: 1px solid #767676;
    position: flex;
    align-items: center;
}
input[type="text"] { height:23px; border: none; }
#x-sch { width:10px; margin-left: 5px; border: none; }
.btn {
	background: inherit; border: none; box-shadow: none; border-radius: 0; 
	padding: 0; overflow: visible; cursor: pointer;
}
#subtitle { font-size: 25px; font-weight: bold;}
#schbox { float: right }
#sch { 
	width: 250px; height: 24px; 
	margin-bottom: 5px; vertical-align: -1px;
	font-size: 14px; 
}
#list { width: 100%; }
.post { float: left; margin: 10px 20px 10px 20px;}
.post_title { 
	width: 180px; height: 52px; 
	display: inline-block; padding: 10px;
	background-color: #BDD7EE;
	font-size: 20px; font-weight: bold; line-height: 1.5;
}
.small { font-size: 14px; }
.postimg { width: 200px; height: 200px; }

.display_none { display: none; }
</style>
</head>
<body>
<%@ include file="../../cni/header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
ArrayList<ScheduleInfo> scheduleList = (ArrayList<ScheduleInfo>)request.getAttribute("scheduleList");
// 자유게시판 글목록이 들어있는 ArrayList<ScheduleInfo>를 형변환하여 받아옴

String keyword =  (String)request.getParameter("keyword");
String schargs = "";
if (keyword != null && !keyword.equals("")) {// 검색어가 있으면
	schargs = "&keyword=" + keyword; // ???????????????????????????????????
	// 검색어가 있으면 검색관련 데이터들을 쿼리스트링으로 저장
}

%>

<div class="container">
   <div class="container-default_box">
   <div class="contents_con">
   		<div class="contents_sch">
	   		<div class="sch_h2">
	   			<a href="mschd_list.jsp" id="title"><span id="subtitle">내 일정</span></a>
	   		</div>
	   		
	   		<form name="frmSch" method="get">
		   		<div class="sch_contor">
			   		<select class="year">
						<option value="total">전체보기</option>
						<option value="2022">2022</option>
						<option value="2021">나중에 수정</option>
					 </select>
					 <select class="o">
						<option value="datedesc">등록 최신 순</option>
						<option value="dateasc">등록 오래된 순</option>
					 </select>
					 <span> 총 일정 수 : </span>
					 <!-- 추후 일정제목/장소명 셀렉트 박스는 삭제하고 검색박스만 남겨놓을 예정 -->
					 <div id="schbox">
					 	<select class="sch">
							<option value="schdname">일정 제목</option>
							<option value="place">장소명</option>
						</select>
					 	<div id= "search-box" >
						 	<input type="text" name="keyword" value="<%=keyword %>" placeholder="일정제목으로 검색하세요." onkeyup="enterKey(e);">
						 	<button class="btn"><img src="../../file/img/x.png" id="x-sch"></button>
						</div>
					 </div>
				 </div>
			 </form>
			 
			 <br>
			 <a href="mschd_detail.jsp">내 일정 디테일로</a><br><br>
			 <a href="ischd_list.jsp">관심일정 리스트로</a>
			 <br>
		</div>
		<div id="list">
			<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목1<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목2<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목3<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목4<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목5<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
		</div>	
		</div>
   </div>
</div>
<%@ include file="../../cni/footer.jsp" %>
</body>
</html>
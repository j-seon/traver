<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 일정 목록</title>
<style>
.container-default_box { padding: 0px 40px 0px 40px; }
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
#subtitle { font-size: 25px; font-weight: bold; margin: 0px 70px 50px 10px;}
#schbox { float: right }
#sch { 
	width: 250px; height: 24px; 
	margin-bottom: 5px; vertical-align: -1px;
	font-size: 14px; 
}

.post { float: left; margin: 10px 20px 10px 20px;}
.post_title { 
	width: 180px; height: 52px; 
	display: inline-block; padding: 10px;
	background-color: #C5E0B4;
	font-size: 20px; font-weight: bold; line-height: 1.5;
}
.small { font-size: 14px; }
.postimg { width: 200px; height: 200px; }
</style>
</head>
<body>
<%@ include file="../../cni/header.jsp" %>
<div class="container">
   <div class="container-default_box">
   		<br><br><br><br>
   		<a href="ischd_list.jsp" id="title"><span id="subtitle">관심 일정</span></a><br><br><br><br>
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
		 <div id="schbox">
		 	<select class="sch">
				<option value="schdname">일정 제목</option>
				<option value="place">장소명</option>
			</select>
			<div id= "search-box" >
			 	<input type="text"><button class="btn"><img src="../../file/img/x.png" id="x-sch"></button>
			</div>
		 </div>
		 <br><a href="ischd_detail.jsp">관심 일정 디테일로</a><br>
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
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목6<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목7<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목8<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목9<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목10<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목11<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
	   		<div class="post">
	   			<div class="post_title">
	   				여행 일정 제목12<br>#박 #일 <span class="small">(##.##~##.##)</span>
	   			</div>
	   			<div class="post_img">
	   				<img src="#" class="postimg">
	   			</div>
	   		</div>
		</div>	
   </div>
</div>
<%@ include file="../../cni/footer.jsp" %>
</body>
</html>
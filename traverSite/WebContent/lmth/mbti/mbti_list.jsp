<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 전체 보기</title>
<style>
.container-default_box { padding: 15px; }
#title { color: #000; }
span { cursor: pointer; }
label { cursor: pointer; }
.top { position: relative; }
#title_font { font-size:25px; font-weight:bold; margin: 0px 70px 50px 40px;}
#schselect { width: 70px; height: 29px; cursor: pointer; }
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
#gorecbtn { float: right; display: inline; padding: 10px 20px 0 0; }

#side { 
	width: 200px; height: 500px; 
	float: left;  margin-left: 20px; margin-right: 30px; 
	font-size: 16px; line-height: 1.7; 
}
.sub_box { margin-bottom: 5px; }
.sub_font { font-size: 20px; font-weight: bold; padding: 0px 0px 0px 10px; } 
.arrowbtn { float: right; margin: 7px 10px 0px 0px;}
.arrowbtn_img { width: 15px; }
#orders { width: 90%; }
.order, .dora, .mbti { padding:5px 0px 0px 10px; }
input[type="radio"] { vertical-align:0px; margin-bottom:10px; }

#list { 
	width: 870px; height: 800px; border: 1px solid #888; float: left; position: relative;
	border-right: none; border-left: none; padding: 30px; overflow: auto; font-size: 16px;
	margin: 8px 0 100px 0; 
}
.post { float: left; margin: 0 5px 10px 5px;}
.post_title { 
	width: 180px; height: 52px; 
	display: inline-block; padding: 10px;
	background-color: #efefef;
	font-size: 20px; font-weight: bold; line-height: 1.5;
}
.small { font-size: 14px; }
.postimg { width: 200px; height: 200px; }

.display_none { display: none; }
</style>
<script>
window.onload = function(){
	const orderdora = document.querySelector('#orderdora');
	const mbti = document.querySelector('.mbti');
	const orderbtn = document.querySelector('#orderbtn');
	const mbtibtn = document.querySelector('#mbtibtn');
	const orderbtn_img = document.querySelector('#orderbtn_img');
	const mbtibtn_img = document.querySelector('#mbtibtn_img');
	
	orderbtn.addEventListener('click', function() {
		orderdora.classList.toggle("display_none");
		
		if ( orderdora.classList.contains("display_none"))
			orderbtn_img.src = "../../file/img/down.png"
		else 
			orderbtn_img.src = "../../file/img/up.png"
	});
	
	mbtibtn.addEventListener('click', function() {
		mbti.classList.toggle("display_none");
		
		if ( mbti.classList.contains("display_none"))
			mbtibtn_img.src = "../../file/img/down.png"
		else 
			mbtibtn_img.src = "../../file/img/up.png"
	});
}
</script>
</head>
<body>
<%@ include file="../../cni/header.jsp" %>
<div class="container">
	<div class="container-default_box">
		<div id="top"><br><br>
	       	<a href="mbti_list.jsp" id="title"><span id="title_font">여행 전체보기</span></a>
	       	<select id="schselect">
				<option value="title">글제목</option>
				<option value="writer">작성자</option>
				<option value="place">장소명</option>
			 </select>
			 <div id= "search-box" >
			 <input type="text"><button class="btn"><img src="../../file/img/x.png" id="x-sch"></button>
			 </div>
			 <a href="mbti_form_in.jsp"><button class="btn" id="gorecbtn"><image src="../../file/img/" alt="일정 추천하기"></button></a>
			 <br><br><br>
		</div>
		<div id="bottom">
			<div id="side">
			<hr>
			<div class="sub_box">
				<label for="orderbtn"><span class="sub_font">정렬 기준</span></label>
				<button type="button" class="btn arrowbtn" id="orderbtn"><image class="arrowbtn_img" id="orderbtn_img" src="../../file/img/up.png" alt="닫기"></button><br>
			</div>
			<div id="orderdora">
					<div class="order">
					<input type="radio" name="order" id="rec" value="rec"><label for="rec"> 추천</label><br>
					<input type="radio" name="order" id="date" value="date"><label for="date"> 등록일</label><br>
					<input type="radio" name="order" id="read" value="read"><label for="read"> 조회수</label><br>
					</div>
				<hr id="orders">
					<div class="dora">
					<input type="radio" name="dora" id="desc" value="desc"><label for="desc"> 내림차순</label><br>
					<input type="radio" name="dora" id="asc" value="asc"><label for="asc"> 오름차순</label>
					</div>
			</div>
			<hr>
			<div class="sub_box">
				<label for="mbtibtn"><span class="sub_font">MBTI 기준</span></label>
				<button type="button" class="btn arrowbtn" id="mbtibtn"><image class="arrowbtn_img" id="mbtibtn_img" src="../../file/img/up.png" alt="닫기"></button><br>
			</div>
				<div class="mbti">
				<input type="radio" name="mbti" id="total" value="total"><label for="total"> 전체보기</label><br>
				<input type="radio" name="mbti" id="ISTJ" value="ISTJ"><label for="ISTJ"> ISTJ</label><br>
				<input type="radio" name="mbti" id="ISTP" value="ISTP"><label for="ISTP"> ISTP</label><br>
				<input type="radio" name="mbti" id="ISFJ" value="ISFJ"><label for="ISFJ"> ISFJ</label><br>
				<input type="radio" name="mbti" id="ISFP" value="ISFP"><label for="ISFP"> ISFP</label><br>
				<input type="radio" name="mbti" id="INTJ" value="INTJ"><label for="INTJ"> INTJ</label><br>
				<input type="radio" name="mbti" id="INTP" value="INTP"><label for="INTP"> INTP</label><br>
				<input type="radio" name="mbti" id="INFJ" value="INFJ"><label for="INFJ"> INFJ</label><br>
				<input type="radio" name="mbti" id="INFP" value="INFP"><label for="INFP"> INFP</label><br>
				<input type="radio" name="mbti" id="ESTJ" value="ESTJ"><label for="ESTJ"> ESTJ</label><br>
				<input type="radio" name="mbti" id="ESTP" value="ESTP"><label for="ESTP"> ESTP</label><br>
				<input type="radio" name="mbti" id="ESFJ" value="ESFJ"><label for="ESFJ"> ESFJ</label><br>
				<input type="radio" name="mbti" id="ESFP" value="ESFP"><label for="ESFP"> ESFP</label><br>
				<input type="radio" name="mbti" id="ENTJ" value="ENTJ"><label for="ENTJ"> ENTJ</label><br>
				<input type="radio" name="mbti" id="ENTP" value="ENTP"><label for="ENTP"> ENTP</label><br>
				<input type="radio" name="mbti" id="ENFJ" value="ENFJ"><label for="ENFJ"> ENFJ</label><br>
				<input type="radio" name="mbti" id="ENFP" value="ENFP"><label for="ENFP"> ENFP</label><br>
				</div>
			</div>
			<div id="list">
		 		<div class="post">
		   			<div class="post_title">
		   				글 제목1<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목2<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목3<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목4<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목5<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목6<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목7<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목8<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목9<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목10<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목11<br>#박 #일 <span class="small">(##.##~##.##)</span>
		   			</div>
		   			<div class="post_img">
		   				<img src="#" class="postimg">
		   			</div>
		   		</div>
		   		<div class="post">
		   			<div class="post_title">
		   				글 제목12<br>#박 #일 <span class="small">(##.##~##.##)</span>
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
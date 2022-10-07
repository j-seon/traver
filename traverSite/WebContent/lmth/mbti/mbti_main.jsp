<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BEST 여행</title>
<style>
#visual {
	height: 300px;
	background-image: url('../../file/img/mbti_bg.png');
}
#p_vis_disc {
	width: 1200px; height: 400px;
	margin: 0 auto;
	position: relative;
}

#char_visual {
	height: 79%; width: 100%;
	top: 150%;
	display: inline;
	margin-left: 150px;
}
.container-default_box {
	padding: 20px 15px 20px 15px;
	background-color:#fff;
}
#top { position: relative;}
#title { color: #000; }
#title_font { font-size: 25px; font-weight: bold; display: inline; margin-left: 10px;}
#mbti_select { 
	width: 100px; height: 30px;
	display: inline; float: right; margin-top: 4px;   
	font-size: 18px; vertical-align: middle; text-align: center;
	position: relative; right: 80px;
	cursor: pointer;
}
#retestbtn { margin-top: 10px; }
.btn {
	background: inherit ; border: none; box-shadow: none; border-radius: 0; 
	padding: 0; overflow: visible; cursor: pointer;
	position: absolute; right: 5px; float: right;
}

hr { margin: 20px 0;}
.sub_font { 
	font-size: 20px; font-weight: bold; display: inline; 
 	margin-left: 10px; color: #2F5597;
}
#mbti-rcmd, #pop-rcmd { width: 100%; position: relative; }

.hiddenbox { width: 93%; hegiht: 100%; 
	position: relative; left: 59px; 
	z-index: 1;  overflow:hidden;
    -webkit-tap-highlight-color: transparent;
}

#mbti-post, #pop-post { 
	width: 98%; height: 100%; background-color: #fff; 
	position: relative;  
}

.arrowbox { position: relative; z-index: 2; }
.arrowbtn { 
	background: inherit ; border: none; box-shadow: none; border-radius: 0; 
	padding: 0; overflow: visible; cursor: pointer; float:left; 
	position: relative; top: 140px;
}
.arrow { width: 30px; }
.left { margin-right: 1140px;}
.postbox {     
	width: 2640px;
    height: 290px;
    position: relative;
    z-index: 0; 
}
.post { float: left; margin-right: 20px; }
.post_title { 
	width: 180px; height: 52px; 
	display: inline-block; padding: 10px;
	background-color: #efefef;
	font-size: 20px; font-weight: bold; line-height: 1.5;
}
.small { font-size: 14px; }
.postimg { width: 200px; height: 200px; }

.hide { opacity: 0.0; cursor: default; }
</style>
<script src="../../file/js/jquery-3.6.1.js"></script>
<script>
$(document).ready(function() {
	var mbticlix = 0, popclix = 0;
	
	$("#t-l-btn").click(function() {
		if (mbticlix > 0){
			$("#mbti_postbox").animate({left:"+=1100px"},300);
			mbticlix--;
			$("#t-l-btn").addClass('hide');
			$("#t-r-btn").removeClass('hide');
		} 
	});
	
	$("#t-r-btn").click(function() {
		if (mbticlix < 1){
			$("#mbti_postbox").animate({left:"-=1100px"},300);
			mbticlix++;
			$("#t-r-btn").addClass('hide');
			$("#t-l-btn").removeClass('hide');
		} 

	});
	
	$("#b-l-btn").click(function() {
		if (popclix > 0){
			$("#pop_postbox").animate({left:"+=1100px"},300);
			popclix--;
			$("#b-l-btn").addClass('hide');
			$("#b-r-btn").removeClass('hide');
		} 
	});
	
	$("#b-r-btn").click(function() {
		if (popclix < 1){
			$("#pop_postbox").animate({left:"-=1100px"},300);
			popclix++;
			$("#b-r-btn").addClass('hide');
			$("#b-l-btn").removeClass('hide');
		} 
	});
});
</script>
</head>
<body>
<%@ include file="../../cni/header.jsp" %>
<div id="visual">
	<div id="p_vis_disc">
		<img id="char_visual" src="../../file/img/mbti_char.png">	
	</div>
</div>
<div class="container">
   <div class="container-default_box">
   		<br><br>
   		<div id="top">
	       	<a href="mbti_main.jsp" id="title"><h2 id="title_font">Best 여행</h2></a>
	       	<select id="mbti_select" onchange="">
	   			<option value="ISTJ">ISTJ</option>
	   			<option value="ISTP">ISTP</option>
	   			<option value="ISFJ">ISFJ</option>
	   			<option value="ISFP">ISFP</option>
	   			<option value="INTJ">INTJ</option>
	   			<option value="INTP">INTP</option>
	   			<option value="INFJ">INFJ</option>
	   			<option value="INFP">INFP</option>
	   			<option value="ESTJ">ESTJ</option>
	   			<option value="ESTP">ESTP</option>
	   			<option value="ESFJ">ESFJ</option>
	   			<option value="ESFP">ESFP</option>
	   			<option value="ENTJ">ENTJ</option>
	   			<option value="ENTP">ENTP</option>
	   			<option value="ENFJ">ENFJ</option>
	   			<option value="ENFP">ENFP</option>
	   		</select>
	   		<a href="mbti_test.jsp"><button class="btn"><image id="retestbtn" src="../../file/img/" alt="재검사"></button></a>
	   	</div><br><br>
	   	<hr>
	   	<div id="mbti-rcmd">
		   	<span class="sub_font">ISTJ 추천 일정</span>
		   	<a href="mbti_list.jsp"><button class="btn"><image class="golistbtn" src="../../file/img/" alt="전체 일정표 보기"></button></a>
		   	<br>
		   	<div class="arrowbox">
			   	<button class="arrowbtn left hide" id="t-l-btn"><img class="arrow" src="../../file/img/left.png"></button>
				<button class="arrowbtn" id="t-r-btn"><img class="arrow" src="../../file/img/right.png"></button>
			</div>
		   	<div id="mbti-post">
		   		<div class="hiddenbox">
				   	<div class="postbox" id="mbti_postbox">
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
	   	<br><hr>
	   	<div id="pop-rcmd">
		   	<span class="sub_font">인기 일정</span>
		   	<a href="mbti_list.jsp"><button class="btn"><image class="golistbtn" src="../../file/img/" alt="전체 일정표 보기"></button></a>
		   	<br>
		   	<div class="arrowbox">
			   	<button class="arrowbtn left hide" id="b-l-btn"><img class="arrow" src="../../file/img/left.png"></button>
				<button class="arrowbtn" id="b-r-btn"><img class="arrow" src="../../file/img/right.png"></button>
			</div>
		   	<div id="pop-post">
		   		<div class="hiddenbox">
				   	<div class="postbox" id="pop_postbox">
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
	   	<br>
   </div>
</div>
<%@ include file="../../cni/footer.jsp" %>
</body>
</html>
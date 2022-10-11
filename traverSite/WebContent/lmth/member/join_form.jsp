<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%
request.setCharacterEncoding("utf-8");


String[] arrDomain = {"naver.com", "nate.com", "gmail.com", "daum.net", "yahoo.com"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.container-default_box {
	position: relative;
}
.joinForm_box {  
    width:700px; height:800px; 
    border:solid 1px black; background-color:#fafcfc;
    position:absolute; top:130px; left:250px;
    padding-bottom:20px;  
}
.main_title { 
    font-size:25px; font-weight:bold;
    margin:40px 5px 5px 5px; text-align:center; 
}
.asterik { color:red; }
.title { color:black; font-weight:bold; font-size:16px; }
.box { height:30px; margin-left:40px; }
.box2 { margin:10px 0 10px 100px; }

.idbox { margin-top:40px; margin-left:50px; }
.pwbox { margin-top:10px; margin-left:50px; }
.namebox { margin-top:10px; margin-left:50px; }
.nicknamebox { margin-top:40px; margin-left:50px; }
.birthbox_group { margin-top:10px; margin-left:50px; }
.emailbox { margin-top:40px; margin-left:50px; }

#mi_id { margin-left:35px; }
#mi_pw { margin-left:20px; }
#mi_pw2 { margin-left:95px; }
#mi_name { margin-left:50px; }
#mi_nickname { margin-left:35px; }
#mi_birth { height:30px; width:200px;}
#birthbox_select { margin-left:20px; }
#emailbox_select { margin-left:35px; }

#btnCancel { 
	height:40px; width:80px; margin-left:250px; 
	margin-top:20px; 
}
#btnJoin { 
	height:40px; width:80px; 
	margin-top:20px; 
}
#fontBlue { font-weight:bold; color:blue; }
#fontRed { font-weight:bold; color:red; }
.btnChk { height:36px; }
</style>
<script src="/traverSite/file/jq/jquery-3.6.1.js"></script>
<script>
$(document).ready(function() {
    $("#e2").change(function() {
        if ($(this).val() == "") {
            $("#e3").val("");
        } else if ($(this).val() == "direct") {
            $("#e3").val("");
            $("#e3").focus();
        } else {
            $("#e3").val($(this).val());
        }
    });
});

function chkDupId(uid) {    // id중복체크 등 다 이걸로!
   //	var regEngNum = /^[A-Za-z0-9+]*$/; 

    if (uid.length >= 6) {  //id가 6자 이상이면
        $.ajax({
            type : "POST",              // 데이터 전송방법
            url : "/mvcSite/dupId",     // 전송한 데이터를 받을 서버의 URL로 컨트롤러(서블릿)를 의미
            data : {"uid" : uid},       // 지정한 url로 보낼 데이터의 이름과 값
            success : function(chkRs) { // 데이터를 보내 실행한 결과를 chkRs로 받아 옴
                var msg = "";           // 사용자에게 보여줄 메시지를 저장할 변수
                if (chkRs == 0) {       // uid와 동일한 기존의 회원 아이디가 없으면
                    msg = "<p id='fontBlue'>사용 가능한 아이디 입니다.</p>";
                    $("#idChk").val("y");   // 아이디 중복체크를 성공한 상태로 변경
                } else {                // uid와 동일한 기존의 회원 아이디가 있으면
                    msg = "<p id='fontRed'>이미 사용중인 아이디입니다.</p>";
                    $("#idChk").val("n");   // 아이디 중복체크를 하지 않거나 실패한 상태로 변경
                }
                $("#idMsg").html(msg);
            }
        });
    } else { //id가 6자 미만이면
    	$("#idMsg").text("※ 6 ~ 20자 이내로 영문과 숫자 조합해주세요.");
	    $("#idChk").val("n");   // 아이디 중복체크를 하지 않거나 실패한 상태로 변경
    } 
}
</script>
</head>
<body>
<%@ include file="../../cni/header.jsp" %>
<!-- 컨테이너 시작 -->
<div class="container">
   <div class="container-default_box">

	<div class=joinForm_box>
		<h2 class="main_title">회원 가입</h2>
		<form name="frmJoin" action="#" method="post">
		<input type="hidden" name="kind" value="in" /> <!-- 회원가입 : kind=in -->
		<input type="hidden" name="idChk" id="idChk" value="n" /> 
		    <div class="idbox">
		    	<span class="asterik">*</span><span class="title">아이디</span>
			    <input type="text" name="mi_id" required="required" id="mi_id" class="box" maxlength="20" 
			    size="25" placeholder="아이디를 입력해 주세요." onkeyup="chkDupId(this.value);" />
			    <p id="idMsg" class="box2">※ 6 ~ 20자 이내로 영문과 숫자 조합해주세요.</p>
		    </div><br />
		    
		    <div class="pwbox">
		    	<span class="asterik">*</span><span class="title">비밀번호</span>
			    <input type="password" name="mi_pw" required="required" id="mi_pw" class="box" maxlength="20" 
			    size="25" placeholder="비밀번호를 입력해 주세요." onkeyup="chkDupPw(this.value);" />
			    <p id="pwMsg" class="box2">※ 6 ~ 20자 이내로 영문과 숫자 조합해주세요.</p>
			    <input type="password" name="mi_pw2" required id="mi_pw2" class="box" maxlength="20" 
			    size="25" placeholder="비밀번호를 다시 입력해 주세요." onkeyup="chkDupPw(this.value);" />
                <p id="pwMsg2" class="box2">비밀번호가 동일합니다.</p>
		    </div><br />
		    
		    <div class="namebox">
		    	<span class="asterik">*</span><span class="title">이름</span>
			    <input type="text" name="mi_name" required="required" id="mi_name" class="box" maxlength="50" 
			    size="25" placeholder="이름을 입력해 주세요." />
		    </div><br />
		    
		    <div class="nicknamebox">
		    	<span class="asterik">*</span><span class="title">닉네임</span>
	            <input type="text" name="mi_nickname" required="required" id="mi_nickname" class="box" maxlength="20" 
	            size="25" placeholder="닉네임을 입력해 주세요." onkeyup="chkDupNickNm(this.value);" />
	            <p id="nickNameMsg" class="box2">※ 20자 이내로 입력해주세요.</p>
            </div><br />
		    
		    <div class="birthbox_group">
		    	<span class="asterik">*</span><span class="title">생년월일</span>
			    <span id="birthbox_select">
				    <input type="date" name="mi_birth" required="required" id="mi_birth" >
			    </span>
		    </div><br />
		    
			<div class="emailbox">
				<span class="asterik">*</span><span class="title">이메일</span> 
				<span id="emailbox_select">
				<input type="text" name="e1" required="required" size="10" style="height:30px;" 
				placeholder="이메일"/> @
				<select name="e2" id="e2" style="height:36px;">
					<option value=""> 선택 </option>
						<%for (int i =0; i < arrDomain.length; i++ ) { %>   
				        <option value="<%=arrDomain[i] %>"><%=arrDomain[i] %></option>  
						<% } %>
				        <option value="direct"> 직접 입력 </option>
				</select>
				    <input type="text" name="e3" id="e3" size="10" style="height:30px;"/>
				    <button onclick="emailAuthentication()" id="eamilAuthBtn" type="button" class="btnChk">이메일 확인</button><br />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="verifyNum" style="height:30px; margin-top:10px;" placeholder="이메일 본인 확인 번호" maxlength="6"
					required="required" />
					<span class="blind">5:00</span>
					<input type="submit" value="확인" style="height:35px; width:60px;"/>
			</div><br />
		    <input type="button" id="btnCancel" value="취소" onclick="history.back(-1);" />
		    &nbsp;&nbsp;&nbsp;
		    <input type="submit" id="btnJoin" value="회원가입" />
		</form>
    </div>
    
   </div>
</div>
<!-- 컨테이너 종료 -->
<%@ include file="../../cni/footer.jsp" %>
</body>
</html>
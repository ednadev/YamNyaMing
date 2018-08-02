<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/prettydropdowns?ver=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/owner.js?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerSignUp.js?ver=1"></script>
</head>
<style>
.btn {
	position: static;
	width: 80px;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #FFBB00;
	background: #FFBB00;
	padding: 16px 18px 14px;
	font-size: 10px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px rebeccapurple;
	-moz-box-shadow: 0px 6px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
}
.btn:active {
	-webkit-box-shadow: 0px 1px 0px rebeccapurple;
	-moz-box-shadow: 0px 2px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
	position: relative;
	top: -1px;
}
</style>
<script type="text/javascript">  //아이디 체크여부 확인 
var idcheck = false;
var pwcheck = false;



function idCheck(){
    var regExp;
    var resultChk;
    var ad_id = $('#ad_id').val();
    regExp = /^[a-z0-9]{5,12}$/;
    resultChk = regExp.test(ad_id);
    if(resultChk == false){
    	document.getElementById('idch').style.color = "red";
        document.getElementById('idch').innerHTML = "5~12자의 영문 소문자와 숫자만 사용 가능합니다.";
        document.getElementById('subbtn').disabled;
        var idcheck = false;
    }else{
        $.ajax({
             url : "/adminIdCheck.do",
             data : {ad_id : ad_id},
             dataType:'json',
             success : function(data){
                 console.log(data);
                 if(data>0){
                    document.getElementById('idch').style.color = "red";
                    document.getElementById('idch').innerHTML = "이미 존재하는 아이디.";
                    document.getElementById('subbtn').disabled;
                    var idcheck = false;
                 } else{
                    document.getElementById('idch').style.color = "blue";
                    document.getElementById('idch').innerHTML = "사용 가능한 아이디.";
                    idck = 1;      
                    var idcheck = true;
                 }   
             }
         });    
    }
}
function check(){   //비밀번호 조건문
	  var f1 = document.forms[0];
	  var pw1 = f1.ad_password.value;
	  var pw2 = f1.pwd_check.value;
	  var num = pw1.search(/[0-9]/g);
	  var eng = pw1.search(/[a-z]/ig);
	  var spe = pw1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	  if(pw1!=pw2)
	  {
	   document.getElementById('checkPwd').style.color = "red";
	   document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
	   pwcheck = false;
	  }
	  else if(pw1 == "") 
	  {
	  document.getElementById('checkPwd').style.color = "red";
	  document.getElementById('checkPwd').innerHTML = "비밀번호를 입력하세요.";
	  pwcheck = false;
	  }
	  else if (pw1.length<8 || pw1.length>16) {
	  document.getElementById('checkPwd').style.color = "red";
	  document.getElementById('checkPwd').innerHTML = "8~12글자로 입력하세요.";
	  pwcheck = false;
	  }
	  else if(num < 0 || eng < 0 || spe < 0 ){
	  document.getElementById('checkPwd').style.color = "red";
	  document.getElementById('checkPwd').innerHTML = "영문,숫자,특수문자 합쳐서 ";
	  pwcheck = false;
	  }
	  else
	  {
	   document.getElementById('checkPwd').style.color = "blue";
	   document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";   
	   pwcheck = true;
	  } 
	 }
</script>

<body>
	<header id="owner-signUp-header">
		<h1><a href="/index.jsp">YamNyamCompany</a></h1>
	</header>
	<div class="wrapper">
		<nav id="owner-signUp-nav">
			<h2>관리자 가입하기</h2>
		</nav>
        <form action="/enrollAdmin2.do" method="post" enctype="multipart/form-data">
			<section id="owner-signUp-section">
				<h3>계정 정보 입력</h3>
				<div class="signUp-table">
					<div>아이디</div>
				 <div>
               <input type="text" name="ad_id" id="ad_id" required/>
               <input type="button" name="idck" id="idck" class="btn" value="CHECK" onclick="idCheck()"/>  
               <p id="idch">얌냐밍에서 이용하실 아이디를 입력해주세요. 5~20자의 영문,숫자만 가능합니다.</p>
            </div>
				</div>
				<div class="signUp-table">
					  <div>비밀번호</div>
            <div>
               <input type="password" name="ad_password" placeholder="비밀번호를 입력하세요" required ></input>
               <input type="password" name="pwd_check" placeholder="비밀번호를 똑같이 입력하세요" onchange="check()" required ></input>
               <p id="checkPwd">특수문자(예: !@#$ 등) 1자 이상을 포함한 8~15 글자의 비밀번호로 설정해주세요.</p>
            </div>
         </div>
				<div class="signUp-table">
				    <div>권한</div>
         <SELECT name="combo" id="ad_grade" style="width:389px; height: 45px; margin:10px; color:black;">
    <OPTION value="2">관리자신청 (운영자가 수락시 로그인 가능)</OPTION>
          </SELECT>

         </div>
				<div class="signUp-table">
				    <div>닉네임</div>
            <div>
               <input type="text" name="ad_nickname" placeholder="닉네임" required />
            </div>
         </div>
         					
				
																														
			</section>
			<input type="submit" value="회원가입하기">
		</form>
	</div>
	<footer id="owner-signUp-footer">
		<div>
			<h2>YamNyaMing</h2>
			<p>Immediately Reservation!</p>
			<address>㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
			주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018 YamNyaMing Co. All rights reserved</address>
		</div>
	</footer>
</body>
</html>
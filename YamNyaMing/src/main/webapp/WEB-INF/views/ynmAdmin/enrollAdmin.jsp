<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/prettydropdowns?ver=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/btn.css?ver=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/adminEnroll.js?ver=1"></script>
</head>
<body>
<header id="owner-signUp-header"><h1><a href="/index.jsp">YamNyamCompany</a></h1></header>
<!-- 시작 -->
<div class="wrapper"><nav id="owner-signUp-nav"><h2>관리자 가입하기</h2></nav>

	<!-- form start -->
        <form action="/enrollAdmin2.do" method="post" onsubmit="return signUpValidChk();">
			<section id="owner-signUp-section">
			<h3>계정 정보 입력</h3>
			<!-- 아이디 -->
			<div class="signUp-table"><div>아이디</div><div>
          	    <input type="text" name="ad_id" id="ad_id" required/>
           	    <input type="button" name="idck" id="idck" class="btn" value="CHECK" onclick="idCheck();" onkeydown="idCheck();"/>  
                <p id="idch">얌냐밍에서 이용하실 아이디를 입력해주세요. 5~20자의 영문,숫자만 가능합니다.</p></div>
            </div>
			<!-- 비밀번호 -->
			<div class="signUp-table"><div>비밀번호</div><div>
               <input type="password" name="ad_password" placeholder="비밀번호를 입력하세요" required ></input>
               <input type="password" name="pwd_check" placeholder="비밀번호를 똑같이 입력하세요" onChange="pwCheck();" onkeydown="pwCheck();" required ></input>
               <p id="checkPwd">특수문자(예: !@#$ 등) 1자 이상을 포함한 8~15 글자의 비밀번호로 설정해주세요.</p></div>
            </div>
            <!-- 권한 -->
			<div class="signUp-table"><div>권한</div>
			<SELECT name="combo" id="ad_grade" style="width:389px; height: 45px; margin:10px; color:black;"><OPTION value="2">관리자신청 (운영자가 수락시 로그인 가능)</OPTION></SELECT>
			</div>
			<!-- 닉네임 -->
			<div class="signUp-table"><div>닉네임</div>
			<div><input type="text" name="ad_nickname" placeholder="닉네임" required /></div>
        	</div>
</section>
<input type="submit" value="가입 신청하기"></form>
<!-- form 끝 -->
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
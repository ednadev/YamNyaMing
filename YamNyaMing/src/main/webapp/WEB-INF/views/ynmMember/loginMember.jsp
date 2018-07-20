<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css?ver=2">
<script src="${pageContext.request.contextPath}/resources/js/member/member.js"></script>
</head>
<body>
<header id="member-signUp-header">
	<h1><a href="/index.jsp">YamNyaMing</a></h1>
</header>
<section id="member-login-section">
	<h2>로그인</h2>
	<form action="login.do" method="post">
		<p>
			<input type="radio" name="loginSelect" id="memberSelect" checked><label for="memberSelect">사용자</label>
			<input type="radio" name="loginSelect" id="ownerSelect"><label for="ownerSelect">점장</label>
		</p>
		<input type="text" placeholder="아이디"> 
		<input type="password" placeholder="비밀번호">
		<p>
			<input type="checkbox" id="idCheck" checked><label for="idCheck">아이디 기억하기</label>
		</p>
		<input type="submit" value="로그인">
	</form>
	<p>
		<a href="idFindMember.do">아이디 찾기</a>
		&nbsp;|&nbsp; 
		<a href="pwFindMember.do">비밀번호 찾기</a>
	</p>
	<div>
		<p><img src="${pageContext.request.contextPath}/resources/image/facebookLoginIcon.jpg" height="40px;" align="center"></p>
		<p><img src="${pageContext.request.contextPath}/resources/image/googleLoginIcon.jpg" height="40px;"  align="center"></p>
		<p><img src="${pageContext.request.contextPath}/resources/image/naverLoginIcon.jpg" height="40px;"  align="center"></p>
	</div>
</section>
<footer id="member-login-footer">
	<div>
		<h2>YamNyaMing</h2>
		<p>Immediately Reservation!</p>
		<address>㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
		주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018 YamNyaMing Co. All rights reserved</address>
	</div>
	<a href="/enrollOwner.do">점장 가입하기</a>
</footer>
</body>
</html>
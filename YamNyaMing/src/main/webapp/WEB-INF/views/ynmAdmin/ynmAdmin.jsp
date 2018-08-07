<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=3">
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</head>
<body>
<header id="admin-login-header">
	<a href="/index.jsp"><img src="${pageContext.request.contextPath}/resources/image/plate-white.png" style="width:44px;float:left;margin:10px;"></a>
	<h1><a href="/ynmAdmin.do">YamNyaMing 관리자</a></h1>
	<h1><a href="/enrollAdmin.do" id="enroll">회원가입</a></h1>
</header>
<section id="admin-login-section">
	<h2>로그인</h2>
	<form action="/adminLogin2.do" method="post">
		<input type="text" name="ad_id" placeholder="아이디">
		<input type="password" name="ad_pw" placeholder="비밀번호">
		<input type="submit" value="로그인">
	</form>
</section>

<footer id="admin-login-footer">
	<div>
		<h2>YamNyaMing</h2>
		<p>Immediately Reservation!</p>
		<address>㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
		주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018 YamNyaMing Co. All rights reserved</address>
	</div>
</footer>
</body>
</html>
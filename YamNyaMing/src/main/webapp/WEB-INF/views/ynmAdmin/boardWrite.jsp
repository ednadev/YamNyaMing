<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</head>
<style>
.btn {
	font-family: 'Sunflower';
	position: static;
	width: 100px;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #333333;
	background: #333333;
	padding: 16px 18px 14px;
	font-size: 20px;
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
<body>
	<header id="admin-login-header">
		<h1>
			<a href="/ynmAdmin.do">YamNyaMing 관리자</a>
		</h1>
		<p>
			[${sessionScope.admin.ad_nickname}] 님 안녕하세요  <a href="/logoutAdmin.do">로그아웃</a>
		</p>
	</header>
	<nav id="admin-main-nav">
		<ul>
	<li><a href="/adminInfo.do">관리자 정보</a></li>
			<li><a href="/allMemberView.do">회원 관리</a></li>
			<li><a href="/allOwnerView.do">점장 관리</a></li>
			<li><a href="/boardAdmin.do">게시판</a></li>
			<li><a href="/statAdmin.do">통계</a></li>
		</ul>
	</nav>
<!-- 내용 시작 -->

<center>
<form action="/adminNoticeWrite.do">
<input type="text" style="width:425px; height: 45px; margin:10px; color:black;" placeholder="제목을 입력하세요" id="subject" name="subject" class="subject" required/><br>
<textarea  cols="60" rows="10" placeholder="내용을 입력하세요" id="contents" name="contents" class="contents" required>
</textarea>
<input type="hidden" value="${sessionScope.admin.ad_id}" id="ad_id" name="ad_id"/>
<input type="hidden" value="${sessionScope.admin.ad_nickname}" id="ad_nickname" name="ad_nickname"/>
<center>
<input type="submit" value="글쓰기" class="btn">
<input type="button" value="취소" class="btn" onclick="history.back(-1);">
</center>
</form>
</center>

<!-- 내용 끝 -->
	<footer id="admin-main-footer">
		<h2>YamNyaMing</h2>
		<p>Immediately Reservation!</p>
		<address>
			㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
			주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018
			YamNyaMing Co. All rights reserved
		</address>
	</footer>
</body>
</html>
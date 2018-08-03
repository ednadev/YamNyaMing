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
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</head>
<style>
.btn {
	position: static;
	width: 80px;
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
<h1>[${notice.noticeNo} 번글]   ${notice.subject}</h1>

<h1>글쓴이:${notice.userNickname}(${notice.userId}) </h1><h1>쓴날:${notice.regDate}</h1>
<h1>내용:${notice.contents}</h1>
<h1></h1>
</center>

<form action="/adminBoardFix.do">
<input type="hidden" value="${notice.noticeNo}" id="noticeNo" name="noticeNo" class="noticeNo"/>
<input type="hidden" value="${notice.userId}" id="userId" name="userId" class="userId"/>
<input type="hidden" value="${notice.subject}" id="subject" name="subject" class="subject"/>
<input type="hidden" value="${notice.regDate}" id="regDate" name="regDate" class="regDate"/>
<input type="hidden" value="${notice.contents}" id="contents" name="contents" class="contents"/>
<input type="hidden" value="${notice.userNickname}" id="contents" name="contents" class="contents"/>
<input type="submit" value="수정" class="btn">
</form>
<form action="/adminBoardDelete.do" name="removefrm" method="post">
<input type="hidden" value="${notice.noticeNo}" id="noticeNo" name="noticeNo" class="noticeNo"/>
<input type="hidden" value="${notice.userId}" id="userId" name="userId" class="userId"/>
<input type="button" onclick="removeCheck()" value="삭제" class="btn">
</form>


<script>
JavaScript

function removeCheck() {

 if (confirm("정말 삭제하시겠습니까??") == true){    //확인

     document.removefrm.submit();

 }else{   //취소

     return false;

 }
}
</script>
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
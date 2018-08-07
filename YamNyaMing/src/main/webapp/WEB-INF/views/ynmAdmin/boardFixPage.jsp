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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/btn.css?ver=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/adminBoard.js"></script>
<!-- include jquery -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- include libraries BS3 -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<!-- include summernote -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/summernote/summernote.css?ver=1">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/owner/summernote/summernote.js?ver=1"></script>

</head>

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

<h4>[${notice.noticeNo} 번글] ${notice.subject}</h4>
<h4>글쓴이:${notice.userNickname}(${notice.userId})</h4>
<h4>쓴날:${notice.regDate}</h4>

<form id="summernote-form" action="/adminBoardFix2.do" method="post" enctype="multipart/form-data">
<input type="hidden" value="${notice.noticeNo}" id="noticeNo" name="noticeNo" class="noticeNo"/>
<input type="hidden" value="${notice.userId}" id="userId" name="userId" class="userId"/>
<center><input type="text" name="boardInfo" placeholder="제목 입력" style="width:100%; height:70px; float:center;"required></center>
<textarea name="owBoardTitle" class="summernote" placeholder="내용을 입력해주세요." value="" required></textarea>
<input type="submit" value="수정" class="fix">
<input type="button" value="취소" class="fix" onclick="history.back(-1);">
</form>

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.ynm.admin.model.vo.*"
	%>
<% YNMAdmin ad = (YNMAdmin)session.getAttribute("admin");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=2">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
</head>
<body>
	<header id="admin-login-header">
		<h1>
			<a href="/ynmAdmin.do">YamNyaMing 관리자</a>
		</h1>
		<p>
			[${sessionScope.admin.ad_nickname}] 님 안녕하세요 <a href="/logoutAdmin.do">로그아웃</a>
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
	<table class="table table-list-search"  style="overflow: auto" border="1">
  <thead>
    <tr>
      <th>아이디</th>
      <th>닉네임</th>
      <th>등급</th>
      <th>변경</th>
    </tr>
  </thead>
    <c:forEach items="${list}" var="m">
  <tbody>
    <tr>
      <td>${m.ad_id}</td>
      <td>${m.ad_nickname}</td>
      <td>
      <c:choose>
      <c:when test="${m.ad_grade eq '2'}">
             수락 대기
      </c:when>
      
      <c:otherwise>
             관리자
      </c:otherwise>
      </c:choose>
     </td>
      <td>
      <c:choose>
      
      
      <c:when test="${m.ad_grade eq '2'}">
      <form action="/upGrade.do">
      <input type="hidden" id="ad_id" name="ad_id" class="ad_id" value="${m.ad_id}"/>
      <input type="submit" style="background-color:white;font-size:20px; font-family: 'Sunflower'; border:0px solid maroon; cursor:pointer;"value="수락"/>
      </form>
      </c:when>
      <c:otherwise>
      <form action="/downGrade.do">
      <input type="hidden" id="ad_id" name="ad_id" class="ad_id" value="${m.ad_id}"/>
      <input type="submit" style="background-color:white; font-size:20px; font-family: 'Sunflower'; border:0px solid maroon; cursor:pointer;"value="강등"/>
      </form>
      </c:otherwise>
      </c:choose>
     </td>
    </tr>
	</c:forEach>
  </tbody>
</table>

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
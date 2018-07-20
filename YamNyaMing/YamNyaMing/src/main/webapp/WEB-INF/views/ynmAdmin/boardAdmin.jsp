<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.ynm.admin.model.vo.*"
	%>
<% YNMAdmin ad = (YNMAdmin)session.getAttribute("admin");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css?ver=1">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="게시판 목록" />
<meta name="Description" content="게시판 목록" />
<link rel="stylesheet" href="../resources/css/screen.css" type="text/css" media="screen" />
<title>${boardNm }</title>
<script type="text/javascript">
//<![CDATA[
 function goList(page) {
  var form = document.getElementById("listForm");
  form.curPage.value = page;
  form.submit();
 }
 
 function goWrite() {
  var form = document.getElementById("writeForm");
  form.submit();
 }
 
 function goView(articleNo) {
  var form = document.getElementById("viewForm");
  form.articleNo.value = articleNo;
  form.submit();
  
 }
//]]>
</script>  
</head>
<body>
<header id="admin-login-header">
		<h1>
			<a href="ynmAdmin.do">YamNyaMing 관리자</a>
		</h1>
		<p>
			[${sessionScope.admin.ad_nickname}] 님 안녕하세요 <a href="logoutAdmin.do">로그아웃</a>
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
	<div id="wrap">


 <div id="container">
  <div id="content" style="min-height: 800px;">
   <div id="url-navi">BBS</div>

<!-- 본문 시작 -->   
<h1>${boardNm }</h1>
<div id="bbs">
 <table>
 <tr>
  <th style="width: 60px;">NO</th>
  <th>TITLE</th>
  <th style="width: 84px;">DATE</th>
  <th style="width: 60px;">HIT</th>
 </tr>
 <!--  반복 구간 시작 -->
 <c:forEach var="article" items="${list }" varStatus="status"> 
 <tr>
  <td style="text-align: center;">${no - status.index}</td> <!-- 게시물 내림차순 정렬 -->
  <td>
   <a href="javascript:goView('${article.articleNo }')">${article.title }</a>
  </td>
  <td style="text-align: center;">${article.writeDate }</td>
  <td style="text-align: center;">${article.hit }</td>
 </tr>
 </c:forEach>
 <!--  반복 구간 끝 -->
 </table>
 
 <!--paging-->
 <div id="paging" style="text-align: center;">
  
  <c:if test="${prevLink > 0 }">
   <a href="javascript:goList('${prevPage }')">[이전]</a>
  </c:if>

  <c:forEach var="i" items="${pageLinks }" varStatus="stat">
   <c:choose>
   <c:when test="${curPage == i}">
    <span class="bbs-strong">${i }</span>
   </c:when>
   <c:otherwise>
    <a href="javascript:goList('${i }')">${i }</a>
   </c:otherwise>
   </c:choose>
  </c:forEach>
  
  <c:if test="${nextLink > 0 }">
   <a href="javascript:goList('${nextPage }')">[다음]</a>
  </c:if>
  
 </div>
 
 <div id="list-menu" style="text-align:  right;">
  <input type="button" value="새글쓰기" onclick="goWrite()" />
 </div>
</div>
<!--  본문 끝 -->

  </div><!-- content 끝 -->
 </div><!--  container 끝 -->
 

</div>

<div id="form-group" style="display: none;">
 <form id="listForm" action="./list" method="get">
  <p>
   <input type="hidden" name="boardCd" value="${boardCd }" />
   <input type="hidden" name="curPage" />
  </p>
 </form>
 
 <form id="writeForm" action="./write" method="get">
 <p>
  <input type="hidden" name="boardCd" value="${boardCd }" />
  <input type="hidden" name="curPage" value="${curPage }" />
 </p>
 </form>
 
 <form id="viewForm" action="./view" method="get">
 <p>
  <input type="hidden" name="articleNo" />
  <input type="hidden" name="boardCd" value="${boardCd }" />
  <input type="hidden" name="curPage" value="${curPage }" />
 </p>
 </form>
</div>
<%-- param.curPage : ${param.curPage }, ${curPage } --%>
[출처] [Spring MVC] 13. 게시판 - 게시판 목록 페이징 처리|작성자 smile
	
	
	

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.ynm.admin.model.vo.*"%>
<% YNMAdmin ad = (YNMAdmin)session.getAttribute("admin");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=3">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/btn.css?ver=3">
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
<style>li {float: left;}</style>
</head>
<body>
	<header id="admin-login-header">
		<a href="/index.jsp"><img src="${pageContext.request.contextPath}/resources/image/plate-white.png" style="width:44px;float:left;margin:10px;"></a>
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
	<table class="table table-list-search">
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
      <c:choose><c:when test="${m.ad_grade eq '2'}">수락 대기</c:when>
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
      <input type="submit" class="paging-num" value="수락"/>
      </form>
      </c:when>
      <c:otherwise>
      <form action="/downGrade.do">
      <input type="hidden" id="ad_id" name="ad_id" class="ad_id" value="${m.ad_id}"/>
      <input type="submit" class="paging-num" value="강등"/>
      </form>
 </c:otherwise></c:choose></td></tr></c:forEach></tbody></table>
<!-- 내용끝 -->
 <!-- 페이지 -->
 <div class="text-center marg-top" align="right">
 <ul class="pagination" style="list-style:none;
    margin:0;
    padding:0;">
    <c:if test="${pageNaviData!=null}">
    	
					<div id="pagingNumber">
						<c:if test="${pageNaviData.startNavi!=1}">
							<form action="/adminList.do" method="post" class="btn">
								<input type="hidden"  name="currentPage" value="${pageNaviData.startNavi-1}"> 
								<input type="submit" class="paging-num" value="<">
							</form>
						</c:if>
						<c:forEach var="i" begin="${pageNaviData.startNavi}" end="${pageNaviData.endNavi}">
							<c:if test="${pageNaviData.currentPage==i}">
								<li><form action="/adminList.do" method="post">
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form></li>
							</c:if>
							<c:if test="${pageNaviData.currentPage!=i}">
								<li><form action="/adminList.do" method="post">
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageNaviData.endNavi!=pageNaviData.pageTotalCount}">
							<li><form action="/adminList.do" method="post">	
								<input type="hidden" name="currentPage"	value="${pageNaviData.endNavi+1}"> 
								<input type="submit"  class="paging-num"  value=">">
							</form></li>
						</c:if>
					</div>
			
				</c:if>
		
</ul>
</div>
<script>
function goPage(pages, lines) {
    location.href = '?' + "pages=" + pages;
}
</script>
<!-- 페이징 끝 -->
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"

	import="com.kh.ynm.admin.model.vo.*"%>
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
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</head>
<style>
.paging-num {
	position: static;
	width: 80px;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #FFBB00;
	background: #FFBB00;
	padding: 16px 18px 14px;
	font-size: 20px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px rebeccapurple;
	-moz-box-shadow: 0px 6px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
}
.paging-num:active {
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
			<a href="/adminInfo.do">YamNyaMing 관리자</a>
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
 

   
  <!-- 게시물 리스트 보여주기 -->

    <table class="table table-board" style="width:100%; height:540px;">

      <thead>
        <tr>
          <th style="text-align:center;">글 번호</th>
          <th style="text-align:center;">제목</th>
          <th style="text-align:center;">작성자</th>
          <th style="text-align:center;">작성일</th>
        </tr>
      </thead>  
       
        <c:forEach var="infolist" items="${noticeListData}">
        <tr>
          <td class="text-center">${infolist.noticeNo}</td>
		  <td>
		  <form action="/noticeView.do">
		  <input type="hidden" value="${infolist.noticeNo}" id="noticeNo" name="noticeNo" class="noticeNo"/>
          <input type="submit" value="${infolist.subject}" style="background-color:white; border:solid 0px white;"/>
          </form>
          </td>
          <td class="text-center">${infolist.userId}</td>
          <td class="text-center">
          
          <fmt:formatDate value="${infolist.regDate}" pattern="YYYY-MM-dd"/>
          </td>
        </tr>
        </c:forEach> 
    </table>
     

     <!-- 페이지 -->
     
    <c:if test="${pageNaviData!=null}">
    				<center>
					<div id="pagingNumber">
						<c:if test="${pageNaviData.startNavi!=1}">
							<form action="/boardAdmin.do" method="post">
								<input type="hidden"  name="currentPage" value="${pageNaviData.startNavi-1}"> 
								<input type="submit" class="paging-num" value="<">
							</form>
						</c:if>
					
						<c:forEach var="i" begin="${pageNaviData.startNavi}"
							end="${pageNaviData.endNavi}">
							<c:if test="${pageNaviData.currentPage==i}">
								<form action="/boardAdmin.do" method="post">
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form>
							</c:if>
							<c:if test="${pageNaviData.currentPage!=i}">
								<form action="/boardAdmin.do" method="post">
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form>
							</c:if>
						</c:forEach>
						<c:if test="${pageNaviData.endNavi!=pageNaviData.pageTotalCount}">
							<form action="/boardAdmin.do" method="post">
								<input type="hidden" name="currentPage"	value="${pageNaviData.endNavi+1}"> 
								<input type="submit"  class="paging-num"  value=">">
							</form>
						</c:if>
					</div>
						</center>
				</c:if>
		
			
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
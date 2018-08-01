<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.ynm.admin.model.vo.*"
	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% YNMAdmin ad = (YNMAdmin)session.getAttribute("admin");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
			</head>
<body>
<header id="admin-login-header">
		<h1>
			<a href="ynmAdmin.do">YamNyaMing 관리자</a>
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
	<form action="Update.do" method="post">
     <div class="container">    
                  <div class="row">
                      <div class="panel panel-default">
                      <div class="panel-heading">  <center><h4 >관리자 정보</h4></div></center>
                       <div class="panel-body">
                      <div class="col-md-4 col-xs-12 col-sm-6 col-lg-4">
                       <img alt="User Pic" src="https://ssl.pstatic.net/mimgnews/image/433/2017/08/30/0000034841_001_20170830102242631.jpg" id="profile-image1" class="img-circle img-responsive" style="height:300px;"> 
                      </div>
                      <div class="col-md-8 col-xs-12 col-sm-6 col-lg-8" >
                          <div class="container" >
          				     
          				      <h2>[${sessionScope.admin.ad_nickname}]님 안녕하세요</h2> 
                          </div>
                           <hr>
                          <ul class="container details" >
                            <li><p><span class="glyphicon glyphicon-user one" style="width:70px;"></span>${sessionScope.admin.ad_id}</p></li>
                            <li><p><span class="glyphicon glyphicon-user one" style="width:70px;"></span>
                      <c:choose>
                      <c:when  test="${sessionScope.admin.ad_id eq 'admin'}">
                      운영자
                      </c:when>
                      <c:otherwise>
                      관리자
                      </c:otherwise>
                      </c:choose>
                            
                            </p></li>
                          </ul>
                          <hr>
                          
         					<c:choose>
      						<c:when test="${sessionScope.admin.ad_id == 'admin'}">
        					<a href="/adminList.do" style="background-color:white; width:300px; height:100px; font-size:35px;  font-family: 'Sunflower'; border:0px solid maroon">관리자 권한 설정</a>
       						</c:when>
     				   	
     				   	    <c:otherwise>
          				         
     					    </c:otherwise>
  					  	    </c:choose>
  							
                      </div>
                </div>
            </div>
            </div>

</form>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/member.css?ver=1">
	<script>
		window.onload = fucntion()
		{
			firstLoadAlert();
		}
		function firstLoadAlert()
		{
			if(typeof Android !=="undefined" && Android !== null){
				Android.firstLoadTest();
			}else{
				alert("Not viewing in webView!!");
			}
			 
		}
	</script>
</head>
<body>
	
	<header id="member-main-header">
		<h1>
			<a href="/index.jsp">YamNyaMing</a>
		</h1>

		<ul>
			<c:if test="${sessionScope.totalRefModel==null}">
				<script>location.href="/totalRefLoad.do"</script>
			</c:if>
			<c:if test="${sessionScope.naver!=null}" var="result">
				<li>${sessionScope.naver.naverNickName}님 환영합니다.</li>
				<li><a href="/memberInfo.do">마이페이지</a></li>
				<li><a href="/logout.do">로그아웃</a></li>
			</c:if>
		
			<c:if test="${sessionScope.member!=null}" var="result">
				<li>${sessionScope.member.memberNickName}님 환영합니다.</li>
				<li><a href="/memberInfo.do">마이페이지</a></li>
				<li><a href="/logout.do">로그아웃</a></li>
			</c:if>

			<c:if test="${sessionScope.owner!=null}" var="result">
				<li>${sessionScope.owner.owName}사장님 환영합니다.</li>
				<li><a href="/ownerMyPage.do">마이페이지</a></li>
				<li><a href="/ownerLogout.do">로그아웃</a></li>
			</c:if>
			<c:if test="${sessionScope.owner==null && sessionScope.member==null && sessionScope.naver==null}" var="result">
				<li><a href="/loginMember.do">로그인</a></li>
				<li><a href="/enrollMember.do">회원가입</a></li>
			</c:if>
		</ul>
		<h2>
			맛있는 가이드, <span>얌냐밍</span>
		</h2>
		<form action="/search.do" method="get">
			<input type="hidden" name="place" value="홍대"> 
			<input type="text" name="keyword" placeholder="키워드를 입력해주세요"> 
			<input type="submit" value="검색">
		</form>
	</header>
	<section id="member-main-section">
		<article>
			<h3>얌냐밍과 함께 찾는 맛집</h3>
			<p>
				기다리지 않는 즐거움, <span>얌냐밍이 진짜 맛집을 추천합니다</span>
			</p>
		</article>
		<article>
			<div>
				<a href="/search.do?food=한식">한식</a>
			</div>
			<div>
				<a href="/search.do?food=양식">양식</a>
			</div>
			<div>
				<a href="/search.do?food=일식">일식</a>
			</div>
			<div>
				<a href="/search.do?food=중식">중식</a>
			</div>
		</article>
		<article>
			<div>
				<a href="/search.do?food=디저트">디저트</a>
			</div>
			<div>
				<a href="/search.do?food=술집">술집</a>
			</div>
		</article>
	</section>
	<footer id="member-main-footer">
		<div>
			<h2>YamNyaMing</h2>
			<p>Immediately Reservation!</p>
			<address>
				㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
				주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018
				YamNyaMing Co. All rights reserved
			</address>
		</div>
		<c:if test="${sessionScope.owner==null}" var="result">
			<a href="/enrollOwner.do">점장 가입하기</a>
		</c:if>
		<c:if test="${sessionScope.owner!=null}" var="result">
			<a href="/storeEnrollOwner.do">얌냐밍 입점 신청하기</a>
		</c:if>
	</footer>
</body>
</html>



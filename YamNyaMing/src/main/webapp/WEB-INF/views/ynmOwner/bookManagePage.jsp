<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍-예약관리</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<script src="http://code.jquery.com/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=4">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/bookManagePage.css?ver=3">
<link rel='stylesheet' type='text/css' href="${pageContext.request.contextPath}/resources/css/owner/fullcalendar.min.css?ver=3" />
<link rel='stylesheet' type='text/css' href="${pageContext.request.contextPath}/resources/css/owner/fullcalendar.print.min.css?ver=3" media='print' />

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerInfo.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerBookManage.js?ver=3"></script>

<script type='text/javascript' src="${pageContext.request.contextPath}/resources/js/jquery/moment.min.js"></script>
<script type='text/javascript' src="${pageContext.request.contextPath}/resources/js/jquery/jquery.min.js?ver=1"></script>
<script type='text/javascript' src="${pageContext.request.contextPath}/resources/js/owner/fullcalendar.min.js?ver=1"></script>

<style>
	.fc-event, .fc-event-dot {
	    background-color: #fb0;
	}
	.fc-event, .fc-event-dot *{
		color:white;
	}
</style>
<script>

</script>
</head>
<body>
	<header id="owner-main-header">
<a href="/index.jsp"><img src="${pageContext.request.contextPath}/resources/image/plate-white.png" style="width:44px;float:left;margin:10px;"></a>	
		<h1>
			<a href="/ownerMyPage.do">YamNyaMing 관리</a>
		</h1>
		<p>
			<a href="/storeEnrollOwner.do">입점 신청하기</a>
		</p>
		<p>
			${sessionScope.owner.owName} 님 (${sessionScope.owner.owId}) <a href="/index.jsp">로그아웃</a>
		</p>
	</header>
	<nav id="owner-main-nav">
		<ul>
			<li><a href="/ownerInfo.do">정보 관리</a></li>
			<li><a href="/storeManage.do">음식점 관리</a></li>
			<li><a href="/reservationManage.do">예약 관리</a></li>
			<li><a href="/couponManage.do">쿠폰 관리</a></li>
			<li><a href="/boardOwner.do">게시판 관리</a></li>
			<li><a href="/analysisOwner.do">통계 관리</a></li>
		</ul>
	</nav>
	
		<div>
			<c:if test="${storeTitleInfo!=null}">
				<c:forEach var="storeList" items="${storeTitleInfo}">
					<!-- 해당 가게의 정보를 아래에 뿌려줌 -->
					<form action="/storeInfoPage.do" method="post" class="design-card">
						<jsp:include page="storeTitleInfo.jsp">
							<jsp:param name="storeIndex" value="${storeList.owStoreInfoPk}"/>
						  	<jsp:param name="storeName" value="${storeList.owStoreName}"/>
						  	<jsp:param name="storeTip" value="${storeList.owStoreTip}"/>
						  	<jsp:param name="storeAbsRoute" value="${storeList.owPhotoRoute}"/>
						  	<jsp:param name="storePhoto" value="${storeList.owPhotoViewRoute}"/>
						  	<jsp:param name="storeStarPoint" value="${storeList.storeStarPoint}"/>
						  	<jsp:param name="contextRoute" value="${pageContext.request.contextPath}"/>
						</jsp:include>
						<input type="hidden" name="storeIndex" value="${storeList.owStoreInfoPk}">
						<input type="submit" value="${storeList.owStoreName}">
					</form>
				</c:forEach>
			</c:if>
			<!-- 없을 때 -->
			<c:if test="${storeTitleInfo==null}">
				등록된 가게가 없습니다.
			</c:if>
		</div>	
	
	
	<!-- 일반 손님 웨이팅 -->
	<button onclick="watingListLoad();">새로고침(1분마다 새로고침 됩니다.)</button>
 	<div id="waitingList">
           
 	</div>
 	<div id='calendar'></div> 
	<footer id="owner-main-footer">
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
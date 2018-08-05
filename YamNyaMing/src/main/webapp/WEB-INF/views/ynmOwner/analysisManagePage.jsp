<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍-통계분석</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=4">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/owner.js"></script>
</head>
<body>
	<header id="owner-main-header">
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
	<section>
			<div id="main-section-stat">
				<h4>통계</h4>
				<div>
					<canvas id="gender-chart"></canvas>
					<canvas id="year-chart"></canvas>
					<canvas id="time-chart"></canvas>
				</div>
				<script>
				new Chart(document.getElementById("gender-chart"), {
				    type: 'pie',
				    data: {
				      labels: ["남자", "여자"],
				      datasets: [{
				    	label: "성별",
				        backgroundColor: ["#64B5F6", "#E57373"],
				        data: [2005,3006]
				      }]
				    },options: {
				      title: {
				        display: true,
				        text: '성별'
				      }
				    }
				});	
				new Chart(document.getElementById("year-chart"), {
				    type: 'pie',
				    data: {
				      labels: ["10대","20대","30대","40대","50대","60대 이상"],
				      datasets: [{
				        label: "연령대별",
				        backgroundColor: ["#F48FB1", "#B39DDB","#A5D6A7","#FFF59D","#FFCC80","#B0BEC5"],
				        data: [2005,3006,1200,4003,2000,1342]
				      }]
				    },
				    options: {
				      title: {
				        display: false,
				        text: '연령별'
				      }
				    }
				});		
				new Chart(document.getElementById("time-chart"), {
				    type: 'bar',
				    data: {
				      labels: ["3-7시","7-11시","11-15시","15-19시","19-23시","23-3시"],
				      datasets: [{
				        label: "시간대별",
				        backgroundColor: ["#F48FB1", "#B39DDB","#A5D6A7","#FFF59D","#FFCC80","#B0BEC5"],
				        data: [2005,3006,1200,4003,2000,1342]
				      }]
				    },
				    options: {
				      title: {
				        display: false,
				        text: '시간대별'
				      }
				    }
				});					
				</script>
			</div>		
	</section>
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
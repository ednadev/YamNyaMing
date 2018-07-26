<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
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
			<a href="mainOwner.do">YamNyaMing 관리</a>
		</h1>
		<p>
			<a href="storeEnrollOwner.do">입점 신청하기</a>
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
	<section id="owner-main-section">
		<div>
		<div id="main-section-store">
			<h4>음식점 상태 정보</h4>
			<table border="1">
			<thead>
			<tr>
				<th>상호명</th><th>대분류</th><th>소분류</th><th>주소</th><th>전화번호</th><th>진행 상태</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>빠넬로</td><td>양식</td><td>이탈리아음식</td><td>서울특별시 마포구 어울마당로5길 29 건우상가주택</td><td>02-322-0920</td><td>입점</td>
			</tr>
			<tr>
				<td>침사추이누들</td><td>한식</td><td>국수</td><td>서울특별시 마포구 어울마당로5길 31 지층</td><td>02-336-1804</td><td>신청중</td>
			</tr>			
			</tbody>
			</table>
		</div>
		<div id="main-section-board">
			<h4>문의/답변관리</h4>
			<table>
			<tr>
				<th>후기</th><td>0건</td>
			</tr>
			<tr>
				<th>고객문의</th><td>0건</td>
			</tr>			
			</table>
		</div>		
		</div>
		
		<div>
		<div id="main-section-reservation">
			<h4>예약 현황 - 빠넬로 (페이징 처리)</h4>
			<table border="1">
			<thead>
			<tr>
				<th>대기번호</th><th>예약자</th><th>아이디</th><th>연락처</th><th>예약시간</th><th>쿠폰 사용 여부</th><th>예약 상태</th><th>예약 취소</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>1</td><td>곽영훈</td><td>coconut510</td><td>010-8478-4171</td><td>10:30</td><td></td><td>입장가능</td><td>예약 취소</td>
			</tr>
			<tr>
				<td>2</td><td>임시번호1</td><td></td><td>010-0000-0000</td><td>10:35</td><td></td><td>입장가능</td><td>예약 취소</td>
			</tr>			
			<tr>
				<td>3</td><td>김지섭</td><td>kimjiseop2</td><td>010-8478-4171</td><td>10:40</td><td>30% 할인 쿠폰</td><td>대기중</td><td>예약 취소</td>
			</tr>
			<tr>
				<td>4</td><td>임시번호2</td><td></td><td>010-0000-0000</td><td>10:45</td><td></td><td>대기중</td><td>예약 취소</td>
			</tr>
			<tr>
				<td>5</td><td>김미경</td><td>minimelody</td><td>010-9612-0530</td><td>10:50</td><td>생일 쿠폰</td><td>예약 취소</td><td>예약 취소</td>
			</tr>			
			<tr>
				<td>6</td><td>고민호</td><td>zxcv7541</td><td>010-5024-3705</td><td>10:55</td><td></td><td>대기중</td><td>예약 취소</td>
			</tr>												
			</tbody>
			</table>
		</div>	
		<div id="main-section-coupon">
			<h4>등록된 쿠폰</h4>
			<table border="1">
			<thead>
			<tr>
				<th>쿠폰명</th><th>쿠폰 정보</th><th>쿠폰 발급</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>첫 방문 쿠폰</td><td>총 금액의 10% 할인</td><td>발급하기</td>
			</tr>					
			<tr>
				<td>30% 할인 쿠폰</td><td>이벤트 메뉴 30% 할인</td><td>발급하기</td>
			</tr>
			<tr>
				<td>생일 쿠폰</td><td>총 금액의 40% 할인</td><td>발급하기</td>
			</tr>		
			<tr>
				<td>빼빼로데이 쿠폰</td><td>총 금액의 11,000원 할인</td><td>발급하기</td>
			</tr>	
			<tr>
				<td>리뷰 이벤트 쿠폰</td><td>총 금액의 20% 할인</td><td>발급하기</td>
			</tr>																				
			</tbody>
			</table>
		</div>		
		</div>
		
		<div>		
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
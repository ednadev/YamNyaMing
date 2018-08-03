<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import ="com.kh.ynm.admin.model.vo.*"
	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
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

	<section id="admin-main-section">

	<div>
		<div id="main-section-member">
		
			<h4>회원 현황</h4>
			<table border="1">
			<thead>
			<tr>
				<th>날짜</th><th>전체회원</th><th>신규회원</th><th>탈퇴회원</th><th>휴면회원</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>${list.sevenday}</td>
				<td>${list.memall6day
				+list.owall6day
				-list.deleteowsevenday
				-list.deletememsevenday}</td>
				<td>${list.sevendaynewowner+list.sevendaynewmember}</td>
				<td>${list.deleteowsevenday+list.deletememsevenday}</td>
				<td>0</td>
			</tr>
			<tr>
				<td>${list.sixday}</td>
				<td>${list.memall5day
				+list.owall5day
				-list.deleteowsevenday
				-list.deletememsevenday
				-list.deleteowsixday
				-list.deletememsixday}</td>
				<td>${list.sixdaynewowner+list.sixdaynewmember}</td>
				<td>${list.deleteowsixday+list.deletememsixday}</td>
				<td>0</td>
			</tr>
			<tr>
				<td>${list.fiveday}</td>
				<td>${list.memall4day
				+list.owall4day
				-list.deleteowsevenday
				-list.deletememsevenday
				-list.deleteowsixday
				-list.deletememsixday
				-list.deleteowfiveday
				-list.deletememfiveday}</td>
				<td>${list.fivedaynewowner+list.fivedaynewmember}</td>
				<td>${list.deleteowfiveday+list.deletememfiveday}</td>
				<td>0</td>
			</tr>
			<tr>
				<td>${list.fourday}</td>
				<td>${list.memall3day
				+list.owall3day
				-list.deleteowsevenday
				-list.deletememsevenday
				-list.deleteowsixday
				-list.deletememsixday
				-list.deleteowfiveday
				-list.deletememfiveday
				-list.deleteowfourday
				-list.deletememfourday}</td>
				<td>${list.fourdaynewowner+list.fourdaynewmember}</td>
				<td>${list.deleteowfourday+list.deletememfourday}</td>
				<td>0</td>
			</tr>
			<tr>
				<td>${list.threeday}</td>
				<td>${list.memall2day
				+list.owall2day
				-list.deleteowsevenday
				-list.deletememsevenday
				-list.deleteowsixday
				-list.deletememsixday
				-list.deleteowfiveday
				-list.deletememfiveday
				-list.deleteowfourday
				-list.deletememfourday
				-list.deleteowthreeday
				-list.deletememthreeday}</td>
				<td>${list.threedaynewmember+list.threedaynewowner}</td>
				<td>${list.deleteowthreeday+list.deletememthreeday}</td>
				<td>0</td>
			</tr>
			<tr>
				<td>${list.yesterday}</td>
				<td>${list.memallyesterday
				+list.owallyesterday
				-list.deleteowsevenday
				-list.deletememsevenday
				-list.deleteowsixday
				-list.deletememsixday
				-list.deleteowfiveday
				-list.deletememfiveday
				-list.deleteowfourday
				-list.deletememfourday
				-list.deleteowthreeday
				-list.deletememthreeday
				-list.deleteowyestermemday
				-list.deleteyestermemday}</td>
				<td>${list.yesterdaynewowner+list.yesternewmember}</td>
				<td>${list.deleteowyestermemday+list.deleteyestermemday}</td>
				<td>0</td>
			</tr>
			<tr>
				<td>${list.today}</td>
				<td>${list.memalltoday
				+list.owalltoday
				-list.deleteowsevenday
				-list.deletememsevenday
				-list.deleteowsixday
				-list.deletememsixday
				-list.deleteowfiveday
				-list.deletememfiveday
				-list.deleteowfourday
				-list.deletememfourday
				-list.deleteowthreeday
				-list.deletememthreeday
				-list.deleteowyestermemday
				-list.deleteyestermemday
				-list.deleteowtoday
				-list.deletememtoday}</td>
				<td>${list.todaynewowner+list.todaynewmember}</td>
				<td>${list.deleteowtoday+list.deletememtoday}</td>
				<td>0</td>
			</tr>				
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">7일합계</td>
				<td>${list.member7day+list.owner7day}</td>
				<td>${list.deletemem7day+list.deleteow7day}</td>
				<td>0</td>
			</tr>
			<tr>
				<td colspan="2">15일합계</td>
				<td>${list.member15day+list.owner15day}</td>
				<td>${list.deletemem15day+list.deleteow15day}</td>
				<td>0</td>
			</tr>	
			<tr>
				<td colspan="2">30일합계</td>
				<td>${list.member30day+list.owner30day}</td>
				<td>${list.deletemem30day+list.deleteow30day}</td>
				<td>0</td>
			</tr>				
			</tfoot>
			</table>
		</div>
		<div id="main-section-owner">
			<h4>음식점 현황 (Top10)</h4>
			<table border="1" class="sortable" id="tablList" class="tablList">
			<thead>
			<tr>
				<th>상호명</th>
				<th class="sorting">예약수</th>
				<th class="sorting">평점</th>
				<th class="sorting">좋아요</th>
				<th class="sorting">즐겨찾기</th>
			</tr>
			
		
			</thead>

			<tbody>
			<c:forEach items="${list2}" var="store" step="1" end="10">
			<tr>
			<td>${store.name}</td>
			<td><center>${store.book}</center></td>
			<td><center>${store.grade}</center></td>
			<td><center>${store.jjim}</center></td>
			<td><center>${store.favorite}</center></td>
			</tr>
			</c:forEach>																						
			</tbody>
			</table>
		</div>
		
		<div id="admin-main-board">
			<h4>문의/답변관리</h4>
			<table>
			<tr>
				<th>후기</th><td>${list.hugi}건</td>
			</tr>
			<tr>
				<th>고객문의</th><td>${list.userQ}건</td>
			</tr>
			<tr>
				<th>점장문의</th><td>${list.ownerQ}건</td>
			</tr>			
			</table>
		</div>	
	</div>
		<div>
			<div id="admin-main-stat">
				<h4>통계</h4>
				<div>
					<canvas id="gender-chart"></canvas>
					<canvas id="year-chart"></canvas>
					<canvas id="time-chart"></canvas>
					<canvas id="store-chart"></canvas>
				</div>
				<script>
				var boy = ${list.boy}
				var girl = ${list.girl}
				new Chart(document.getElementById("gender-chart"), {
				    type: 'pie',
				    data: {
				      labels: ["남자", "여자"],
				      datasets: [{
				    	label: "성별",
				        backgroundColor: ["#64B5F6", "#E57373"],
				        data: [boy,girl]
				      }]
				    },options: {
				      title: {
				        display: true,
				        text: '성별'
				      }
				    }
				});	
				var age1020 = ${list.age1020}
				var age2030 = ${list.age2030}
				var age3040 = ${list.age3040}
				var age4050 = ${list.age4050}
				var age5060 = ${list.age5060}
				var age60 = ${list.age60}
				
				new Chart(document.getElementById("year-chart"), {
				    type: 'pie',
				    data: {
				      labels: ["10대","20대","30대","40대","50대","60대 이상"],
				      datasets: [{
				        label: "연령대별",
				        backgroundColor: ["#F48FB1", "#B39DDB","#A5D6A7","#FFF59D","#FFCC80","#B0BEC5"],
				        data: [age1020,age2030,age3040,age4050,age5060,age60]
				      }]
				    },
				    options: {
				      title: {
				        display: false,
				        text: '연령별'
				      }
				    }
				});		
				var time0910 = ${list.time0910}
				var time1112 = ${list.time1112}
				var time1314 = ${list.time1314}
				var time1516 = ${list.time1516}
				var time1718 = ${list.time1718}
				var time1924 = ${list.time1924}
				new Chart(document.getElementById("time-chart"), {
				    type: 'bar',
				    data: {
				      labels: ["3-7시","7-11시","11-15시","15-19시","19-23시","23-3시"],
				      datasets: [{
				        label: "시간대별",
				        backgroundColor: ["#F48FB1", "#B39DDB","#A5D6A7","#FFF59D","#FFCC80","#B0BEC5"],
				        data: [time0910,time1112,time1314,time1516,time1718,time1924]
				      }]
				    },
				    options: {
				      title: {
				        display: false,
				        text: '시간대별'
				      }
				    }
				});	
				
				var korea = ${list.korea}
				var china = ${list.china}
				var japan = ${list.japan}
				var usa = ${list.usa}
				var dessert = ${list.dessert}
				var sul = ${list.bar}
				var buffet = ${list.buffet}
				var gita = ${list.other}
				
				new Chart(document.getElementById("store-chart"), {
				    type: 'bar',
				    data: {
				      labels: ["한식","중식","일식","양식","디저트","술집","뷔페","기타"],
				      datasets: [{
				        label: "업종별",
				        backgroundColor: ["#B39DDB","#A5D6A7","#FFF59D","#FFCC80","#B0BEC5","yellow","red","blue"],
				        data: [korea,china,japan,usa,dessert,sul,buffet,gita]
				      }]
				    },
				    options: {
				      title: {
				        display: false,
				        text: '업종별'
				      }
				    }
				});	
	
				</script>
			</div>

		</div>
	</section>
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
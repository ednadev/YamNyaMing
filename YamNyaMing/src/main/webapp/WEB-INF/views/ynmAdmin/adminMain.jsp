<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<td>${list.sevenday}</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>${list.sixday}</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>${list.fiveday}</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>${list.fourday}</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>${list.threeday}</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>${list.YESTERDAY}</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>${list.today}</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>				
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">7일합계</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td colspan="2">15일합계</td><td>0</td><td>0</td><td>0</td>
			</tr>	
			<tr>
				<td colspan="2">30일합계</td><td>0</td><td>0</td><td>0</td>
			</tr>				
			</tfoot>
			</table>
		</div>
		<div id="main-section-owner">
			<h4>음식점 현황 (Top10)</h4>
			<table border="1" class="sortable">
			<thead>
			<tr>
				<th>상호명</th><th class="sorting">예약수</th><th class="sorting">평점</th><th class="sorting">추천수</th><th class="sorting">즐겨찾기</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>피에르 가니에르 서울</td><td>41</td><td>4.5</td><td>219</td><td>68</td>
			</tr>
			<tr>
				<td>더 파크뷰</td><td>28</td><td>5.0</td><td>157</td><td>14</td>
			</tr>	
			<tr>
				<td>야마야 (여의도점)</td><td>35</td><td>4.0</td><td>16</td><td>14</td>
			</tr>
			<tr>
				<td>청미심</td><td>28</td><td>4.0</td><td>72</td><td>19</td>
			</tr>
			<tr>
				<td>장 스테이크 하우스</td><td>35</td><td>3.5</td><td>86</td><td>25</td>
			</tr>
			<tr>
				<td>하동관 (여의도직영1호점)</td><td>1</td><td>4.0</td><td>16</td><td>11</td>
			</tr>
			<tr>
				<td>할매집</td><td>6</td><td>3.5</td><td>89</td><td>4</td>
			</tr>
			<tr>
				<td>비스트로 드 욘트빌</td><td>14</td><td>4.5</td><td>86</td><td>1070</td>
			</tr>
			<tr>
				<td>뎐</td><td>14</td><td>3.5</td><td>15</td><td>4</td>
			</tr>
			<tr>
				<td>사대부집 곳간</td><td>11</td><td>3.5</td><td>64</td><td>35</td>
			</tr>																										
			</tbody>
			</table>
		</div>
		<div id="admin-main-board">
			<h4>문의/답변관리</h4>
			<table>
			<tr>
				<th>후기</th><td>0건</td>
			</tr>
			<tr>
				<th>고객문의</th><td>0건</td>
			</tr>
			<tr>
				<th>점장문의</th><td>0건</td>
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
				new Chart(document.getElementById("store-chart"), {
				    type: 'bar',
				    data: {
				      labels: ["한식","중식","일식","양식","디저트"],
				      datasets: [{
				        label: "업종별",
				        backgroundColor: ["#B39DDB","#A5D6A7","#FFF59D","#FFCC80","#B0BEC5"],
				        data: [2005,3006,1200,4003,2000]
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
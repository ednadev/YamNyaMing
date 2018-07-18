<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>

</head>
<body>
	<header id="admin-login-header">
		<h1>
			<a href="ynmAdmin.do">YamNyaMing 관리자</a>
		</h1>
		<p>
			[닉네임]님 ([아이디]) <a href="logoutAdmin.do">로그아웃</a>
		</p>
	</header>
	<nav id="admin-main-nav">
		<ul>
			<li><a href="adminInfo.do">관리자 정보</a></li>
			<li><a href="memberManager.do">회원 관리</a></li>
			<li><a href="ownerManager.do">점장 관리</a></li>
			<li><a href="boardAdmin.do">게시판</a></li>
			<li><a href="statAdmin.do">통계</a></li>
		</ul>
	</nav>
	<section id="admin-main-section">
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
				<td>07/12</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>07/13</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>07/14</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>07/15</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>07/16</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>07/17</td><td>0</td><td>0</td><td>0</td><td>0</td>
			</tr>
			<tr>
				<td>07/18</td><td>0</td><td>0</td><td>0</td><td>0</td>
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
			<table border="1">
			<thead>
			<tr>
				<th>상호명</th><th>예약수</th><th>평점</th><th>추천수</th><th>즐겨찾기</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>볼트스테이크하우스</td><td>100</td><td>4.1</td><td>521</td><td>3</td>
			</tr>
			<tr>
				<td>보칼리노</td><td>56</td><td>3.9</td><td>502</td><td>7</td>
			</tr>	
			<tr>
				<td>하우스</td><td>100</td><td>4.1</td><td>521</td><td>3</td>
			</tr>
			<tr>
				<td>볼트스테이크하우스</td><td>100</td><td>4.1</td><td>521</td><td>3</td>
			</tr>
			<tr>
				<td>볼트스테이크하우스</td><td>100</td><td>4.1</td><td>521</td><td>3</td>
			</tr>
			<tr>
				<td>볼트스테이크하우스</td><td>100</td><td>4.1</td><td>521</td><td>3</td>
			</tr>
			<tr>
				<td>볼트스테이크하우스</td><td>100</td><td>4.1</td><td>521</td><td>3</td>
			</tr>
			<tr>
				<td>볼트스테이크하우스</td><td>100</td><td>4.1</td><td>521</td><td>3</td>
			</tr>
			<tr>
				<td>볼트스테이크하우스</td><td>100</td><td>4.1</td><td>521</td><td>3</td>
			</tr>
			<tr>
				<td>볼트스테이크하우스</td><td>100</td><td>4.1</td><td>521</td><td>3</td>
			</tr>																										
			</tbody>
			</table>
		</div>
		
		
		
		
		<div>
			<div id="admin-main-stat">
				<h4>통계</h4>
				<canvas id="pie-chart" width="800" height="450"></canvas>

			</div>
			<div id="admin-main-stat">
				<h4>게시판</h4>
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
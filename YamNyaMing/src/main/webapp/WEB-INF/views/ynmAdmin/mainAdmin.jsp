<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner.css?ver=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/prettydropdowns?ver=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner.js?ver=1"></script>
</head>
<body>
	<header id="owner-signUp-header">
		<h1><a href="/index.jsp">YamNyamCompany</a></h1>
	</header>
	<div class="wrapper">
		<nav id="owner-signUp-nav">
			<h2>입점 신청하기</h2>
			<p>01 약관 동의 > 02 계정 정보 입력 > <span>03 음식점 정보 입력</span></p>
		</nav>
		<form action="joinusOwner.do" method="post">
			<section id="owner-signUp-section">	
				<h3>음식점 정보 입력</h3>	
				<div class="signUp-table">
					<div>사업자 등록번호</div>
					<div>
						<input type="text" name="owStoreBizNum" placeholder="사업자 등록번호">
						<p>사업자 등록번호를 입력해주세요.</p>
					</div>
				</div>	
				<div class="signUp-table">
					<div>상호명</div>
					<div>
						<input type="text" name="owStoreName" placeholder="상호명">
						<p>상호명을 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>전화번호</div>
					<div>
						<input type="tel" name="owTel" placeholder="전화번호">
						<p>연락 가능한 전화번호를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>휴대폰</div>
					<div>
						<input type="tel" name="owPhone" placeholder="휴대폰">
						<p>연락 가능한 휴대폰 번호를 입력해주세요.</p>
					</div>
				</div>	
				<div class="signUp-table">
					<div>업종</div>
					<div>
						<select name="owStoreBigType" id="firstSelect" onchange="changeSelect()">
							<option>대분류</option>
						</select>
						<select name="owStoreSmallType" id="finalSelect">
							<option>소분류</option>
						</select>
					</div>
				</div>				
				<div class="signUp-table">
					<div>웹사이트</div>
					<div>
						<input type="url" name="owStoreUrl" placeholder="웹사이트">
						<p>웹사이트를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>주소</div>
					<div>
						<input type="text" name="owStoreMapinfo" placeholder="주소">
						<p>주소를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>영업시간</div>
					<div>
						<input type="time" name="owStoreWorkingTime">
						<p>영업시간을 입력해주세요.</p>
					</div>
				</div>	
				<h3>상세 정보 입력</h3>	
				<div class="signUp-table">
					<div>Tip</div>
					<div>
						<input type="text" name="owStoreTip" placeholder="최대 5개까지 입력 가능">
					</div>
				</div>				
				<div class="signUp-table">
					<div>추천메뉴</div>
					<div>
						<input type="text" name="owRecommandMenu" placeholder="추천 메뉴 입력">
					</div>
				</div>	
				<div class="signUp-table">
					<div>테이블 정보</div>
					<div>
						<input type="text" name="owStoreTableInfo" placeholder="테이블 정보 입력 (최대 인원)">
					</div>
				</div>	
				<div class="signUp-table">
					<div>예산 정보</div>
					<div>
						<input type="text" name="owBudget" placeholder="예산 정보 입력">
					</div>
				</div>	
				<div class="signUp-table">
					<div>부가 정보</div>
					<div>
						<input type="text" name="owSubInfo" placeholder="부가 정보 입력 (ex. 아이동반 가능여부, 연장영업, 기타 정보사항 )">
					</div>
				</div>	
				<div class="signUp-table">
					<div>주류 정보</div>
					<div>
						<input type="text" name="owDrinkListInfo" placeholder="주류 정보 입력">
					</div>
				</div>																																																										
			</section>
			<input type="submit" value="입점 신청하기">
		</form>
	</div>
	<footer id="owner-signUp-footer">
		<div>
			<h2>YamNyaMing</h2>
			<p>Immediately Reservation!</p>
			<address>㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
			주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018 YamNyaMing Co. All rights reserved</address>
		</div>
	</footer>
</body>
</html>
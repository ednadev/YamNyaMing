<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=1">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owner/ownerInfo.css?ver=4">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/prettydropdowns?ver=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/owner/owner.js?ver=1"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/owner/ownerInfo.js?ver=1"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/owner/ownerSignUp.js?ver=1"></script>
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
		${sessionScope.owner.owName} 님 (${sessionScope.owner.owId}) <a
			href="/index.jsp">로그아웃</a>
	</p>
	</header>
	<nav id="owner-main-nav">
	<ul>
		<li><a href="/ownerInfo.do" style="border-bottom:3px solid #fb0;">정보 관리</a></li>
		<li><a href="/storeManage.do">음식점 관리</a></li>
		<li><a href="/reservationManage.do">예약 관리</a></li>
		<li><a href="/couponManage.do">쿠폰 관리</a></li>
		<li><a href="/boardOwner.do">게시판 관리</a></li>
		<li><a href="/analysisOwner.do">통계 관리</a></li>
	</ul>
	</nav>
	<div class="wrapper">
		<c:if test="${sessionScope.ownerReCheck!=null}">
			<h2 id="ownerInfoTitleResult">[${sessionScope.owner.owName}]사장님의 정보관리</h2>
			<form action="/ownerInfoUpdate.do" method="post">
				<section id="owner-signUp-section">
				<h3>계정 정보</h3>
				<div class="signUp-table">
					<div>아이디</div>
					<div>
						<input type="text" name="owId" placeholder="아이디"
							value=${sessionScope.owner.owId } readonly>
						<p></p>
					</div>
				</div>
				<div class="signUp-table">
					<div>비밀번호</div>
					<div>
						<input type="password" name="owPw" placeholder="비밀번호"
							onchange="owPwCheck();" onkeydown="owPwCheck();">
						<p id="owPwResult">특수문자(예: !@#$ 등) 1자 이상을 포함한 8~15 글자의 비밀번호로
							설정해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>비밀번호 재입력</div>
					<div>
						<input type="password" name="owPw2" placeholder="비밀번호 재입력"
							onchange="ownerPwReChk();" onkeydown="ownerPwReChk();">
						<p id="ownerPwReChk">비밀번호를 재입력 해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>이름</div>
					<div>
						<input type="text" name="owName" placeholder="이름"
							value=${sessionScope.owner.owName } readonly>
						<p></p>
					</div>
				</div>
				<div class="signUp-table">
					<div>이메일</div>
					<div>
						<input type="email" name="owEmail" placeholder="이메일" value="${sessionScope.owner.owEmail}"
							onkeydown="ownerEmailChk();" onchange="ownerEmailChk();">
						<p id="ownerEmailChk">이메일을 입력해주세요.</p>
						<br> <input type="text" id="emailConfirmInput"
							placeholder="인증번호 입력" onchange="emailKeyMatchCheck();"
							onkeydown="emailKeyMatchCheck();" style="display: none" />
					</div>
				</div>
				<div class="signUp-table">
					<div>휴대폰</div>
					<div>
						<input type="tel" name="phone" value="${sessionScope.owner.phone}" placeholder="휴대폰">
						<p>연락 가능한 휴대폰 번호를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>계좌번호</div>
					<div>
						<input type="text" name="owBankAccount" value="${sessionScope.owner.owBankAccount}" placeholder="계좌번호">
						<p>계좌번호를 입력해주세요.</p>
					</div>
				</div>
				</section>
				<input type="submit" value="회원 정보 변경">
			</form>
		</c:if>
		<c:if test="${sessionScope.ownerReCheck==null}">
			<h2 id="ownerInfoTitle">[${sessionScope.owner.owName}]사장님의 정보관리</h2>
			<form action="/ownerIdPassChk.do" method="post">
				<div id="ownerPassReCheckDiv">
					<div class="signUp-table" style="margin-left:0px;padding-bottom:0px;">
						<div>아이디</div>
						<div>
							<input type="text" name="owIdBeforeCheck" placeholder="아이디"
								value=${sessionScope.owner.owId } readonly style="width:150px;">
							<p></p>
						</div>
					</div>
					<div class="signUp-table" style="margin-left:0px;">
						<div>비밀번호</div>
						<div>
							<input type="password" name="owPwBeforeCheck" placeholder="비밀번호" style="width:150px;">
						</div>
					</div>
					<p style="font-size:0.9em;text-align:left;margin-right:80px;">비밀번호를 한번더 입력해주세요</p>
					<input type="submit" id="infoChangeBeforeCheck" value="정보 수정하러 가기">
				</div>
			</form>
		</c:if>
	</div>
	<c:if test="${sessionScope.ownerReCheck!=null}">
		<footer id="owner-main-footer">
			<h2>YamNyaMing</h2>
			<p>Immediately Reservation!</p>
			<address>
				㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
				주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018
				YamNyaMing Co. All rights reserved
			</address>
		</footer>	
	</c:if>
	<c:if test="${sessionScope.ownerReCheck==null}">
		<footer id="owner-fixed-footer">
		<h2>YamNyaMing</h2>
		<p>Immediately Reservation!</p>
		<address>
			㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
			주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018 YamNyaMing
			Co. All rights reserved
		</address>
		</footer>
	</c:if>
</body>
</html>
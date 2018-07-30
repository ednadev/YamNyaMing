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
	href="${pageContext.request.contextPath}/resources/css/member/member.css?ver=2">
<script src="http://code.jquery.com/jquery.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/login.css?ver=2">
<script
	src="${pageContext.request.contextPath}/resources/js/member/member.js?ver=2"></script>
</head>
<script>
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
	$(document).ready(function() {
		var memberId = getCookie("memberId");
		$("input[name='memberId']").val(memberId);

		if ($("input[name='memberId']").val() != "") {
			$("#idCheck").attr("checked", true);
		}

		$("#idCheck").change(function() { // 체크박스에 변화가 있다면,
			if ($("#idCheck").is(":checked")) { // ID 저장하기 체크했을 때,
				var memberId = $("input[name='memberId']").val();
				setCookie("memberId", memberId, 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("memberId");
			}
		});

		$("input[name='memberId']").keyup(function() {
			console.log("ㅎㅇ2");
			if ($("#idCheck").is(":checked")) {
				var memberId = $("input[name='memberId']").val();
				setCookie("memberId", memberId, 7);
			}
		});
	});

	function naverLogin() {
		var windowW = 600; // 창의 가로 길이
		var windowH = 800; // 창의 세로 길이
		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);

		window.open("/naverlogin.do", "pop_01", "l top=" + top + ", left="
				+ left + ", height=" + windowH + ", width=" + windowW);
	}
	function idSearch() {
		var windowW = 400; // 창의 가로 길이
		var windowH = 400; // 창의 세로 길이
		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);

		window.open("/idSearchPage.do", "pop_01", "l top=" + top + ", left="
				+ left + ", height=" + windowH + ", width=" + windowW);
	}
	
	function pwSearch() {
		var windowW = 400; // 창의 가로 길이
		var windowH = 400; // 창의 세로 길이
		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2);

		window.open("/pwSearchPage.do", "pop_01", "l top=" + top + ", left="
				+ left + ", height=" + windowH + ", width=" + windowW);
	}
</script>
<body>
	<header id="member-signUp-header">
		<h1>
			<a href="/index.jsp">YamNyaMing</a>
		</h1>
	</header>
	<section id="member-login-section">
		<h2>로그인</h2>
		<form action="/login.do" method="post" id="loginForm">
			<p>
				<input type="radio" name="loginSelect" id="memberSelect"
					value="member" checked onclick="radioLoginType(this);"><label
					for="memberSelect">사용자</label> <input type="radio"
					name="loginSelect" id="ownerSelect" value="owner"
					onclick="radioLoginType(this);"><label for="ownerSelect">점장</label>
			</p>
			<input type="text" name="memberId" id="memeberId" placeholder="아이디">
			<input type="password" name="memberPw" placeholder="비밀번호">
			<p>
				<input type="checkbox" id="idCheck"><label for="idCheck">아이디
					기억하기</label>
			</p>
			<input type="submit" value="로그인">
		</form>
		<p>
			<a href="" onclick="idSearch();">아이디 찾기</a> &nbsp;|&nbsp; <a
				href="" onclick="pwSearch();">비밀번호 찾기</a>
		</p>
		<div>
			<p>
				<img
					src="${pageContext.request.contextPath}/resources/image/member/login/facebookLoginIcon.jpg"
					height="40px;" align="center">
			</p>
			<p>
				<img
					src="${pageContext.request.contextPath}/resources/image/member/login/googleLoginIcon.jpg"
					height="40px;" align="center">
			</p>
			<p onclick="naverLogin();">
				<img
					src="${pageContext.request.contextPath}/resources/image/member/login/naverLoginIcon.jpg"
					height="40px;" align="center">
			</p>
		</div>
	</section>
	<footer id="member-login-footer">
		<div>
			<h2>YamNyaMing</h2>
			<p>Immediately Reservation!</p>
			<address>
				㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
				주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018
				YamNyaMing Co. All rights reserved
			</address>
		</div>
		<a href="/enrollOwner.do">점장 가입하기</a>
	</footer>
</body>
</html>
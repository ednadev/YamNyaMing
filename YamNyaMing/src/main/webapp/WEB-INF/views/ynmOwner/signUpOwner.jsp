<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/prettydropdowns?ver=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/owner.js?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerSignUp.js?ver=1"></script>

</head>
<body>
	<header id="owner-signUp-header">
		<h1><a href="/index.jsp">YamNyamCompany</a></h1>
	</header>
	<div class="wrapper">
		<nav id="owner-signUp-nav">
			<h2>점장 가입하기</h2>
			<p>01 약관 동의 > <span>02 정보 입력</span></p>
		</nav>
        <form action="/ownerSignUp.do" method="post">
			<section id="owner-signUp-section">
				<h3>계정 정보 입력</h3>
				<div class="signUp-table">
					<div>아이디</div>
					<div>
                        <input type="text" name="owId" placeholder="아이디" onchange="ownerIdChk();" onkeydown="ownerIdChk();">
                        <p id="owIdResult">아이디를 입력해주세요. 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>비밀번호</div>
					<div>
                        <input type="password" name="owPw" placeholder="비밀번호" onchange="owPwCheck();" onkeydown="owPwCheck();">
                        <p id="owPwResult">특수문자(예: !@#$ 등) 1자 이상을 포함한 8~15 글자의 비밀번호로 설정해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>비밀번호 재입력</div>
					<div>
                        <input type="password" name="owPw2" placeholder="비밀번호 재입력" onchange="ownerPwReChk();" onkeydown="ownerPwReChk();">
                        <p id="ownerPwReChk">비밀번호를 재입력 해주세요.</p>
					</div>
				</div>	
				<div class="signUp-table">
					<div>이름</div>
					<div>
                        <input type="text" name="owName" placeholder="이름" onkeydown="ownerNameChk();" onchange="ownerNameChk();">
                        <p id="ownerNameChk">이름을 입력해주세요. 영문 혹은 한글2~15자 이내로 입력해주세요.</p>
					</div>
				</div>								
				<div class="signUp-table">
					<div>이메일</div>
					<div>
                        <input type="email" name="owEmail" placeholder="이메일" onkeydown="ownerEmailChk();" onchange="ownerEmailChk();">
						<p id="ownerEmailChk">이메일을 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>휴대폰</div>
					<div>
                        <input type="tel" name="phone" placeholder="휴대폰">
						<p>연락 가능한 휴대폰 번호를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>계좌번호</div>
					<div>
						<input type="text" name="owBankAccount" placeholder="계좌번호">
						<p>계좌번호를 입력해주세요.</p>
					</div>
				</div>																													
			</section>
			<input type="submit" value="가입신청">
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
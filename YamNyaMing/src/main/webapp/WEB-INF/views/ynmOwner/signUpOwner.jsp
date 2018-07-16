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
</head>
<body>
	<header id="owner-signUp-header">
		<h1><a href="/index.jsp">YamNyamCompany</a></h1>
	</header>
	<div class="wrapper">
		<nav id="owner-signUp-nav">
			<h2>입점 신청하기</h2>
			<p>01 약관 동의 > <span>02 정보입력</span></p>
		</nav>
		<section id="owner-signUp-section">
			<form action="signUpOwnder.do" method="post">
				<h3>계정 정보 입력</h3>
				<div class="signUp-table">
					<div>아이디</div>
					<div>
						<input type="text" name="mbId" placeholder="아이디">
						<p>아이디를 입력해주세요. 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>비밀번호</div>
					<div>
						<input type="password" name="mbPw" placeholder="비밀번호">
						<p>특수문자(예: !@#$ 등) 1자 이상을 포함한 8~15 글자의 비밀번호로 설정해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>비밀번호 재입력</div>
					<div>
						<input type="password" name="mbPw2" placeholder="비밀번호 재입력">
						<p>비밀번호를 재입력 해주세요.</p>
					</div>
				</div>	
				<div class="signUp-table">
					<div>이름</div>
					<div>
						<input type="text" name="mbName" placeholder="이름">
						<p>이름을 입력해주세요. 영문 혹은 한글2~15자 이내로 입력해주세요.</p>
					</div>
				</div>								
				<div class="signUp-table">
					<div>이메일</div>
					<div>
						<input type="email" name="mbEmail" placeholder="이메일">
						<p>이메일을 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>휴대폰</div>
					<div>
						<input type="tel" name="mbEmail" placeholder="휴대폰">
						<p>연락 가능한 휴대폰 번호를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>계좌번호</div>
					<div>
						<input type="text" name="mbName" placeholder="계좌번호">
						<p>계좌번호를 입력해주세요.</p>
					</div>
				</div>				
				<h3>음식점 정보 입력</h3>			
			</form>
		</section>
	</div>
	<footer>
		
	</footer>
</body>
</html>
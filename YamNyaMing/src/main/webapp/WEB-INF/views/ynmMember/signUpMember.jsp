<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css?ver=1">
</head>
<body>
	<header id="member-signUp-header">
		<h1><a href="/index.jsp">YamNyaMing</a></h1>
	</header>
	<section id="member-signUp-section">
		<form action="signUpMember.do" method="post">
			<h2>회원가입</h2>
			<div class="signUp-table">
				<div>휴대전화인증</div>
				<div>
					<input type="hidden" name="mbPhone" value="">
					<button>휴대전화인증</button>
					<p>회원님의 보안 강화 및 편리한 서비스를 제공해 드리기 위해 휴대전화 인증을 하고 있습니다.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>아이디</div>
				<div>
					<input type="text" name="mbId" placeholder="아이디">
					<p>얌냐밍에서 이용하실 아이디를 입력해주세요. 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>비밀번호</div>
				<div>
					<input type="password" name="mbPw" placeholder="비밀번호">
					<input type="password" name="mbPw2" placeholder="비밀번호 확인">
					<p>특수문자(예: !@#$ 등) 1자 이상을 포함한 8~15 글자의 비밀번호로 설정해주세요.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>이름</div>
				<div>
					<input type="text" name="mbName" placeholder="이름">
					<p>얌냐밍에서 회원정보로 등록하실 이름을 입력해주세요. 영문 혹은 한글2~15자 이내로 입력해주세요.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>닉네임</div>
				<div>
					<input type="text" name="mbNickname" placeholder="닉네임">
					<p>얌냐밍에서 이용하실 닉네임을 입력해주세요.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>성별</div>
				<div id="genderStyle">
					<div class="genderRadio">
						<input type="radio" id="male" name="mbGender" value="M">
						<label for="male">남자</label>
					</div>
					<div class="genderRadio">
						<input type="radio" id="female" name="mbGender" value="F">
						<label for="female">여자</label>
					</div>	
				</div>			
			</div>
			<div class="signUp-table">
				<div>생년월일</div>
				<div id="birthStyle">
					<input type="text" name="mbBirthYear" placeholder="생년 (4자)">
					<input type="text" name="mbBirthMonth" placeholder="월">
					<input type="text" name="mbBirthDay" placeholder="일">
					<p>생년월일을 입력해주세요.</p>
				</div>
			</div>
			<div class="signUp-table">
				<div>이메일</div>
				<div>
					<input type="email" name="mbEmail" placeholder="이메일">
					<p>얌냐밍에서 이용하실 이메일을 입력해주세요.</p>
				</div>
			</div>
			<div class="signUp-table" id="table-bottom">
				<div>프로필 사진</div>
				<div>
					<div id="profileStyle">
						<div id="profile-img"></div>
						<div>
							<label for="profile-file">찾아보기</label>
							<input type="file" name="myAvatar" id="profile-file">
						</div>
					</div>
					<p id="profileText">얌냐밍의 회원 프로필 사진으로 사용될 이미지를 등록해 주세요.</p>
				</div>
			</div>
			
			<h2>이용약관</h2>
			<div id="check-table">
				<div class="check">
					<input type="checkbox" id="check1">
					<label for="check1">이용약관</label>
				</div>
				<div class="check">
					<input type="checkbox" id="check2">
					<label for="check2">개인정보 취급방침</label>
				</div>
				<div class="check">
					<input type="checkbox" id="check3">
					<label for="check3">위치기반 서비스 이용약관</label>
				</div>
			</div>
			<div class="all-check">
				<input type="checkbox" id="allCheck">
				<label for="allCheck">전체동의</label>
			</div>
			<input type="submit" value="회원가입하기">
		</form>
	</section>
	<footer id="member-main-footer">
		<div>
			<h2>YamNyaMing</h2>
			<p>Immediately Reservation!</p>
			<address>㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
			주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018 YamNyaMing Co. All rights reserved</address>
		</div>
		<a href="/signUpOwner.do">얌냐밍 입점 신청하기</a>
	</footer>
</div>
</body>
</html>
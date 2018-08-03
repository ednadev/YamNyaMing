<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/login.css?ver=2">
<title>Insert title here</title>
</head>
<body>

	<section id="member-login-section" style="padding-top:0px;">
		<h2 style="margin-top:0px;padding-top:52px;margin-bottom:20px;">비밀번호 재설정</h2>
		<p style="color:black;margin-left:40px;margin-right:40px;margin-bottom:20px;line-height:1.5;">가입하신 계정의 이메일을 입력해주세요.임의로 설정된 새로운 비밀번호가 메일로 전송됩니다.</p>
		<form action="/pwSearch.do" method="post" id="pwSearchForm">
			<p>
				<input type="radio" name="loginSelect" id="memberSelect"
					value="member" checked onclick="radioPwSearchType(this);"><label
					for="memberSelect">사용자</label> <input type="radio"
					name="loginSelect" id="ownerSelect" value="owner"
					onclick="radioPwSearchType(this);"><label for="ownerSelect">점장</label>
			</p>
			<input type="text" name="memberId" placeholder="아이디">
			<input type="text" name="memberEmail" placeholder="이메일">

			<input type="submit" value="비밀번호 재설정">
		</form>
	</section>
</body>
</html>
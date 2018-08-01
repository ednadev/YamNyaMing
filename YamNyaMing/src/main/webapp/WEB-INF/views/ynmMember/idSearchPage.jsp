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

	<section id="member-login-section">
		<h2>아이디 찾기</h2>
		<form action="/memberIdSearch.do" method="post" id="idSearchForm">
			<p>
				<input type="radio" name="loginSelect" id="memberSelect"
					value="member" checked onclick="radioIdSearchType(this);"><label
					for="memberSelect">사용자</label> <input type="radio"
					name="loginSelect" id="ownerSelect" value="owner"
					onclick="radioIdSearchType(this);"><label for="ownerSelect">점장</label>
			</p>
			<input type="text" name="memberEmail" placeholder="이메일">
			<input type="text" name="memberName" placeholder="이름">
			<input type="submit" value="아이디 찾기">
		</form>
	</section>
</body>
</html>
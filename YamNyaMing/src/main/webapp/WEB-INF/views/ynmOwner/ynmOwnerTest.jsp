<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>점주 쿼리 테스트 페이지</title>

<!-- 점주 인덱스 페이지 js  -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/ownerTest.js"></script>
</head>
<body>
    <h2>점주 회원가입</h2>
	<form action="/ownerSignUp.do" method="post">
		ID : <input type="text" name="owId" onchange="ownerIdChk();"/><span id="ownerIdChk"></span><br>
		PW : <input type="password" name="owPw"/><span id="ownerPwChk"></span><br>
		PW : <input type="password" name="owPwRe"/><span id="ownerPwReChk"></span><br>
		Name : <input type="text" name="owName"/><br>
		email : <input type="email" name="owEmail"/><span id="ownerEmailChk"></span><br>
		phone : <input type="text" name="phone"/><br>
		bankAcc : <input type="text" name="owBankAccount"/><br>
		<input type="submit" value="점주 가입"/><br>
	</form>
	<hr>
	<form action="/ownerIdChk.do" method="post">
		<input type="submit" value="테스트"/>
	</form>
	<a href=""></a>
</body>
</html>
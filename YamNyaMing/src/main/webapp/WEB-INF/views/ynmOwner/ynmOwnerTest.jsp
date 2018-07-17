<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>점주 쿼리 테스트 페이지</title>

<!-- 점주 인덱스 페이지 js  -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/ownerTest.js?ver=1"></script>
</head>
<body>
    <h2>점주 회원가입</h2>
	<form action="/ownerSignUp.do" method="post">
		ID : <input type="text" name="owId" onchange="ownerIdChk();"/><span id="ownerIdChk"></span><br>
		PW : <input type="password" name="owPw" onchange="ownerPwChk();"/><span id="ownerPwChk"></span><br>
		PW : <input type="password" name="owPwRe" onchange="ownerPwReChk();"/><span id="ownerPwReChk"></span><br>
		Name : <input type="text" name="owName" onchange="ownerNameChk();"/><span id="ownerNameChk"></span><br>
		email : <input type="text" name="owEmail" onchange="ownerEmailChk();"/><span id="ownerEmailChk"></span><br>
		phone : <input type="text" name="phone"/><br>
		bankAcc : <input type="text" name="owBankAccount"/><br>
		<input type="submit" value="점주 가입"/><br>
	</form>
	<hr>
    <h2>점주 로그인</h2>
    
	<form action="/ownerLogin.do" method="post">
		ID : <input type="text" name="owId" /><span id="ownerIdChk"></span><br>
		PW : <input type="password" name="owPw"/><span id="ownerPwChk"></span><br>
		<input type="submit" value="로그인"/>
	</form>
	
	<hr>
	<c:if test="${sessionScope.owner!=null}">
		로그인 성공<br>
		<a href="/ownerLogout.do">로그아웃</a><br>
	</c:if>
</body>
</html>
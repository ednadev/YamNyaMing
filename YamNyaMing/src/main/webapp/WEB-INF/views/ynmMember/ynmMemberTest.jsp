<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="/signUpMember.do" method="post">
		<input type="text" name="memberId" placeholder="가입할 아이디 입력"/>
		<input type="text" name="memberPw" placeholder="가입할 PW 입력"/>
		<input type="text" name="memberName" placeholder="가입할 name 입력"/>
		<input type="text" name="memberNickName" placeholder="가입할 nickname 입력"/>
		<input type="text" name="memberGender" placeholder="가입할 gender 입력"/>
		<input type="text" name="memberBirth" placeholder="가입할 birth 입력"/>
		<input type="text" name="memberEmail" placeholder="가입할 email 입력"/>
		<input type="text" name="memberPhone" placeholder="가입할 phone 입력"/>
		<input type="text" name="memberAvatar" placeholder="가입할 avatar입력"/>
		<input type="submit" value="가입">
	</form>
	
	<form action="/login.do" method="post">
	<input type="text" name="memberId" placeholder="아이디 입력"/>
		<input type="text" name="memberPw" placeholder="PW 입력"/>
	<input type="submit" value="로그인">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>점주 쿼리 테스트 페이지</title>
</head>
<body>
    <h2>점주 회원가입</h2>
	<form action="/ownerSignUp.do" method="post">
		ID : <input type="text" name="owId"/><br>
		PW : <input type="password" name="owPw"/><br>
		Name : <input type="text" name="owName"/><br>
		email : <input type="email" name="owEmail"/><br>
		phone : <input type="text" name="phone"/><br>
		bankAcc : <input type="text" name="owBankAccount"/><br>
		<input type="submit" value="점주 가입"/><br>
	</form>
	<hr>
</body>
</html>
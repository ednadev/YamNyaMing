<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� �׽�Ʈ ������</title>
</head>
<body>
	<form action="/ownerSignUp.do" method="post">
		ID : <input type="text" name="owId"/>
		PW : <input type="password" name="owPass"/>
		Name : <input type="text" name="owName"/>
		email : <input type="email" name="owEmail"/>
		phone : <input type="text" name="owPhone"/>
		bankAcc : <input type="text" name="owBankAccount"/>
		<input type="submit" value="���� ����"/>
	</form>
</body>
</html>
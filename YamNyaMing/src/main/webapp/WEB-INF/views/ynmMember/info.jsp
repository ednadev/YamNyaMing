<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="updateMember.do">
	<input type="text" value="${info.memberId}">
	<input type="text" value="">
	<input type="text" value="${info.memberName}">
	<input type="text" value="${info.memberNickName}">
	<input type="text" value="${info.memberGender}">
	<input type="text" value="${info.memberBirth}">
	<input type="text" value="${info.memberEmail}">
	<input type="text" value="${info.memberPhone}">
	<input type="text" value="${info.memberRegDate}">
	<input type="text" value="${info.memberAvatar}">
	<input type="submit" value="변경">
	
	</form>
	
	<hr>
	<c:forEach items="${bookInfo}" var="b">
	<input type="text" value="${b.memberEntireNo}">
	<input type="text" value="${b.bookDate2}">
	</c:forEach>
	
	
</body>
</html>
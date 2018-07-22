<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owner/ownerMyPage.css?ver=1">
<title>${sessionScope.owner.owName}님의 페이지 </title>
<script>
	window.onload = function()
	{
		if(${sessionScope.owner==null})
		{
			alert("잘못된 접근입니다. 로그인 후에 이용해주세요.");
			location.href="/";
		}
	}
</script>
</head>
<body>
	<c:if test="${sessionScope.owner!=null}">
		<h2>입점신청</h2>
		<a href="/storeEnrollOwner.do">얌냐밍 입점 신청하기</a>
	</c:if>
	
</body>
</html>
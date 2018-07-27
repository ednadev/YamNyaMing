<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>


	function searchPaging(currentPage){
		location.href="/ptest?currentPage"+currentPage;
	}
</script>
<body>
${pageContext.request.contextPath}
${path}
<table>
<c:forEach items="${search.noticelist}" var="search">
		<tr>	
			<td>${search.pk }</td>
			<td>${search.code}</td>
			<td>${search.name}</td>
		</tr>	
		</c:forEach>
		</table>
		

<hr>
		<c:if test="${search.currentPage!=1}" var="search">
				<form action="/ptest.do" style="float:left;">
				<input type="hidden" value="${search3.currentPage-1}" name="currentPage">
				<input type="submit" value="<" style="float:left;">
			</form>
		</c:if>
<c:forEach var="i" begin="${search3.startNavi}" end="${search3.endNavi}" step="1">

	<c:choose>
		<c:when test="${search3.currentPage eq search3.startNavi}">
			<form action="/ptest.do" style="float:left;">
				<input type="hidden" value="${i}" name="currentPage">
				<input type="submit" value="${i}" style="float:left;">
			</form>
		</c:when>
		<c:otherwise>
			<form action="/ptest.do">
				<input type="hidden" value="${i}" name="currentPage">
				<input type="submit" value="${i}" style="float:left;">
			</form>
		</c:otherwise>
		
	</c:choose>
	
</c:forEach>
	<c:if test="${search3.currentPage < search3.pageTotalCount}">
			<form action="/ptest.do">
				<input type="hidden" value="${search3.endNavi+1}" name="currentPage">
				<input type="submit" value=">">
			</form>
		</c:if>
</body>
</html>
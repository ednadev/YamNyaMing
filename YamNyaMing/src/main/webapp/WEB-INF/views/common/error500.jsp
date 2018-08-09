<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/error/error.css?ver=1">
<%-- <script src="${pageContext.request.contextPath}/resources/js/owner/ownerInfo.js"></script> --%>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
	setInterval("backHistory()", 1000);
	var delayTime = 3;
	function backHistory()
	{
		//history.go(-1);
		if(delayTime>0)delayTime-=1;
		else location.href="/index.jsp"
		$('#info').html(delayTime+"초 뒤에 메인 화면으로 이동합니다.");
	}
	
</script>
</head>
<body>
	<center>
		<h1>500</h1>
		<h2>잘못된 요청입니다..</h2>
		<h2 id="info"></h2>	
	</center>
</body>
</html>
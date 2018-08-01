<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="http://code.jquery.com/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(document).ready(function(){
		var insertEmail="${id.memberEmail}";
		var memberId="${id.memberId}"
		console.log(insertEmail);
		$.ajax({
			url:"/pwSend.do",
			data : {
				emailConfirm:insertEmail,memberId:memberId
				   },
			type : "post",
			success : function(){	
				window.close();
			},
			error : function(){
				
			}
		});
	});
</script>
<body>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/login.css?ver=2">
<title>Insert title here</title>
</head>

<script>
function emailConfirm()
{
	var insertEmail  = "${id.memberEmail}"; // 이메일 입력 결과
	var memberName="${memberName}";

		$.ajax({
			url:"/idSend.do",
			data : {
				emailConfirm:insertEmail,memberName:memberName
				   },
			type : "post",
			success : function(){	
				window.close();
			},
			error : function(){
				
			}
		});
}
function cancel(){
	window.close();
}
</script>
<style>
	#member-login-section{
		padding-top:124px;
	}
	#member-login-section>h2{
		font-size:1em;
		margin:0;
		margin-bottom:10px;
	}
	#member-login-section>button{
		background-color:#555;
		border:none;
		color:white;
		padding:10px 20px;
	}
	#member-login-section>button:nth-child(3){
		margin-left:133px;
	}
</style>
<body>

	<section id="member-login-section">
		<h2>${id.memberId}</h2>
		<h2>전체 아이디는 등록된 이메일로 전송됩니다.<br>전송하시겠습니까?</h2>
			
		<button onclick="emailConfirm();">전송</button>
		<button onclick="cancel();">취소</button>
	</section>
<br>

</body>
</html>
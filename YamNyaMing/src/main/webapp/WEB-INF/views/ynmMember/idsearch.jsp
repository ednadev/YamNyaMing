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
function emailConfirm()
{
	var insertEmail  = "${id.memberEmail}"; // 이메일 입력 결과
	var memberName="${memberName}";
	
	console.log(insertEmail);

		$.ajax({
			url:"/idSend.do",
			data : {
				emailConfirm:insertEmail,memberName:memberName
				   },
			type : "post",
			success : function(){	
				console.log("이메일 결과");
			},
			error : function(){
				
			}
		});
}
</script>
<body>

${id.memberId}
<br>
전체 아이디는 등록된 이메일로 전송됩니다.
<button onclick="emailConfirm();">전송</button>



</body>
</html>
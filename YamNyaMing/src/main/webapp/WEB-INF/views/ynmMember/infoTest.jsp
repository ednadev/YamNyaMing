<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="http://code.jquery.com/jquery.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script>
var sel_file;
$(document).ready(function(){
	$("#input_avatarPhoto").on("change",avatarPhotoSelect);
});


function avatarPhotoSelect(e){
	var files=e.target.files;
	var filesArr=Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지확장자만");
			return;
		}
		sel_file=f;
		var reader=new FileReader();
		reader.onload=function(e){
			$("#img").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

function avatarDelete(){
	document.img.src="../../resources/image/ilsik.jpg";
	
}
</script>

<body>
	<form action="updateMember.do" method="post" enctype="multipart/form-data">
	<input type="text" value="${info.memberId}">
	<input type="text" value="">
	<input type="text" value="${info.memberName}">
	<input type="text" value="${info.memberNickName}" name="memberNickName">
	<input type="text" value="${info.memberGender}">
	<input type="text" value="${info.memberBirth}">
	<input type="text" value="${info.memberEmail}" name="memberEmail">
	<input type="text" value="${info.memberPhone}">
	<input type="text" value="${info.memberRegDate}">
	
	
	<img id="img" name=img src='${pageContext.request.contextPath}/resources/image/member/${img}'>
	
	<label for="input_avatarPhoto">이미지변경</label>
	<input type="file" id="input_avatarPhoto" style="display:none;" name="avatarPhoto" value="C:/Users/user1/git/YamNyaMing/YamNyaMing/src/main/webapp/resources/image/profile.png">
	
	<input type="button" onclick="avatarDelete();" value="삭제">
	
	
	
	<input type="submit" value="정보변경">
	</form>
	
	<hr>
	<c:forEach items="${bookInfo}" var="b">
	<input type="text" value="${b.memberEntireNo}">
	<input type="text" value="${b.bookDate2}">
	</c:forEach>
	
	
	
</body>
</html>
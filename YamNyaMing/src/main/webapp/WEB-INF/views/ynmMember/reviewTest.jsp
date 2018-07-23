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
function like(storeReviewNo,memberEntireNo){
	
	$.ajax({
			url : "/likeInsert.do",
			data : {memberEntireNo : memberEntireNo,storeReviewNo:storeReviewNo},
			success : function(data){
				console.log("성공")
			}
		});	
	
}
function jjim(){
	alert("2");
}
</script>
<body>

	가게 폰번호<input type="text" value="${storeInfo.owStorePhone}"><br>
${sessionScope.member.memberId}
<c:forEach items="${review}" var="r">
	댓글 인덱스 <input type="text" value="${r.storeReviewNo}"><br>
				<button onclick="like('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}');">좋아요</button>
				<button onclick="jjim();">찜하기</button>
				<c:forEach items="${r.photoObjList}" var="photo">
						
						${photo.photoViewRoute}
				
				</c:forEach><br>
				
				
	<input type="text" value="${r.reviewContent}"><br>
	
	<form action="/storeUnderReviewInsert.do">
	<input type="hidden" name="storeReviewNo" value="${r.storeReviewNo}">
	<input type="hidden" name="memberEntireNo" value="${sessionScope.member.memberEntireNo}">
	<input type="text" name="underReviewContent">
	
	<input type="submit" value="대댓글등록">
	</form>
	
	<hr>
</c:forEach>

	

</body>
</html>
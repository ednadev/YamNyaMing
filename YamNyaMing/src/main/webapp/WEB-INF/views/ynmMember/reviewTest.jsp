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
			dataType:'json',
			success : function(data){
				if(data==1){
					var like=document.getElementById(storeReviewNo).innerHTML;
					var result=parseInt(like)-1;
					document.getElementById(storeReviewNo).innerHTML=result;
				}else if(data==2){
					var like=document.getElementById(storeReviewNo).innerHTML;
					var result=parseInt(like)+1;
					document.getElementById(storeReviewNo).innerHTML=result;
				}else{
					alert("실패");
				}	
			}
		});	
	
}
function jjim(storeReviewNo,memberEntireNo){
	$.ajax({
		url : "/jjimInsert.do",
		data : {memberEntireNo : memberEntireNo,storeReviewNo:storeReviewNo},
		dataType:'json',
		success : function(data){
			if(data==1){
				alert("찜 해제");
			}else if(data==2){
				alert("찜 했다");
			}else{
				alert("실패");
			}
		}
	});	
}

function follow(memberEntireNo,userMemberEntireNo){
	console.log(memberEntireNo);
	console.log(userMemberEntireNo);

	$.ajax({
		url : "/followInsert.do",
		data : {memberEntireNo : memberEntireNo,userMemberEntireNo:userMemberEntireNo},
		dataType:'json',
		success : function(data){
			if(data==1){
				alert("팔로우 해제");
			}else if(data==2){
				alert("팔로우 했다");
			}else{
				alert("실패");
			}
		}
	});	
}
</script>
<body>

	가게 폰번호<input type="text" value="${storeInfo.owStoreTel}"><br>
${sessionScope.member.memberId}
<c:forEach items="${review}" var="r">
	댓글 인덱스 <input type="text" value="${r.storeReviewNo}"><br>
	등록한 사용자 인덱스<input type="text" value="${r.memberEntireNo }">
				<button onclick="follow('${r.memberEntireNo }','${sessionScope.member.memberEntireNo}');">팔로우하기</button>
				<button onclick="like('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}');">좋아요</button>
				<button onclick="jjim('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}');">찜하기</button>
				댓글 총 좋아요 수:<p id="${r.storeReviewNo}">${r.likeTotal}<p>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
	margin: 0;
	color: #fb0;
	text-decoration: none;
	list-style: none;
	outline: none;
	font-family: 'Nanum Gothic', sans-serif;
}

div {
	display: block;
	padding: 5px;
}

p {
	display: block;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
}

#profile-image {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.5);
	float: left;
}

button {
	float: right;
	background-color: white;
	border: 1px solid #fb0;
	padding: 7px;
	border-radius: 7px;
	cursor: pointer;
	align-items: flex-start;
	text-align: center;
	box-sizing: border-box;
	text-rendering: auto;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	font: 400 13.3333px Arial;
	-webkit-writing-mode: horizontal-tb !important;
	-webkit-appearance: button;
	margin-top: 35px;
}
button:hover{
	background-color:#fb0;
	color:white;
}
</style>
<body style="padding:10px;">
${likeTotal}
	<c:forEach items="${likeMemberList}" var="l">
		<div style="margin-bottom: 20px; overflow: hidden; border-top:solid #ddd 1px; border-bottom:solid #ddd 1px;">
			<div id="profile-image">
				<c:if test="${l.memberUploadPhotoNo eq 1}">
					<img id="img"
						style="width: 100%; height: 100%; border-radius: 50%;" name=img
						src='${pageContext.request.contextPath}/resources/image/member/profile.png'>
				</c:if>
				<c:if test="${l.memberUploadPhotoNo ne 1}">
					<img id="img"
						style="width: 100%; height: 100%; border-radius: 50%;" name=img
						src='${pageContext.request.contextPath}/resources/image/member/${l.photoViewRoute}'>
				</c:if>
			</div>
			<div style="float: left;">
				<p
					style="margin-top: 20px; color: black; font-weight: bold; margin-left: 11px;">${l.memberName}</p>
				<p style="font-size: 0.9em; color: black; margin-left: 10px;">리뷰${l.reviewTotal},팔로워${l.followTotal}</p>
			</div>

			<button>팔로우</button>
		</div>
	</c:forEach>
</body>
</html>
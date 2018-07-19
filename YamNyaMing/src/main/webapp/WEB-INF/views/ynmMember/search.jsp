<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
</head>
<body>
<header id="member-search-header">
	<h1><a href="/index.jsp">YamNyaMing</a></h1>
    <form action="/search.do" method="get">
    	<select name="place">
    		<option value="홍대">홍대</option>
    	</select>
    	<select name="food">
    		<option disabled selected>음식 종류 선택</option>
    		<option value="한식">한식</option>
    		<option value="중식">중식</option>
    		<option value="일식">일식</option>
    		<option value="양식">양식</option>
    		<option value="뷔페">뷔페</option>
    		<option value="카페">카페</option>
    	</select>
    	<input type="text" name="keyword" placeholder="키워드를 입력해주세요">
    	<input type="submit" value="검색">
    </form>	
	<ul>
        <li><a href="/loginMember.do">로그인</a></li>
        <li><a href="/enrollMember.do">회원가입</a></li>
    </ul>

</header>
<section id="member-main-section">

</section>
<footer id="member-main-footer">
	<div>
		<h2>YamNyaMing</h2>
		<p>Immediately Reservation!</p>
		<address>㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
		주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018 YamNyaMing Co. All rights reserved</address>
	</div>
	<a href="/enrollOwner.do">점장 가입하기</a>
</footer>
</body>
</html>
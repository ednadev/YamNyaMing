<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.kh.ynm.member.model.vo.*" import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/search.css?ver=6">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=506d35ab67392611ab5c3ecf1938286e&libraries=services"></script>
</head>
<body>
<header id="member-search-header">
	<h1><a href="/index.jsp">YamNyaMing</a></h1>
    <form action="/search.do" method="get">
    	<select name="place" id="place">
    	<c:choose>
    		<c:when test="${place eq '홍대'}">
	    		<option disabled>지역 선택</option>
	    		<option value="홍대" selected>홍대</option>
    		</c:when> 
    		<c:otherwise>
	    		<option selected disabled>지역 선택</option>
	    		<option value="홍대">홍대</option>    		
    		</c:otherwise>   	
    	</c:choose>
    	</select>
    	<select name="food" id="food">
    	<c:choose>
    		<c:when test="${food eq '한식'}">
	     		<option value="">음식 종류 선택</option>
	    		<option value="한식" selected>한식</option>
	    		<option value="중식">중식</option>
	    		<option value="일식">일식</option>
	    		<option value="양식">양식</option>
	    		<option value="뷔페">뷔페</option>
	    		<option value="디저트">디저트</option>
	    		<option value="술집">술집</option>
	    		<option value="기타">기타</option>   		
    		</c:when>
    		<c:when test="${food eq '중식'}">
	     		<option value="">음식 종류 선택</option>
	    		<option value="한식">한식</option>
	    		<option value="중식" selected>중식</option>
	    		<option value="일식">일식</option>
	    		<option value="양식">양식</option>
	    		<option value="뷔페">뷔페</option>
	    		<option value="디저트">디저트</option>
	    		<option value="술집">술집</option>
	    		<option value="기타">기타</option>   	
    		</c:when>
    		<c:when test="${food eq '일식'}">
	     		<option value="">음식 종류 선택</option>
	    		<option value="한식">한식</option>
	    		<option value="중식">중식</option>
	    		<option value="일식" selected>일식</option>
	    		<option value="양식">양식</option>
	    		<option value="뷔페">뷔페</option>
	    		<option value="디저트">디저트</option>
	    		<option value="술집">술집</option>
	    		<option value="기타">기타</option>    		
    		</c:when>
    		<c:when test="${food eq '양식'}">
	     		<option value="">음식 종류 선택</option>
	    		<option value="한식">한식</option>
	    		<option value="중식">중식</option>
	    		<option value="일식">일식</option>
	    		<option value="양식" selected>양식</option>
	    		<option value="뷔페">뷔페</option>
	    		<option value="디저트">디저트</option>
	    		<option value="술집">술집</option>
	    		<option value="기타">기타</option>     		
    		</c:when> 
    		<c:when test="${food eq '뷔페'}">
	     		<option value="">음식 종류 선택</option>
	    		<option value="한식">한식</option>
	    		<option value="중식">중식</option>
	    		<option value="일식">일식</option>
	    		<option value="양식">양식</option>
	    		<option value="뷔페" selected>뷔페</option>
	    		<option value="디저트">디저트</option>
	    		<option value="술집">술집</option>
	    		<option value="기타">기타</option>    		
    		</c:when>
    		<c:when test="${food eq '디저트'}">
	     		<option value="">음식 종류 선택</option>
	    		<option value="한식">한식</option>
	    		<option value="중식">중식</option>
	    		<option value="일식">일식</option>
	    		<option value="양식">양식</option>
	    		<option value="뷔페">뷔페</option>
	    		<option value="디저트" selected>디저트</option>
	    		<option value="술집">술집</option>
	    		<option value="기타">기타</option>     		
    		</c:when>  
    		<c:when test="${food eq '술집'}">
	     		<option value="">음식 종류 선택</option>
	    		<option value="한식">한식</option>
	    		<option value="중식">중식</option>
	    		<option value="일식">일식</option>
	    		<option value="양식">양식</option>
	    		<option value="뷔페">뷔페</option>
	    		<option value="디저트">디저트</option>
	    		<option value="술집" selected>술집</option>
	    		<option value="기타">기타</option>    		
    		</c:when>  
    		<c:when test="${food eq '기타'}">
	     		<option value="">음식 종류 선택</option>
	    		<option value="한식">한식</option>
	    		<option value="중식">중식</option>
	    		<option value="일식">일식</option>
	    		<option value="양식">양식</option>
	    		<option value="뷔페">뷔페</option>
	    		<option value="디저트">디저트</option>
	    		<option value="술집">술집</option>
	    		<option value="기타" selected>기타</option>    		
    		</c:when>     		  		  		    		   		    		    		
    		<c:otherwise>
	     		<option value="" selected>음식 종류 선택</option>
	    		<option value="한식">한식</option>
	    		<option value="중식">중식</option>
	    		<option value="일식">일식</option>
	    		<option value="양식">양식</option>
	    		<option value="뷔페">뷔페</option>
	    		<option value="디저트">디저트</option>
	    		<option value="술집">술집</option>
	    		<option value="기타">기타</option>     		
    		</c:otherwise>
    	</c:choose>
    	</select>
    	<c:if test="${keyword==null}">
    		<input type="text" name="keyword" placeholder="키워드를 입력해주세요">
    	</c:if>    	
    	<c:if test="${keyword!=null}">
    		<input type="text" name="keyword" value="${keyword}" id="keyword">
    	</c:if>
    	<input type="submit" value="검색">
    </form>	
<ul>
			<c:if test="${sessionScope.totalRefModel==null}">
				<script>location.href="/totalRefLoad.do"</script>
			</c:if>
			<c:if test="${sessionScope.naver!=null}" var="result">
				<li>${sessionScope.naver.naverNickName}님 환영합니다.</li>
				<li><a href="/memberInfo.do">마이페이지</a></li>
				<li><a href="/logout.do">로그아웃</a></li>
			</c:if>
		
			<c:if test="${sessionScope.member!=null}" var="result">
				<li>${sessionScope.member.memberNickName}님 환영합니다.</li>
				<li><a href="/memberInfo.do">마이페이지</a></li>
				<li><a href="/logout.do">로그아웃</a></li>
			</c:if>

			<c:if test="${sessionScope.owner!=null}" var="result">
				<li>${sessionScope.owner.owName} 사장님 환영합니다.</li>
				<li><a href="/ownerMyPage.do">관리페이지</a></li>
				<li><a href="/ownerLogout.do">로그아웃</a></li>
			</c:if>
			<c:if test="${sessionScope.owner==null && sessionScope.member==null && sessionScope.naver==null}" var="result">
				<li><a href="/loginMember.do">로그인</a></li>
				<li><a href="/adminLogin.do">관리자 로그인</a><li>


				<li><a href="/enrollMember.do">회원가입</a></li>
			</c:if>
		</ul>

</header>
<section id="member-search-section">
	<div id="map"></div>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.556888697557625, 126.92367442251489), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	</script>
	
	<script>
	function searchDetail(){
		var x = document.getElementById("searchDetail");
		if(x.style.display === "none"){
			x.style.display = "block";
		}else{
			x.style.display = "none";
		}
	}
	</script>
	<div class="member-search-wrapper">
	<h2 onclick="searchDetail();">자세히 검색</h2>
	<form action="/search.do" method="get" id="searchDetail">
	<c:choose>
		<c:when test="${food eq '한식' }">
		<input type="hidden" name="place" value="홍대">
		<input type="hidden" name="food" value="한식">
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '백반,가정식'}">
					<input type="checkbox" id="homeFood" name="storeCateDetailName" value="백반,가정식" checked><label for="homeFood">백반,가정식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="homeFood" name="storeCateDetailName" value="백반,가정식"><label for="homeFood">백반,가정식</label>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '한정식' || storeCateDetailName[1] eq '한정식'}">
					<input type="checkbox" id="koreanRestaurant" name="storeCateDetailName" value="한정식" checked><label for="koreanRestaurant">한정식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="koreanRestaurant" name="storeCateDetailName" value="한정식"><label for="koreanRestaurant">한정식</label>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '쌈밥' || storeCateDetailName[1] eq '쌈밥' || storeCateDetailName[2] eq '쌈밥'}">
					<input type="checkbox" id="ssambap" name="storeCateDetailName" value="쌈밥" checked><label for="ssambap">쌈밥</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="ssambap" name="storeCateDetailName" value="쌈밥"><label for="ssambap">쌈밥</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '보리밥' || storeCateDetailName[1] eq '보리밥' || storeCateDetailName[2] eq '보리밥' 
								|| storeCateDetailName[3] eq '보리밥'}">
					<input type="checkbox" id="boribap" name="storeCateDetailName" value="보리밥" checked><label for="boribap">보리밥</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="boribap" name="storeCateDetailName" value="보리밥"><label for="boribap">보리밥</label>
				</c:otherwise>
			</c:choose>		
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '비빔밥' || storeCateDetailName[1] eq '비빔밥' || storeCateDetailName[2] eq '비빔밥' 
								|| storeCateDetailName[3] eq '비빔밥' || storeCateDetailName[4] eq '비빔밥'}">
					<input type="checkbox" id="bibimbap" name="storeCateDetailName" value="비빔밥" checked><label for="bibimbap">비빔밥</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="bibimbap" name="storeCateDetailName" value="비빔밥"><label for="bibimbap">비빔밥</label>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '죽' || storeCateDetailName[1] eq '죽' || storeCateDetailName[2] eq '죽' 
								|| storeCateDetailName[3] eq '죽' || storeCateDetailName[4] eq '죽' || storeCateDetailName[5] eq '죽'}">
					<input type="checkbox" id="juk" name="storeCateDetailName" value="죽" checked><label for="juk">죽</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="juk" name="storeCateDetailName" value="죽"><label for="juk">죽</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '국밥' || storeCateDetailName[1] eq '국밥' || storeCateDetailName[2] eq '국밥' 
								|| storeCateDetailName[3] eq '국밥' || storeCateDetailName[4] eq '국밥' || storeCateDetailName[5] eq '국밥'
								|| storeCateDetailName[6] eq '국밥'}">
					<input type="checkbox" id="soupbap" name="storeCateDetailName" value="국밥" checked><label for="soupbap">국밥</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="soupbap" name="storeCateDetailName" value="국밥"><label for="soupbap">국밥</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '국수' || storeCateDetailName[1] eq '국수' || storeCateDetailName[2] eq '국수' 
								|| storeCateDetailName[3] eq '국수' || storeCateDetailName[4] eq '국수' || storeCateDetailName[5] eq '국수'
								|| storeCateDetailName[6] eq '국수' || storeCateDetailName[7] eq '국수'}">
					<input type="checkbox" id="noodle" name="storeCateDetailName" value="국수" checked><label for="noodle">국수</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="noodle" name="storeCateDetailName" value="국수"><label for="noodle">국수</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '냉면' || storeCateDetailName[1] eq '냉면' || storeCateDetailName[2] eq '냉면' 
								|| storeCateDetailName[3] eq '냉면' || storeCateDetailName[4] eq '냉면' || storeCateDetailName[5] eq '냉면'
								|| storeCateDetailName[6] eq '냉면' || storeCateDetailName[7] eq '냉면' || storeCateDetailName[8] eq '냉면'}">
					<input type="checkbox" id="coldNoodle" name="storeCateDetailName" value="냉면" checked><label for="coldNoodle">냉면</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="coldNoodle" name="storeCateDetailName" value="냉면"><label for="coldNoodle">냉면</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '막국수' || storeCateDetailName[1] eq '막국수' || storeCateDetailName[2] eq '막국수' 
								|| storeCateDetailName[3] eq '막국수' || storeCateDetailName[4] eq '막국수' || storeCateDetailName[5] eq '막국수'
								|| storeCateDetailName[6] eq '막국수' || storeCateDetailName[7] eq '막국수' || storeCateDetailName[8] eq '막국수'
								|| storeCateDetailName[9] eq '막국수'}">
					<input type="checkbox" id="makguksu" name="storeCateDetailName" value="막국수" checked><label for="makguksu">막국수</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="makguksu" name="storeCateDetailName" value="막국수"><label for="makguksu">막국수</label>
				</c:otherwise>
			</c:choose>		
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '찌개,전골' || storeCateDetailName[1] eq '찌개,전골' || storeCateDetailName[2] eq '찌개,전골' 
								|| storeCateDetailName[3] eq '찌개,전골' || storeCateDetailName[4] eq '찌개,전골' || storeCateDetailName[5] eq '찌개,전골'
								|| storeCateDetailName[6] eq '찌개,전골' || storeCateDetailName[7] eq '찌개,전골' || storeCateDetailName[8] eq '찌개,전골'
								|| storeCateDetailName[9] eq '찌개,전골' || storeCateDetailName[10] eq '찌개,전골'}">
					<input type="checkbox" id="stew" name="storeCateDetailName" value="찌개,전골" checked><label for="stew">찌개,전골</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="stew" name="storeCateDetailName" value="찌개,전골"><label for="stew">찌개,전골</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '추어탕' || storeCateDetailName[1] eq '추어탕' || storeCateDetailName[2] eq '추어탕' 
								|| storeCateDetailName[3] eq '추어탕' || storeCateDetailName[4] eq '추어탕' || storeCateDetailName[5] eq '추어탕'
								|| storeCateDetailName[6] eq '추어탕' || storeCateDetailName[7] eq '추어탕' || storeCateDetailName[8] eq '추어탕'
								|| storeCateDetailName[9] eq '추어탕' || storeCateDetailName[10] eq '추어탕' || storeCateDetailName[11] eq '추어탕'}">
					<input type="checkbox" id="chuatang" name="storeCateDetailName" value="추어탕" checked><label for="chuatang">추어탕</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="chuatang" name="storeCateDetailName" value="추어탕"><label for="chuatang">추어탕</label>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '감자탕' || storeCateDetailName[1] eq '감자탕' || storeCateDetailName[2] eq '감자탕' 
								|| storeCateDetailName[3] eq '감자탕' || storeCateDetailName[4] eq '감자탕' || storeCateDetailName[5] eq '감자탕'
								|| storeCateDetailName[6] eq '감자탕' || storeCateDetailName[7] eq '감자탕' || storeCateDetailName[8] eq '감자탕'
								|| storeCateDetailName[9] eq '감자탕' || storeCateDetailName[10] eq '감자탕' || storeCateDetailName[11] eq '감자탕'
								|| storeCateDetailName[12] eq '감자탕'}">
					<input type="checkbox" id="gamjatang" name="storeCateDetailName" value="감자탕" checked><label for="gamjatang">감자탕</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="gamjatang" name="storeCateDetailName" value="감자탕"><label for="gamjatang">감자탕</label>
				</c:otherwise>
			</c:choose>						
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '해장국' || storeCateDetailName[1] eq '해장국' || storeCateDetailName[2] eq '해장국' 
								|| storeCateDetailName[3] eq '해장국' || storeCateDetailName[4] eq '해장국' || storeCateDetailName[5] eq '해장국'
								|| storeCateDetailName[6] eq '해장국' || storeCateDetailName[7] eq '해장국' || storeCateDetailName[8] eq '해장국'
								|| storeCateDetailName[9] eq '해장국' || storeCateDetailName[10] eq '해장국' || storeCateDetailName[11] eq '해장국'
								|| storeCateDetailName[12] eq '해장국' || storeCateDetailName[13] eq '해장국'}">
					<input type="checkbox" id="hazelnut" name="storeCateDetailName" value="해장국" checked><label for="hazelnut">해장국</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="hazelnut" name="storeCateDetailName" value="해장국"><label for="hazelnut">해장국</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '곰탕,설렁탕' || storeCateDetailName[1] eq '곰탕,설렁탕' || storeCateDetailName[2] eq '곰탕,설렁탕' 
								|| storeCateDetailName[3] eq '곰탕,설렁탕' || storeCateDetailName[4] eq '곰탕,설렁탕' || storeCateDetailName[5] eq '곰탕,설렁탕'
								|| storeCateDetailName[6] eq '곰탕,설렁탕' || storeCateDetailName[7] eq '곰탕,설렁탕' || storeCateDetailName[8] eq '곰탕,설렁탕'
								|| storeCateDetailName[9] eq '곰탕,설렁탕' || storeCateDetailName[10] eq '곰탕,설렁탕' || storeCateDetailName[11] eq '곰탕,설렁탕'
								|| storeCateDetailName[12] eq '곰탕,설렁탕' || storeCateDetailName[13] eq '곰탕,설렁탕' || storeCateDetailName[14] eq '곰탕,설렁탕'}">
					<input type="checkbox" id="sullungtang" name="storeCateDetailName" value="곰탕,설렁탕" checked><label for="sullungtang">곰탕,설렁탕</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="sullungtang" name="storeCateDetailName" value="곰탕,설렁탕"><label for="sullungtang">곰탕,설렁탕</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '갈비탕' || storeCateDetailName[1] eq '갈비탕' || storeCateDetailName[2] eq '갈비탕' 
								|| storeCateDetailName[3] eq '갈비탕' || storeCateDetailName[4] eq '갈비탕' || storeCateDetailName[5] eq '갈비탕'
								|| storeCateDetailName[6] eq '갈비탕' || storeCateDetailName[7] eq '갈비탕' || storeCateDetailName[8] eq '갈비탕'
								|| storeCateDetailName[9] eq '갈비탕' || storeCateDetailName[10] eq '갈비탕' || storeCateDetailName[11] eq '갈비탕'
								|| storeCateDetailName[12] eq '갈비탕' || storeCateDetailName[13] eq '갈비탕' || storeCateDetailName[14] eq '갈비탕'
								|| storeCateDetailName[15] eq '갈비탕'}">
					<input type="checkbox" id="galbitang" name="storeCateDetailName" value="갈비탕" checked><label for="galbitang">갈비탕</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="galbitang" name="storeCateDetailName" value="갈비탕"><label for="galbitang">갈비탕</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '찜요리' || storeCateDetailName[1] eq '찜요리' || storeCateDetailName[2] eq '찜요리' 
								|| storeCateDetailName[3] eq '찜요리' || storeCateDetailName[4] eq '찜요리' || storeCateDetailName[5] eq '찜요리'
								|| storeCateDetailName[6] eq '찜요리' || storeCateDetailName[7] eq '찜요리' || storeCateDetailName[8] eq '찜요리'
								|| storeCateDetailName[9] eq '찜요리' || storeCateDetailName[10] eq '찜요리' || storeCateDetailName[11] eq '찜요리'
								|| storeCateDetailName[12] eq '찜요리' || storeCateDetailName[13] eq '찜요리' || storeCateDetailName[14] eq '찜요리'
								|| storeCateDetailName[15] eq '찜요리' || storeCateDetailName[16] eq '찜요리'}">
					<input type="checkbox" id="steamFood" name="storeCateDetailName" value="찜요리" checked><label for="steamFood">찜요리</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="steamFood" name="storeCateDetailName" value="찜요리"><label for="steamFood">찜요리</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '구이요리' || storeCateDetailName[1] eq '구이요리' || storeCateDetailName[2] eq '구이요리' 
								|| storeCateDetailName[3] eq '구이요리' || storeCateDetailName[4] eq '구이요리' || storeCateDetailName[5] eq '구이요리'
								|| storeCateDetailName[6] eq '구이요리' || storeCateDetailName[7] eq '구이요리' || storeCateDetailName[8] eq '구이요리'
								|| storeCateDetailName[9] eq '구이요리' || storeCateDetailName[10] eq '구이요리' || storeCateDetailName[11] eq '구이요리'
								|| storeCateDetailName[12] eq '구이요리' || storeCateDetailName[13] eq '구이요리' || storeCateDetailName[14] eq '구이요리'
								|| storeCateDetailName[15] eq '구이요리' || storeCateDetailName[16] eq '구이요리' || storeCateDetailName[17] eq '구이요리'}">
					<input type="checkbox" id="grillFood" name="storeCateDetailName" value="구이요리" checked><label for="grillFood">구이요리</label>	
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="grillFood" name="storeCateDetailName" value="구이요리"><label for="grillFood">구이요리</label>	
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '두부요리' || storeCateDetailName[1] eq '두부요리' || storeCateDetailName[2] eq '두부요리' 
								|| storeCateDetailName[3] eq '두부요리' || storeCateDetailName[4] eq '두부요리' || storeCateDetailName[5] eq '두부요리'
								|| storeCateDetailName[6] eq '두부요리' || storeCateDetailName[7] eq '두부요리' || storeCateDetailName[8] eq '두부요리'
								|| storeCateDetailName[9] eq '두부요리' || storeCateDetailName[10] eq '두부요리' || storeCateDetailName[11] eq '두부요리'
								|| storeCateDetailName[12] eq '두부요리' || storeCateDetailName[13] eq '두부요리' || storeCateDetailName[14] eq '두부요리'
								|| storeCateDetailName[15] eq '두부요리' || storeCateDetailName[16] eq '두부요리' || storeCateDetailName[17] eq '두부요리'
								|| storeCateDetailName[18] eq '두부요리'}">
					<input type="checkbox" id="tofuFood" name="storeCateDetailName" value="두부요리" checked><label for="tofuFood">두부요리</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="tofuFood" name="storeCateDetailName" value="두부요리"><label for="tofuFood">두부요리</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '볶음요리' || storeCateDetailName[1] eq '볶음요리' || storeCateDetailName[2] eq '볶음요리' 
								|| storeCateDetailName[3] eq '볶음요리' || storeCateDetailName[4] eq '볶음요리' || storeCateDetailName[5] eq '볶음요리'
								|| storeCateDetailName[6] eq '볶음요리' || storeCateDetailName[7] eq '볶음요리' || storeCateDetailName[8] eq '볶음요리'
								|| storeCateDetailName[9] eq '볶음요리' || storeCateDetailName[10] eq '볶음요리' || storeCateDetailName[11] eq '볶음요리'
								|| storeCateDetailName[12] eq '볶음요리' || storeCateDetailName[13] eq '볶음요리' || storeCateDetailName[14] eq '볶음요리'
								|| storeCateDetailName[15] eq '볶음요리' || storeCateDetailName[16] eq '볶음요리' || storeCateDetailName[17] eq '볶음요리'
								|| storeCateDetailName[18] eq '볶음요리' || storeCateDetailName[19] eq '볶음요리'}">
					<input type="checkbox" id="stirFry" name="storeCateDetailName" value="볶음요리" checked><label for="stirFry">볶음요리</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="stirFry" name="storeCateDetailName" value="볶음요리"><label for="stirFry">볶음요리</label>
				</c:otherwise>
			</c:choose>		
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '해산물요리' || storeCateDetailName[1] eq '해산물요리' || storeCateDetailName[2] eq '해산물요리' 
								|| storeCateDetailName[3] eq '해산물요리' || storeCateDetailName[4] eq '해산물요리' || storeCateDetailName[5] eq '해산물요리'
								|| storeCateDetailName[6] eq '해산물요리' || storeCateDetailName[7] eq '해산물요리' || storeCateDetailName[8] eq '해산물요리'
								|| storeCateDetailName[9] eq '해산물요리' || storeCateDetailName[10] eq '해산물요리' || storeCateDetailName[11] eq '해산물요리'
								|| storeCateDetailName[12] eq '해산물요리' || storeCateDetailName[13] eq '해산물요리' || storeCateDetailName[14] eq '해산물요리'
								|| storeCateDetailName[15] eq '해산물요리' || storeCateDetailName[16] eq '해산물요리' || storeCateDetailName[17] eq '해산물요리'
								|| storeCateDetailName[18] eq '해산물요리' || storeCateDetailName[19] eq '해산물요리' || storeCateDetailName[20] eq '해산물요리'}">
					<input type="checkbox" id="koreanSeafood" name="storeCateDetailName" value="해산물요리" checked><label for="koreanSeafood">해산물요리</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="koreanSeafood" name="storeCateDetailName" value="해산물요리"><label for="koreanSeafood">해산물요리</label>
				</c:otherwise>
			</c:choose>		
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '생선회' || storeCateDetailName[1] eq '생선회' || storeCateDetailName[2] eq '생선회' 
								|| storeCateDetailName[3] eq '생선회' || storeCateDetailName[4] eq '생선회' || storeCateDetailName[5] eq '생선회'
								|| storeCateDetailName[6] eq '생선회' || storeCateDetailName[7] eq '생선회' || storeCateDetailName[8] eq '생선회'
								|| storeCateDetailName[9] eq '생선회' || storeCateDetailName[10] eq '생선회' || storeCateDetailName[11] eq '생선회'
								|| storeCateDetailName[12] eq '생선회' || storeCateDetailName[13] eq '생선회' || storeCateDetailName[14] eq '생선회'
								|| storeCateDetailName[15] eq '생선회' || storeCateDetailName[16] eq '생선회' || storeCateDetailName[17] eq '생선회'
								|| storeCateDetailName[18] eq '생선회' || storeCateDetailName[19] eq '생선회' || storeCateDetailName[20] eq '생선회'
								|| storeCateDetailName[21] eq '생선회'}">
					<input type="checkbox" id="sashimi" name="storeCateDetailName" value="생선회" checked><label for="sashimi">생선회</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="sashimi" name="storeCateDetailName" value="생선회"><label for="sashimi">생선회</label>
				</c:otherwise>
			</c:choose>					
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '칼국수,만두' || storeCateDetailName[1] eq '칼국수,만두' || storeCateDetailName[2] eq '칼국수,만두' 
								|| storeCateDetailName[3] eq '칼국수,만두' || storeCateDetailName[4] eq '칼국수,만두' || storeCateDetailName[5] eq '칼국수,만두'
								|| storeCateDetailName[6] eq '칼국수,만두' || storeCateDetailName[7] eq '칼국수,만두' || storeCateDetailName[8] eq '칼국수,만두'
								|| storeCateDetailName[9] eq '칼국수,만두' || storeCateDetailName[10] eq '칼국수,만두' || storeCateDetailName[11] eq '칼국수,만두'
								|| storeCateDetailName[12] eq '칼국수,만두' || storeCateDetailName[13] eq '칼국수,만두' || storeCateDetailName[14] eq '칼국수,만두'
								|| storeCateDetailName[15] eq '칼국수,만두' || storeCateDetailName[16] eq '칼국수,만두' || storeCateDetailName[17] eq '칼국수,만두'
								|| storeCateDetailName[18] eq '칼국수,만두' || storeCateDetailName[19] eq '칼국수,만두' || storeCateDetailName[20] eq '칼국수,만두'
								|| storeCateDetailName[21] eq '칼국수,만두' || storeCateDetailName[22] eq '칼국수,만두'}">
					<input type="checkbox" id="kalguksu" name="storeCateDetailName" value="칼국수,만두" checked><label for="kalguksu">칼국수,만두</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="kalguksu" name="storeCateDetailName" value="칼국수,만두"><label for="kalguksu">칼국수,만두</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '전,빈대떡' || storeCateDetailName[1] eq '전,빈대떡' || storeCateDetailName[2] eq '전,빈대떡' 
								|| storeCateDetailName[3] eq '전,빈대떡' || storeCateDetailName[4] eq '전,빈대떡' || storeCateDetailName[5] eq '전,빈대떡'
								|| storeCateDetailName[6] eq '전,빈대떡' || storeCateDetailName[7] eq '전,빈대떡' || storeCateDetailName[8] eq '전,빈대떡'
								|| storeCateDetailName[9] eq '전,빈대떡' || storeCateDetailName[10] eq '전,빈대떡' || storeCateDetailName[11] eq '전,빈대떡'
								|| storeCateDetailName[12] eq '전,빈대떡' || storeCateDetailName[13] eq '전,빈대떡' || storeCateDetailName[14] eq '전,빈대떡'
								|| storeCateDetailName[15] eq '전,빈대떡' || storeCateDetailName[16] eq '전,빈대떡' || storeCateDetailName[17] eq '전,빈대떡'
								|| storeCateDetailName[18] eq '전,빈대떡' || storeCateDetailName[19] eq '전,빈대떡' || storeCateDetailName[20] eq '전,빈대떡'
								|| storeCateDetailName[21] eq '전,빈대떡' || storeCateDetailName[22] eq '전,빈대떡' || storeCateDetailName[23] eq '전,빈대떡'}">
					<input type="checkbox" id="koreanCake" name="storeCateDetailName" value="전,빈대떡" checked><label for="koreanCake">전,빈대떡</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="koreanCake" name="storeCateDetailName" value="전,빈대떡"><label for="koreanCake">전,빈대떡</label>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '족발,보쌈' || storeCateDetailName[1] eq '족발,보쌈' || storeCateDetailName[2] eq '족발,보쌈' 
								|| storeCateDetailName[3] eq '족발,보쌈' || storeCateDetailName[4] eq '족발,보쌈' || storeCateDetailName[5] eq '족발,보쌈'
								|| storeCateDetailName[6] eq '족발,보쌈' || storeCateDetailName[7] eq '족발,보쌈' || storeCateDetailName[8] eq '족발,보쌈'
								|| storeCateDetailName[9] eq '족발,보쌈' || storeCateDetailName[10] eq '족발,보쌈' || storeCateDetailName[11] eq '족발,보쌈'
								|| storeCateDetailName[12] eq '족발,보쌈' || storeCateDetailName[13] eq '족발,보쌈' || storeCateDetailName[14] eq '족발,보쌈'
								|| storeCateDetailName[15] eq '족발,보쌈' || storeCateDetailName[16] eq '족발,보쌈' || storeCateDetailName[17] eq '족발,보쌈'
								|| storeCateDetailName[18] eq '족발,보쌈' || storeCateDetailName[19] eq '족발,보쌈' || storeCateDetailName[20] eq '족발,보쌈'
								|| storeCateDetailName[21] eq '족발,보쌈' || storeCateDetailName[22] eq '족발,보쌈' || storeCateDetailName[23] eq '족발,보쌈'
								|| storeCateDetailName[24] eq '족발,보쌈'}">
					<input type="checkbox" id="jokbal" name="storeCateDetailName" value="족발,보쌈" checked><label for="jokbal">족발,보쌈</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="jokbal" name="storeCateDetailName" value="족발,보쌈"><label for="jokbal">족발,보쌈</label>
				</c:otherwise>
			</c:choose>												
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '고기요리' || storeCateDetailName[1] eq '고기요리' || storeCateDetailName[2] eq '고기요리' 
								|| storeCateDetailName[3] eq '고기요리' || storeCateDetailName[4] eq '고기요리' || storeCateDetailName[5] eq '고기요리'
								|| storeCateDetailName[6] eq '고기요리' || storeCateDetailName[7] eq '고기요리' || storeCateDetailName[8] eq '고기요리'
								|| storeCateDetailName[9] eq '고기요리' || storeCateDetailName[10] eq '고기요리' || storeCateDetailName[11] eq '고기요리'
								|| storeCateDetailName[12] eq '고기요리' || storeCateDetailName[13] eq '고기요리' || storeCateDetailName[14] eq '고기요리'
								|| storeCateDetailName[15] eq '고기요리' || storeCateDetailName[16] eq '고기요리' || storeCateDetailName[17] eq '고기요리'
								|| storeCateDetailName[18] eq '고기요리' || storeCateDetailName[19] eq '고기요리' || storeCateDetailName[20] eq '고기요리'
								|| storeCateDetailName[21] eq '고기요리' || storeCateDetailName[22] eq '고기요리' || storeCateDetailName[23] eq '고기요리'
								|| storeCateDetailName[24] eq '고기요리' || storeCateDetailName[25] eq '고기요리'}">
					<input type="checkbox" id="meatFood" name="storeCateDetailName" value="고기요리" checked><label for="meatFood">고기요리</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="meatFood" name="storeCateDetailName" value="고기요리"><label for="meatFood">고기요리</label>
				</c:otherwise>
			</c:choose>					
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '분식' || storeCateDetailName[1] eq '분식' || storeCateDetailName[2] eq '분식' 
								|| storeCateDetailName[3] eq '분식' || storeCateDetailName[4] eq '분식' || storeCateDetailName[5] eq '분식'
								|| storeCateDetailName[6] eq '분식' || storeCateDetailName[7] eq '분식' || storeCateDetailName[8] eq '분식'
								|| storeCateDetailName[9] eq '분식' || storeCateDetailName[10] eq '분식' || storeCateDetailName[11] eq '분식'
								|| storeCateDetailName[12] eq '분식' || storeCateDetailName[13] eq '분식' || storeCateDetailName[14] eq '분식'
								|| storeCateDetailName[15] eq '분식' || storeCateDetailName[16] eq '분식' || storeCateDetailName[17] eq '분식'
								|| storeCateDetailName[18] eq '분식' || storeCateDetailName[19] eq '분식' || storeCateDetailName[20] eq '분식'
								|| storeCateDetailName[21] eq '분식' || storeCateDetailName[22] eq '분식' || storeCateDetailName[23] eq '분식'
								|| storeCateDetailName[24] eq '분식' || storeCateDetailName[25] eq '분식' || storeCateDetailName[26] eq '분식'}">
					<input type="checkbox" id="snackBar" name="storeCateDetailName" value="분식" checked><label for="snackBar">분식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="snackBar" name="storeCateDetailName" value="분식"><label for="snackBar">분식</label>
				</c:otherwise>
			</c:choose>							
									
										
		</div>
	</div>

		</c:when>
		<c:when test="${food eq '중식'}">
		<input type="hidden" name="place" value="홍대">
		<input type="hidden" name="food" value="중식">

	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '중식당'}">
					<input type="checkbox" id="chineseRestaurant" name="storeCateDetailName" value="중식당" checked><label for="chineseRestaurant">중식당</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="chineseRestaurant" name="storeCateDetailName" value="중식당"><label for="chineseRestaurant">중식당</label>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '양꼬치' || storeCateDetailName[1] eq '양꼬치'}">
					<input type="checkbox" id="skipjack" name="storeCateDetailName" value="양꼬치" checked><label for="skipjack">양꼬치</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="skipjack" name="storeCateDetailName" value="양꼬치"><label for="skipjack">양꼬치</label>
				</c:otherwise>
			</c:choose>			
		</div>
	</div>
		
		</c:when>
		<c:when test="${food eq '일식'}">	
		<input type="hidden" name="place" value="홍대">
		<input type="hidden" name="food" value="일식">		
		
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '일식당'}">
					<input type="checkbox" id="japaneseRestaurant" name="storeCateDetailName" value="일식당" checked><label for="japaneseRestaurant">일식당</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="japaneseRestaurant" name="storeCateDetailName" value="일식당"><label for="japaneseRestaurant">일식당</label>
				</c:otherwise>
			</c:choose>		
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '일본식라면' || storeCateDetailName[1] eq '일본식라면'}">
					<input type="checkbox" id="japaneseRamen" name="storeCateDetailName" value="일본식라면" checked><label for="japaneseRamen">일본식라면</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="japaneseRamen" name="storeCateDetailName" value="일본식라면"><label for="japaneseRamen">일본식라면</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '돈가스' || storeCateDetailName[1] eq '돈가스' || storeCateDetailName[2] eq '돈가스'}">
					<input type="checkbox" id="porkCutlets" name="storeCateDetailName" value="돈가스" checked><label for="porkCutlets">돈가스</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="porkCutlets" name="storeCateDetailName" value="돈가스"><label for="porkCutlets">돈가스</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '샤브샤브' || storeCateDetailName[1] eq '샤브샤브' || storeCateDetailName[2] eq '샤브샤브'
								|| storeCateDetailName[3] eq '샤브샤브'}">
					<input type="checkbox" id="shabu" name="storeCateDetailName" value="샤브샤브" checked><label for="shabu">샤브샤브</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="shabu" name="storeCateDetailName" value="샤브샤브"><label for="shabu">샤브샤브</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '오니기리' || storeCateDetailName[1] eq '오니기리' || storeCateDetailName[2] eq '오니기리'
								|| storeCateDetailName[3] eq '오니기리' || storeCateDetailName[4] eq '오니기리'}">
					<input type="checkbox" id="onigiri" name="storeCateDetailName" value="오니기리" checked><label for="onigiri">오니기리</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="onigiri" name="storeCateDetailName" value="오니기리"><label for="onigiri">오니기리</label>
				</c:otherwise>
			</c:choose>					
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '오므라이스' || storeCateDetailName[1] eq '오므라이스' || storeCateDetailName[2] eq '오므라이스'
								|| storeCateDetailName[3] eq '오므라이스' || storeCateDetailName[4] eq '오므라이스' || storeCateDetailName[5] eq '오므라이스'}">
					<input type="checkbox" id="omelet" name="storeCateDetailName" value="오므라이스" checked><label for="omelet">오므라이스</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="omelet" name="storeCateDetailName" value="오므라이스"><label for="omelet">오므라이스</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '우동,소바' || storeCateDetailName[1] eq '우동,소바' || storeCateDetailName[2] eq '우동,소바'
								|| storeCateDetailName[3] eq '우동,소바' || storeCateDetailName[4] eq '우동,소바' || storeCateDetailName[5] eq '우동,소바'
								|| storeCateDetailName[6] eq '우동,소바'}">
					<input type="checkbox" id="udonSoba" name="storeCateDetailName" value="우동,소바" checked><label for="udonSoba">우동,소바</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="udonSoba" name="storeCateDetailName" value="우동,소바"><label for="udonSoba">우동,소바</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '일식튀김,꼬치' || storeCateDetailName[1] eq '일식튀김,꼬치' || storeCateDetailName[2] eq '일식튀김,꼬치'
								|| storeCateDetailName[3] eq '일식튀김,꼬치' || storeCateDetailName[4] eq '일식튀김,꼬치' || storeCateDetailName[5] eq '일식튀김,꼬치'
								|| storeCateDetailName[6] eq '일식튀김,꼬치' || storeCateDetailName[7] eq '일식튀김,꼬치'}">
					<input type="checkbox" id="japaneseFry" name="storeCateDetailName" value="일식튀김,꼬치" checked><label for="japaneseFry">일식튀김,꼬치</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="japaneseFry" name="storeCateDetailName" value="일식튀김,꼬치"><label for="japaneseFry">일식튀김,꼬치</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '초밥,롤' || storeCateDetailName[1] eq '초밥,롤' || storeCateDetailName[2] eq '초밥,롤'
								|| storeCateDetailName[3] eq '초밥,롤' || storeCateDetailName[4] eq '초밥,롤' || storeCateDetailName[5] eq '초밥,롤'
								|| storeCateDEtailName[6] eq '초밥,롤' || storeCateDetailName[7] eq '초밥,롤' || storeCateDetailName[8] eq '초밥,롤'}">
					<input type="checkbox" id="sushi" name="storeCateDetailName" value="초밥,롤" checked><label for="sushi">초밥,롤</label>		
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="sushi" name="storeCateDetailName" value="초밥,롤"><label for="sushi">초밥,롤</label>		
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '덮밥' || storeCateDetailName[1] eq '덮밥' || storeCateDetailName[2] eq '덮밥'
								|| storeCateDetailName[3] eq '덮밥' || storeCateDetailName[4] eq '덮밥' || storeCateDetailName[5] eq '덮밥'
								|| storeCateDetailName[6] eq '덮밥' || storeCateDetailName[7] eq '덮밥' || storeCateDetailName[8] eq '덮밥'
								|| storeCateDetailName[9] eq '덮밥'}">
					<input type="checkbox" id="riceBowl" name="storeCateDetailName" value="덮밥" checked><label for="riceBowl">덮밥</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="riceBowl" name="storeCateDetailName" value="덮밥"><label for="riceBowl">덮밥</label>
				</c:otherwise>
			</c:choose>											
		</div>
	</div>
		
		
		</c:when>
		<c:when test="${food eq '양식'}">
		<input type="hidden" name="place" value="홍대">
		<input type="hidden" name="food" value="양식">			
			
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '스테이크,립'}">
					<input type="checkbox" id="steak" name="storeCateDetailName" value="스테이크,립" checked><label for="steak">스테이크,립</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="steak" name="storeCateDetailName" value="스테이크,립"><label for="steak">스테이크,립</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '피자' || storeCateDetailName[1] eq '피자'}">
					<input type="checkbox" id="pizza" name="storeCateDetailName" value="피자" checked><label for="pizza">피자</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="pizza" name="storeCateDetailName" value="피자"><label for="pizza">피자</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '햄버거' || storeCateDetailName[1] eq '햄버거' || storeCateDetailName[2] eq '햄버거'}">
					<input type="checkbox" id="hamburger" name="storeCateDetailName" value="햄버거" checked><label for="hamburger">햄버거</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="hamburger" name="storeCateDetailName" value="햄버거"><label for="hamburger">햄버거</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '핫도그' || storeCateDetailName[1] eq '핫도그' || storeCateDetailName[2] eq '핫도그'
								|| storeCateDetailName[3] eq '핫도그'}">
					<input type="checkbox" id="hotdog" name="storeCateDetailName" value="핫도그" checked><label for="hotdog">핫도그</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="hotdog" name="storeCateDetailName" value="핫도그"><label for="hotdog">핫도그</label>
				</c:otherwise>
			</c:choose>							
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '후렌치후라이' || storeCateDetailName[1] eq '후렌치후라이' || storeCateDetailName[2] eq '후렌치후라이'
								|| storeCateDetailName[3] eq '후렌치후라이' || storeCateDetailName[4] eq '후렌치후라이'}">
					<input type="checkbox" id="frenchFry" name="storeCateDetailName" value="후렌치후라이" checked><label for="frenchFry">후렌치후라이</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="frenchFry" name="storeCateDetailName" value="후렌치후라이"><label for="frenchFry">후렌치후라이</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '샌드위치' || storeCateDetailName[1] eq '샌드위치' || storeCateDetailName[2] eq '샌드위치'
								|| storeCateDetailName[3] eq '샌드위치' || storeCateDetailName[4] eq '샌드위치' || storeCateDetailName[5] eq '샌드위치'}">
					<input type="checkbox" id="sandwich" name="storeCateDetailName" value="샌드위치" checked><label for="sandwich">샌드위치</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="sandwich" name="storeCateDetailName" value="샌드위치"><label for="sandwich">샌드위치</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '해물,생선요리' || storeCateDetailName[1] eq '해물,생선요리' || storeCateDetailName[2] eq '해물,생선요리'
								|| storeCateDetailName[3] eq '해물,생선요리' || storeCateDetailName[4] eq '해물,생선요리' || storeCateDetailName[5] eq '해물,생선요리'
								|| storeCateDetailName[6] eq '해물,생선요리'}">
					<input type="checkbox" id="seafood" name="storeCateDetailName" value="해물,생선요리" checked><label for="seafood">해물,생선요리</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="seafood" name="storeCateDetailName" value="해물,생선요리"><label for="seafood">해물,생선요리</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '프랑스음식' || storeCateDetailName[1] eq '프랑스음식' || storeCateDetailName[2] eq '프랑스음식'
								|| storeCateDetailName[3] eq '프랑스음식' || storeCateDetailName[4] eq '프랑스음식' || storeCateDetailName[5] eq '프랑스음식'
								|| storeCateDetailName[6] eq '프랑스음식' || storeCateDetailName[7] eq '프랑스음식'}">
					<input type="checkbox" id="franceFood" name="storeCateDetailName" value="프랑스음식" checked><label for="franceFood">프랑스음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="franceFood" name="storeCateDetailName" value="프랑스음식"><label for="franceFood">프랑스음식</label>
				</c:otherwise>
			</c:choose>		
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '이탈리아음식' || storeCateDetailName[1] eq '이탈리아음식' || storeCateDetailName[2] eq '이탈리아음식'
								|| storeCateDetailName[3] eq '이탈리아음식' || storeCateDetailName[4] eq '이탈리아음식' || storeCateDetailName[5] eq '이탈리아음식'
								|| storeCateDetailName[6] eq '이탈리아음식' || storeCateDetailName[7] eq '이탈리아음식' || storeCateDetailName[8] eq '이탈리아음식'}">
					<input type="checkbox" id="italyFood" name="storeCateDetailName" value="이탈리아음식" checked><label for="italyFood">이탈리아음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="italyFood" name="storeCateDetailName" value="이탈리아음식"><label for="italyFood">이탈리아음식</label>
				</c:otherwise>
			</c:choose>		
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '미국음식' || storeCateDetailName[1] eq '미국음식' || storeCateDetailName[2] eq '미국음식'
								|| storeCateDetailName[3] eq '미국음식' || storeCateDetailName[4] eq '미국음식' || storeCateDetailName[5] eq '미국음식'
								|| storeCateDetailName[6] eq '미국음식' || storeCateDetailName[7] eq '미국음식' || storeCateDetailName[8] eq '미국음식'
								|| storeCateDetailName[9] eq '미국음식'}">
					<input type="checkbox" id="usaFood" name="storeCateDetailName" value="미국음식" checked><label for="usaFood">미국음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="usaFood" name="storeCateDetailName" value="미국음식"><label for="usaFood">미국음식</label>
				</c:otherwise>
			</c:choose>					
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '멕시코음식' || storeCateDetailName[1] eq '멕시코음식' || storeCateDetailName[2] eq '멕시코음식'
								|| storeCateDetailName[3] eq '멕시코음식' || storeCateDetailName[4] eq '멕시코음식' || storeCateDetailName[5] eq '멕시코음식'
								|| storeCateDetailName[6] eq '멕시코음식' || storeCateDetailName[7] eq '멕시코음식' || storeCateDetailName[8] eq '멕시코음식'
								|| storeCateDetailName[9] eq '멕시코음식' || storeCateDetailName[10] eq '멕시코음식'}">
					<input type="checkbox" id="mexicoFood" name="storeCateDetailName" value="멕시코음식" checked><label for="mexicoFood">멕시코음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="mexicoFood" name="storeCateDetailName" value="멕시코음식"><label for="mexicoFood">멕시코음식</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '스페인음식' || storeCateDetailName[1] eq '스페인음식' || storeCateDetailName[2] eq '스페인음식'
								|| storeCateDetailName[3] eq '스페인음식' || storeCateDetailName[4] eq '스페인음식' || storeCateDetailName[5] eq '스페인음식'
								|| storeCateDetailName[6] eq '스페인음식' || storeCateDetailName[7] eq '스페인음식' || storeCateDetailName[8] eq '스페인음식'
								|| storeCateDetailName[9] eq '스페인음식' || storeCateDetailName[10] eq '스페인음식' || storeCateDetailName[11] eq '스페인음식'}">
					<input type="checkbox" id="spainFood" name="storeCateDetailName" value="스페인음식" checked><label for="spainFood">스페인음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="spainFood" name="storeCateDetailName" value="스페인음식"><label for="spainFood">스페인음식</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '그리스음식' || storeCateDetailName[1] eq '그리스음식' || storeCateDetailName[2] eq '그리스음식'
								|| storeCateDetailName[3] eq '그리스음식' || storeCateDetailName[4] eq '그리스음식' || storeCateDetailName[5] eq '그리스음식'
								|| storeCateDetailName[6] eq '그리스음식' || storeCateDetailName[7] eq '그리스음식' || storeCateDetailName[8] eq '그리스음식'
								|| storeCateDetailName[9] eq '그리스음식' || storeCateDetailName[10] eq '그리스음식' || storeCateDetailName[11] eq '그리스음식'
								|| storeCateDetailName[12] eq '그리스음식'}">
					<input type="checkbox" id="greeceFood" name="storeCateDetailName" value="그리스음식" checked><label for="greeceFood">그리스음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="greeceFood" name="storeCateDetailName" value="그리스음식"><label for="greeceFood">그리스음식</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '터키음식' || storeCateDetailName[1] eq '터키음식' || storeCateDetailName[2] eq '터키음식'
								|| storeCateDetailName[3] eq '터키음식' || storeCateDetailName[4] eq '터키음식' || storeCateDetailName[5] eq '터키음식'
								|| storeCateDetailName[6] eq '터키음식' || storeCateDetailName[7] eq '터키음식' || storeCateDetailName[8] eq '터키음식'
								|| storeCateDetailName[9] eq '터키음식' || storeCateDetailName[10] eq '터키음식' || storeCateDetailName[11] eq '터키음식'
								|| storeCateDetailName[12] eq '터키음식' || storeCateDetailName[13] eq '터키음식'}">
					<input type="checkbox" id="turkeyFood" name="storeCateDetailName" value="터키음식" checked><label for="turkeyFood">터키음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="turkeyFood" name="storeCateDetailName" value="터키음식"><label for="turkeyFood">터키음식</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '독일음식' || storeCateDetailName[1] eq '독일음식' || storeCateDetailName[2] eq '독일음식'
								|| storeCateDetailName[3] eq '독일음식' || storeCateDetailName[4] eq '독일음식' || storeCateDetailName[5] eq '독일음식'
								|| storeCateDetailName[6] eq '독일음식' || storeCateDetailName[7] eq '독일음식' || storeCateDetailName[8] eq '독일음식'
								|| storeCateDetailName[9] eq '독일음식' || storeCateDetailName[10] eq '독일음식' || storeCateDetailName[11] eq '독일음식'
								|| storeCateDetailName[12] eq '독일음식' || storeCateDetailName[13] eq '독일음식' || storeCateDetailName[14] eq '독일음식'}">
					<input type="checkbox" id="germanyFood" name="storeCateDetailName" value="독일음식" checked><label for="germanyFood">독일음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="germanyFood" name="storeCateDetailName" value="독일음식"><label for="germanyFood">독일음식</label>
				</c:otherwise>
			</c:choose>									
		</div>
	</div>
			
			
		</c:when>

		<c:when test="${food eq '뷔페'}">
		<input type="hidden" name="place" value="홍대">
		<input type="hidden" name="food" value="뷔페">
		
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '한식뷔페'}">
					<input type="checkbox" id="koreaBuffet" name="storeCateDetailName" value="한식뷔페" checked><label for="koreaBuffet">한식뷔페</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="koreaBuffet" name="storeCateDetailName" value="한식뷔페"><label for="koreaBuffet">한식뷔페</label>
				</c:otherwise>
			</c:choose>		
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '고기뷔페' || storeCateDetailName[1] eq '고기뷔페'}">
					<input type="checkbox" id="meatBuffet" name="storeCateDetailName" value="고기뷔페" checked><label for="meatBuffet">고기뷔페</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="meatBuffet" name="storeCateDetailName" value="고기뷔페"><label for="meatBuffet">고기뷔페</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '해산물뷔페' || storeCateDetailName[1] eq '해산물뷔페' || storeCateDetailName[2] eq '해산물뷔페'}">
					<input type="checkbox" id="seafoodBuffet" name="storeCateDetailName" value="해산물뷔페" checked><label for="seafoodBuffet">해산물뷔페</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="seafoodBuffet" name="storeCateDetailName" value="해산물뷔페"><label for="seafoodBuffet">해산물뷔페</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '일식,초밥뷔페' || storeCateDetailName[1] eq '일식,초밥뷔페' || storeCateDetailName[2] eq '일식,초밥뷔페'
								|| storeCateDetailName[3] eq '일식,초밥뷔페'}">
					<input type="checkbox" id="sushiBuffet" name="storeCateDetailName" value="일식,초밥뷔페" checked><label for="sushiBuffet">일식,초밥뷔페</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="sushiBuffet" name="storeCateDetailName" value="일식,초밥뷔페"><label for="sushiBuffet">일식,초밥뷔페</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '채식,샐러드뷔페' || storeCateDetailName[1] eq '채식,샐러드뷔페' || storeCateDetailName[2] eq '채식,샐러드뷔페'
								|| storeCateDetailName[3] eq '채식,샐러드뷔페' || storeCateDetailName[4] eq '채식,샐러드뷔페'}">
					<input type="checkbox" id="saladBuffet" name="storeCateDetailName" value="채식,샐러드뷔페" checked><label for="saladBuffet">채식,샐러드뷔페</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="saladBuffet" name="storeCateDetailName" value="채식,샐러드뷔페"><label for="saladBuffet">채식,샐러드뷔페</label>
				</c:otherwise>
			</c:choose>							
		</div>
	</div>			
		</c:when>
		
		<c:when test="${food eq '디저트'}">
		<input type="hidden" name="place" value="홍대">
		<input type="hidden" name="food" value="디저트">

	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '카페'}">
					<input type="checkbox" id="cafe" name="storeCateDetailName" value="카페" checked><label for="cafe">카페</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="cafe" name="storeCateDetailName" value="카페"><label for="cafe">카페</label>
				</c:otherwise>
			</c:choose>		
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '베이커리' || storeCateDetailName[1] eq '베이커리'}">
					<input type="checkbox" id="bakery" name="storeCateDetailName" value="베이커리" checked><label for="bakery">베이커리</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="bakery" name="storeCateDetailName" value="베이커리"><label for="bakery">베이커리</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '케이크전문' || storeCateDetailName[1] eq '케이크전문' || storeCateDetailName[2] eq '케이크전문'}">
					<input type="checkbox" id="cake" name="storeCateDetailName" value="케이크전문" checked><label for="cake">케이크전문</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="cake" name="storeCateDetailName" value="케이크전문"><label for="cake">케이크전문</label>
				</c:otherwise>
			</c:choose>						
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '도넛' || storeCateDetailName[1] eq '도넛' || storeCateDetailName[2] eq '도넛'
								|| storeCateDetailName[3] eq '도넛'}">
					<input type="checkbox" id="donut" name="storeCateDetailName" value="도넛" checked><label for="donut">도넛</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="donut" name="storeCateDetailName" value="도넛"><label for="donut">도넛</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '와플' || storeCateDetailName[1] eq '와플' || storeCateDetailName[2] eq '와플'
								|| storeCateDetailName[3] eq '와플' || storeCateDetailName[4] eq '와플'}">
					<input type="checkbox" id="waffle" name="storeCateDetailName" value="와플" checked><label for="waffle">와플</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="waffle" name="storeCateDetailName" value="와플"><label for="waffle">와플</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '호두과자' || storeCateDetailName[1] eq '호두과자' || storeCateDetailName[2] eq '호두과자'
								|| storeCateDetailName[3] eq '호두과자' || storeCateDetailName[4] eq '호두과자' || storeCateDetailName[5] eq '호두과자'}">
					<input type="checkbox" id="walnut" name="storeCateDetailName" value="호두과자" checked><label for="walnut">호두과자</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="walnut" name="storeCateDetailName" value="호두과자"><label for="walnut">호두과자</label>
				</c:otherwise>
			</c:choose>						
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '떡,한과' || storeCateDetailName[1] eq '떡,한과' || storeCateDetailName[2] eq '떡,한과'
								|| storeCateDetailName[3] eq '떡,한과' || storeCateDetailName[4] eq '떡,한과' || storeCateDetailName[5] eq '떡,한과'
								|| storeCateDetailName[6] eq '떡,한과'}">
					<input type="checkbox" id="mochi" name="storeCateDetailName" value="떡,한과" checked><label for="mochi">떡,한과</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="mochi" name="storeCateDetailName" value="떡,한과"><label for="mochi">떡,한과</label>
				</c:otherwise>
			</c:choose>				
		</div>
	</div>				
		</c:when>
		
		<c:when test="${food eq '술집'}">
		<input type="hidden" name="place" value="홍대">
		<input type="hidden" name="food" value="술집">		
		
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '바'}">
					<input type="checkbox" id="bar" name="storeCateDetailName" value="바" checked><label for="bar">바</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="bar" name="storeCateDetailName" value="바"><label for="bar">바</label>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '펍' || storeCateDetailName[1] eq '펍'}">
					<input type="checkbox" id="pub" name="storeCateDetailName" value="펍" checked><label for="pub">펍</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="pub" name="storeCateDetailName" value="펍"><label for="pub">펍</label>
				</c:otherwise>
			</c:choose>					
		</div>
	</div>			
		</c:when>		
		
		<c:when test="${food eq '기타'}">
		<input type="hidden" name="place" value="홍대">
		<input type="hidden" name="food" value="기타">		
			<div class="detailSearch">
				<h3>세부 음식 검색</h3>
				<div>
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '패밀리레스토랑'}">
					<input type="checkbox" id="familyRestaurant" name="storeCateDetailName" value="패밀리레스토랑" checked><label for="familyRestaurant">패밀리레스토랑</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="familyRestaurant" name="storeCateDetailName" value="패밀리레스토랑"><label for="familyRestaurant">패밀리레스토랑</label>
				</c:otherwise>
			</c:choose>						
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '아시아음식' || storeCateDetailName[1] eq '아시아음식'}">
					<input type="checkbox" id="asiaFood" name="storeCateDetailName" value="아시아음식" checked><label for="asiaFood">아시아음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="asiaFood" name="storeCateDetailName" value="아시아음식"><label for="asiaFood">아시아음식</label>
				</c:otherwise>
			</c:choose>							
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '베트남음식' || storeCateDetailName[1] eq '베트남음식' || storeCateDetailName[2] eq '베트남음식'}">
					<input type="checkbox" id="vietnamFood" name="storeCateDetailName" value="베트남음식" checked><label for="vietnamFood">베트남음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="vietnamFood" name="storeCateDetailName" value="베트남음식"><label for="vietnamFood">베트남음식</label>
				</c:otherwise>
			</c:choose>						
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '인도음식' || storeCateDetailName[1] eq '인도음식' || storeCateDetailName[2] eq '인도음식'
								|| storeCateDetailName[3] eq '인도음식'}">
					<input type="checkbox" id="indiaFood" name="storeCateDetailName" value="인도음식" checked><label for="indiaFood">인도음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="indiaFood" name="storeCateDetailName" value="인도음식"><label for="indiaFood">인도음식</label>
				</c:otherwise>
			</c:choose>						
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '태국음식' || storeCateDetailName[1] eq '태국음식' || storeCateDetailName[2] eq '태국음식'
								|| storeCateDetailName[3] eq '태국음식' || storeCateDetailName[4] eq '태국음식'}">
					<input type="checkbox" id="thaiFood" name="storeCateDetailName" value="태국음식" checked><label for="thaiFood">태국음식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="thaiFood" name="storeCateDetailName" value="태국음식"><label for="thaiFood">태국음식</label>
				</c:otherwise>
			</c:choose>						
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '도시락,컵밥' || storeCateDetailName[1] eq '도시락,컵밥' || storeCateDetailName[2] eq '도시락,컵밥'
								|| storeCateDetailName[3] eq '도시락,컵밥' || storeCateDetailName[4] eq '도시락,컵밥' || storeCateDetailName[5] eq '도시락,컵밥'}">
					<input type="checkbox" id="lunchBox" name="storeCateDetailName" value="도시락,컵밥" checked><label for="lunchBox">도시락,컵밥</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="lunchBox" name="storeCateDetailName" value="도시락,컵밥"><label for="lunchBox">도시락,컵밥</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${storeCateDetailName[0] eq '치킨,닭강정' || storeCateDetailName[1] eq '치킨,닭강정' || storeCateDetailName[2] eq '치킨,닭강정'
								|| storeCateDetailName[3] eq '치킨,닭강정' || storeCateDetailName[4] eq '치킨,닭강정' || storeCateDetailName[5] eq '치킨,닭강정'
								|| storeCateDetailName[6] eq '치킨,닭강정'}">
					<input type="checkbox" id="chicken" name="storeCateDetailName" value="치킨,닭강정" checked><label for="chicken">치킨,닭강정</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="chicken" name="storeCateDetailName" value="치킨,닭강정"><label for="chicken">치킨,닭강정</label>
				</c:otherwise>
			</c:choose>								
				</div>
			</div>	
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	<div class="detailSearch">
		<h3>예산(2인 기준)</h3>
		<div>
			<c:choose>
				<c:when test="${owBudget[0] eq '2만원미만'}">
					<input type="checkbox" id="money0" name="owBudget" value="2만원미만" checked><label for="money0">2만원미만</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="money0" name="owBudget" value="2만원미만"><label for="money0">2만원미만</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${owBudget[0] eq '2-5만원' || owBudget[1] eq '2-5만원'}">
					<input type="checkbox" id="money2" name="owBudget" value="2-5만원" checked><label for="money2">2-5만원</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="money2" name="owBudget" value="2-5만원"><label for="money2">2-5만원</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${owBudget[0] eq '5-10만원' || owBudget[1] eq '5-10만원' || owBudget[2] eq '5-10만원'}">
					<input type="checkbox" id="money5" name="owBudget" value="5-10만원" checked><label for="money5">5-10만원</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="money5" name="owBudget" value="5-10만원"><label for="money5">5-10만원</label>
				</c:otherwise>
			</c:choose>							
			<c:choose>
				<c:when test="${owBudget[0] eq '10만원이상' || owBudget[1] eq '10만원이상' || owBudget[2] eq '10만원이상'
								|| owBudget[3] eq '10만원이상'}">
					<input type="checkbox" id="money10" name="owBudget" value="10만원이상" checked><label for="money10">10만원이상</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="money10" name="owBudget" value="10만원이상"><label for="money10">10만원이상</label>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="detailSearch">
		<h3 style="margin-right:55px;">부가 정보</h3>
		<div>
			<c:choose>
				<c:when test="${owSubInfo[0] eq '주차 가능'}">
					<input type="checkbox" id="parkingAvailable" name="owSubInfo" value="주차 가능" checked><label for="parkingAvailable">주차 가능</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="parkingAvailable" name="owSubInfo" value="주차 가능"><label for="parkingAvailable">주차 가능</label>
				</c:otherwise>
			</c:choose>	
			<c:choose>
				<c:when test="${owSubInfo[0] eq '아이동반 가능' || owSubInfo[1] eq '아이동반 가능'}">
					<input type="checkbox" id="childAvailable" name="owSubInfo" value="아이동반 가능" checked><label for="childAvailable">아이동반 가능</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="childAvailable" name="owSubInfo" value="아이동반 가능"><label for="childAvailable">아이동반 가능</label>
				</c:otherwise>
			</c:choose>					
			<c:choose>
				<c:when test="${owSubInfo[0] eq '단체석 예약 가능' || owSubInfo[1] eq '단체석 예약 가능' || owSubInfo[2] eq '단체석 예약 가능'}">
					<input type="checkbox" id="groupReservation" name="owSubInfo" value="단체석 예약 가능" checked><label for="groupReservation">단체석 예약 가능</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="groupReservation" name="owSubInfo" value="단체석 예약 가능"><label for="groupReservation">단체석 예약 가능</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${owSubInfo[0] eq '24시간 영업' || owSubInfo[1] eq '24시간 영업' || owSubInfo[2] eq '24시간 영업'
								|| owSubInfo[3] eq '24시간 영업'}">
					<input type="checkbox" id="open24" name="owSubInfo" value="24시간 영업" checked><label for="open24">24시간 영업</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="open24" name="owSubInfo" value="24시간 영업"><label for="open24">24시간 영업</label>
				</c:otherwise>
			</c:choose>			
		</div>		
	</div>
	<div class="detailSearch">
		<h3>판매 주류 종류</h3>
		<div>
			<c:choose>
				<c:when test="${owDrinkListInfo[0] eq '소주'}">
					<input type="checkbox" id="soju" name="owDrinkListInfo" value="소주" checked><label for="soju">소주</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="soju" name="owDrinkListInfo" value="소주"><label for="soju">소주</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${owDrinkListInfo[0] eq '맥주' || owDrinkListInfo[1] eq '맥주'}">
					<input type="checkbox" id="beer" name="owDrinkListInfo" value="맥주" checked><label for="beer">맥주</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="beer" name="owDrinkListInfo" value="맥주"><label for="beer">맥주</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${owDrinkListInfo[0] eq '사케' || owDrinkListInfo[1] eq '사케' || owDrinkListInfo[2] eq '사케'}">
					<input type="checkbox" id="sake" name="owDrinkListInfo" value="사케" checked><label for="sake">사케</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="sake" name="owDrinkListInfo" value="사케"><label for="sake">사케</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${owDrinkListInfo[0] eq '양주' || owDrinkListInfo[1] eq '양주' || owDrinkListInfo[2] eq '양주'
								|| owDrinkListInfo[3] eq '양주'}">
					<input type="checkbox" id="liquor" name="owDrinkListInfo" value="양주" checked><label for="liquor">양주</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="liquor" name="owDrinkListInfo" value="양주"><label for="liquor">양주</label>
				</c:otherwise>
			</c:choose>			
			<c:choose>
				<c:when test="${owDrinkListInfo[0] eq '와인' || owDrinkListInfo[1] eq '와인' || owDrinkListInfo[2] eq '와인'
								|| owDrinkListInfo[3] eq '와인' || owDrinkListInfo[4] eq '와인'}">
					<input type="checkbox" id="wine" name="owDrinkListInfo" value="와인" checked><label for="wine">와인</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="wine" name="owDrinkListInfo" value="와인"><label for="wine">와인</label>
				</c:otherwise>
			</c:choose>				
			<c:choose>
				<c:when test="${owDrinkListInfo[0] eq '칵테일' || owDrinkListInfo[1] eq '칵테일' || owDrinkListInfo[2] eq '칵테일'
								|| owDrinkListInfo[3] eq '칵테일' || owDrinkListInfo[4] eq '칵테일' || owDrinkListInfo[5] eq '칵테일'}">
					<input type="checkbox" id="cocktail" name="owDrinkListInfo" value="칵테일" checked><label for="cocktail">칵테일</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="cocktail" name="owDrinkListInfo" value="칵테일"><label for="cocktail">칵테일</label>
				</c:otherwise>
			</c:choose>				
			
		</div>
	</div>
	<input type="submit" value="상세정보 검색하기">
	</form>
	<h4>총 <span>0</span>개가 검색되었습니다</h4>
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
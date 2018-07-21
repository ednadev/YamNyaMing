<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css?ver=7">
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
	    		<option>지역 선택</option>
	    		<option value="홍대" selected>홍대</option>
    		</c:when> 
    		<c:otherwise>
	    		<option selected>지역 선택</option>
	    		<option value="홍대">홍대</option>    		
    		</c:otherwise>   	
    	</c:choose>
    	</select>
    	<select name="food" id="food">
    	<c:choose>
    		<c:when test="${food eq '한식'}">
	     		<option>음식 종류 선택</option>
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
	     		<option>음식 종류 선택</option>
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
	     		<option>음식 종류 선택</option>
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
	     		<option>음식 종류 선택</option>
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
	     		<option>음식 종류 선택</option>
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
	     		<option>음식 종류 선택</option>
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
	     		<option>음식 종류 선택</option>
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
	     		<option>음식 종류 선택</option>
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
	     		<option selected>음식 종류 선택</option>
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
        <li><a href="/loginMember.do">로그인</a></li>
        <li><a href="/enrollMember.do">회원가입</a></li>
    </ul>

</header>
<section id="member-search-section">
	<div id="map"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js?ver=1"></script>
	<div class="member-search-wrapper">
	<h2>자세히 검색</h2>
	<c:choose>
		<c:when test="${food eq '한식' }">

	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="homeFood" name="detailFood"><label for="homeFood">백반,가정식</label>
			<input type="checkbox" id="koreanRestaurant" name="detailFood"><label for="kereanRestaurant">한정식</label>
			<input type="checkbox" id="ssambap" name="detailFood"><label for="ssambap">쌈밥</label>
			<input type="checkbox" id="boribap" name="detailFood"><label for="boribap">보리밥</label>
			<input type="checkbox" id="bibimbap" name="detailFood"><label for="bibimbap">비빔밥</label>
			<input type="checkbox" id="juk" name="detailFood"><label for="juk">죽</label>
			<input type="checkbox" id="soupbap" name="detailFood"><label for="soupbap">국밥</label>
			<input type="checkbox" id="noodle" name="detailFood"><label for="noodle">국수</label>
			<input type="checkbox" id="coldNoodle" name="detailFood"><label for="coldNoodle">냉면</label>
			<input type="checkbox" id="makguksu" name="detailFood"><label for="makguksu">막국수</label>
			<input type="checkbox" id="stew" name="detailFood"><label for="stew">찌개,전골</label>
			
		</div>
	</div>
	<div class="detailSearch">
		<div>
			<input type="checkbox" id="chuatang" name="detailFood"><label for="chuatang" style="margin-left:119px;">추어탕</label>
			<input type="checkbox" id="gamjatang" name="detailFood"><label for="gamjatang">감자탕</label>
			<input type="checkbox" id="hazelnut" name="detailFood"><label for="hazelnut">해장국</label>
			<input type="checkbox" id="sullungtang" name="detailFood"><label for="sullungtang">곰탕,설렁탕</label>
			<input type="checkbox" id="galbitang" name="detailFood"><label for="galbitang">갈비탕</label>
			<input type="checkbox" id="steamFood" name="detailFood"><label for="steamFood">찜요리</label>
			<input type="checkbox" id="grillFood" name="detailFood"><label for="grillFood">구이요리</label>			
			<input type="checkbox" id="tofuFood" name="detailFood"><label for="tofuFood">두부요리</label>
			<input type="checkbox" id="stirFry" name="detailFood"><label for="stirFry">볶음요리</label>
		</div>
	</div>
	<div class="detailSearch">
		<div>
			<input type="checkbox" id="koreanSeafood" name="detailFood"><label for="koreanSeafood" style="margin-left:119px;">해산물요리</label>			
			<input type="checkbox" id="kalguksu" name="detailFood"><label for="kalguksu">칼국수,만두</label>
			<input type="checkbox" id="koreanCake" name="detailFood"><label for="koreanCake">전,빈대떡</label>
			<input type="checkbox" id="meatFood" name="detailFood"><label for="meatFood">고기요리</label>
			<input type="checkbox" id="snackBar" name="detailFood"><label for="snackBar">분식</label>
		</div>
	</div>	

		</c:when>
		<c:when test="${food eq '중식'}">

	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="chineseRestaurant" name="detailFood"><label for="chineseRestaurant">중식당</label>
			<input type="checkbox" id="skipjack" name="detailFood"><label for="skipjack">양꼬치</label>
		</div>
	</div>
		
		</c:when>
		<c:when test="${food eq '일식'}">	
		
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="japaneseRestaurant" name="detailFood"><label for="japaneseRestaurant">일식당</label>
			<input type="checkbox" id="japaneseRamen" name="detailFood"><label for="japaneseRamen">일본식라면</label>
			<input type="checkbox" id="porkCutlets" name="detailFood"><label for="porkCutlets">돈가스</label>
			<input type="checkbox" id="shabu" name="detailFood"><label for="shabu">샤브샤브</label>
			<input type="checkbox" id="onigiri" name="detailFood"><label for="onigiri">오니기리</label>
			<input type="checkbox" id="omelet" name="detailFood"><label for="omelet">오므라이스</label>
			<input type="checkbox" id="udonSoba" name="detailFood"><label for="udonSoba">우동,소바</label>
			<input type="checkbox" id="japaneseFry" name="detailFood"><label for="japaneseFry">일식튀김,꼬치</label>

		</div>
	</div>
	<div class="detailSearch">
		<div>
			<input type="checkbox" id="sushi" name="detailFood"><label for="sushi" style="margin-left:119px;">초밥,롤</label>		
			<input type="checkbox" id="riceBowl" name="detailFood"><label for="riceBowl">덮밥</label>
		</div>
	</div>			
		
		</c:when>
		<c:when test="${food eq '양식'}">
			
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="steak" name="detailFood"><label for="steak">스테이크,립</label>
			<input type="checkbox" id="pizza" name="detailFood"><label for="pizza">피자</label>
			<input type="checkbox" id="hamburger" name="detailFood"><label for="hamburger">햄버거</label>
			<input type="checkbox" id="hotdog" name="detailFood"><label for="hotdog">핫도그</label>
			<input type="checkbox" id="frenchFry" name="detailFood"><label for="frenchFry">후렌치후라이</label>
			<input type="checkbox" id="sandwich" name="detailFood"><label for="sandwich">샌드위치</label>
			<input type="checkbox" id="brunch" name="detailFood"><label for="brunch">브런치</label>
			<input type="checkbox" id="seafood" name="detailFood"><label for="seafood">해물,생선요리</label>
			<input type="checkbox" id="franceFood" name="detailFood"><label for="franceFood">프랑스음식</label>
		</div>
	</div>
	
	<div class="detailSearch">
		<div>
			<input type="checkbox" id="italyFood" name="detailFood"><label for="italyFood" style="margin-left:119px;">이탈리아음식</label>
			<input type="checkbox" id="usaFood" name="detailFood"><label for="usaFood">미국음식</label>
			<input type="checkbox" id="mexicoFood" name="detailFood"><label for="mexicoFood">멕시코음식</label>
			<input type="checkbox" id="spainFood" name="detailFood"><label for="spainFood">스페인음식</label>
			<input type="checkbox" id="greeceFood" name="detailFood"><label for="greeceFood">그리스음식</label>
			<input type="checkbox" id="turkeyFood" name="detailFood"><label for="turkeyFood">터키음식</label>
			<input type="checkbox" id="germanyFood" name="detailFood"><label for="germanyFood">독일음식</label>
		</div>
	</div>				
			
		</c:when>

		<c:when test="${food eq '뷔페'}">
		
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="koreaBuffet" name="detailFood"><label for="koreaBuffet">한식뷔페</label>
			<input type="checkbox" id="meatBuffet" name="detailFood"><label for="meatBuffet">고기뷔페</label>
			<input type="checkbox" id="seafoodBuffet" name="detailFood"><label for="seafoodBuffet">해산물뷔페</label>
			<input type="checkbox" id="sushiBuffet" name="detailFood"><label for="sushiBuffet">일식,초밥뷔페</label>
			<input type="checkbox" id="saladBuffet" name="detailFood"><label for="saladBuffet">채식,샐러드뷔페</label>
		</div>
	</div>			
		
		</c:when>
		
		<c:when test="${food eq '디저트'}">

	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="cafe" name="detailFood"><label for="cafe">카페</label>
			<input type="checkbox" id="bakery" name="detailFood"><label for="bakery">베이커리</label>
			<input type="checkbox" id="cake" name="detailFood"><label for="cake">케이크전문</label>
			<input type="checkbox" id="donut" name="detailFood"><label for="donut">도넛</label>
			<input type="checkbox" id="waffle" name="detailFood"><label for="waffle">와플</label>
			<input type="checkbox" id="walnut" name="detailFood"><label for="walnut">호두과자</label>
			<input type="checkbox" id="mochi" name="detailFood"><label for="mochi">떡,한과</label>
		</div>
	</div>			
		
		</c:when>
		
		<c:when test="${food eq '술집'}">
		
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="bar"><label for="bar">바</label>
			<input type="checkbox" id="pub"><label for="pub">펍</label>
		</div>
	</div>			
		
		</c:when>		
		<c:when test="${food eq '기타'}">
			<div class="detailSearch">
				<h3>세부 음식 검색</h3>
				<div>
					<input type="checkbox" id="familyRestaurant"><label for="familyRestaurant">패밀리레스토랑</label>
					<input type="checkbox" id="asiaFood"><label for="asiaFood">아시아음식</label>
					<input type="checkbox" id="vietnamFood"><label for="vietnamFood">베트남음식</label>
					<input type="checkbox" id="indiaFood"><label for="indiaFood">인도음식</label>
					<input type="checkbox" id="thaiFood"><label for="thaiFood">태국음식</label>
					<input type="checkbox" id="lunchBox"><label for="lunchBox">도시락,컵밥</label>
					<input type="checkbox" id="chicken"><label for="chicken">치킨,닭강정</label>
				</div>
			</div>	
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	<div class="detailSearch">
		<h3>예산(2인 기준)</h3>
		<div>
			<input type="checkbox" id="money0"><label for="money0">2만원미만</label>
			<input type="checkbox" id="money2"><label for="money2">2-5만원</label>
			<input type="checkbox" id="money5"><label for="money5">5-10만원</label>
			<input type="checkbox" id="money10"><label for="money10">10만원이상</label>
		</div>
	</div>
	<div class="detailSearch">
		<h3 style="margin-right:55px;">부가 정보</h3>
		<div>
			<input type="checkbox" id="parkingAvailable"><label for="parkingAvailable">주차 가능</label>
			<input type="checkbox" id="childAvailable"><label for="childAvailable">아이동반 가능</label>
			<input type="checkbox" id="groupReservation"><label for="groupReservation">단체석 예약 가능</label>
			<input type="checkbox" id="open24"><label for="open24">24시간 영업</label>
		</div>		
	</div>
	<div class="detailSearch">
		<h3>판매 주류 종류</h3>
		<div>
			<input type="checkbox" id="soju"><label for="soju">소주</label>
			<input type="checkbox" id="beer"><label for="beer">맥주</label>
			<input type="checkbox" id="sake"><label for="sake">사케</label>
			<input type="checkbox" id="liquor"><label for="liquor">양주</label>
			<input type="checkbox" id="wine"><label for="wine">와인</label>
			<input type="checkbox" id="cocktail"><label for="cocktail">칵테일</label>
		</div>
	</div>
	</div>
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
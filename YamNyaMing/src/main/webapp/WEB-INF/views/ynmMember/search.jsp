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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css?ver=10">
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
	    		<option selected>지역 선택</option>
	    		<option value="홍대">홍대</option>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js?ver=2"></script>
	<div class="member-search-wrapper">
	<h2>자세히 검색</h2>
	<c:choose>
		<c:when test="${food eq '한식' }">

	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="homeFood" name="storeCateDetailName" onclick="check()" value="백반,가정식"><label for="homeFood">백반,가정식</label>
			<input type="checkbox" id="koreanRestaurant" name="storeCateDetailName" onclick="check()" value="한정식"><label for="koreanRestaurant">한정식</label>
			<input type="checkbox" id="ssambap" name="storeCateDetailName" onclick="check()" value="쌈밥"><label for="ssambap">쌈밥</label>
			<input type="checkbox" id="boribap" name="storeCateDetailName" onclick="check()" value="보리밥"><label for="boribap">보리밥</label>
			<input type="checkbox" id="bibimbap" name="storeCateDetailName" onclick="check()" value="비빔밥"><label for="bibimbap">비빔밥</label>
			<input type="checkbox" id="juk" name="storeCateDetailName" onclick="check()" value="죽"><label for="juk">죽</label>
			<input type="checkbox" id="soupbap" name="storeCateDetailName" onclick="check()" value="국밥"><label for="soupbap">국밥</label>
			<input type="checkbox" id="noodle" name="storeCateDetailName" onclick="check()" value="국수"><label for="noodle">국수</label>
			<input type="checkbox" id="coldNoodle" name="storeCateDetailName" onclick="check()" value="냉면"><label for="coldNoodle">냉면</label>
			<input type="checkbox" id="makguksu" name="storeCateDetailName" onclick="check()" value="막국수"><label for="makguksu">막국수</label>
			<input type="checkbox" id="stew" name="storeCateDetailName" onclick="check()" value="찌개,전골"><label for="stew">찌개,전골</label>
			
		</div>
	</div>
	<div class="detailSearch">
		<div>
			<input type="checkbox" id="chuatang" name="storeCateDetailName" onclick="check()" value="추어탕"><label for="chuatang" style="margin-left:119px;">추어탕</label>
			<input type="checkbox" id="gamjatang" name="storeCateDetailName" onclick="check()" value="감자탕"><label for="gamjatang">감자탕</label>
			<input type="checkbox" id="hazelnut" name="storeCateDetailName" onclick="check()" value="해장국"><label for="hazelnut">해장국</label>
			<input type="checkbox" id="sullungtang" name="storeCateDetailName" onclick="check()" value="곰탕,설렁탕"><label for="sullungtang">곰탕,설렁탕</label>
			<input type="checkbox" id="galbitang" name="storeCateDetailName" onclick="check()" value="갈비탕"><label for="galbitang">갈비탕</label>
			<input type="checkbox" id="steamFood" name="storeCateDetailName" onclick="check()" value="찜요리"><label for="steamFood">찜요리</label>
			<input type="checkbox" id="grillFood" name="storeCateDetailName" onclick="check()" value="구이요리"><label for="grillFood">구이요리</label>			
			<input type="checkbox" id="tofuFood" name="storeCateDetailName" onclick="check()" value="두부요리"><label for="tofuFood">두부요리</label>
			<input type="checkbox" id="stirFry" name="storeCateDetailName" onclick="check()" value="볶음요리"><label for="stirFry">볶음요리</label>
		</div>
	</div>
	<div class="detailSearch">
		<div>
			<input type="checkbox" id="koreanSeafood" name="storeCateDetailName" onclick="check()" value="해산물요리"><label for="koreanSeafood" style="margin-left:119px;">해산물요리</label>			
			<input type="checkbox" id="sashimi" name="storeCateDetailName" onclick="check()" value="칼국수,만두"><label for="sashimi">생선회</label>
			<input type="checkbox" id="kalguksu" name="storeCateDetailName" onclick="check()" value="칼국수,만두"><label for="kalguksu">칼국수,만두</label>
			<input type="checkbox" id="koreanCake" name="storeCateDetailName" onclick="check()" value="전,빈대떡"><label for="koreanCake">전,빈대떡</label>
			<input type="checkbox" id="jokbal" name="storeCateDetailName" onclick="check()" value="족발,보쌈"><label for="jokbal">족발,보쌈</label>
			<input type="checkbox" id="meatFood" name="storeCateDetailName" onclick="check()" value="고기요리"><label for="meatFood">고기요리</label>
			<input type="checkbox" id="snackBar" name="storeCateDetailName" onclick="check()" value="분식"><label for="snackBar">분식</label>
		</div>
	</div>	

		</c:when>
		<c:when test="${food eq '중식'}">

	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="chineseRestaurant" name="storeCateDetailName" onclick="check()" value="중식당"><label for="chineseRestaurant">중식당</label>
			<input type="checkbox" id="skipjack" name="storeCateDetailName" onclick="check()" value="양꼬치"><label for="skipjack">양꼬치</label>
		</div>
	</div>
		
		</c:when>
		<c:when test="${food eq '일식'}">	
		
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="japaneseRestaurant" name="storeCateDetailName" onclick="check()" value="일식당"><label for="japaneseRestaurant">일식당</label>
			<input type="checkbox" id="japaneseRamen" name="storeCateDetailName" onclick="check()" value="일본식라면"><label for="japaneseRamen">일본식라면</label>
			<input type="checkbox" id="porkCutlets" name="storeCateDetailName" onclick="check()" value="돈가스"><label for="porkCutlets">돈가스</label>
			<input type="checkbox" id="shabu" name="storeCateDetailName" onclick="check()" value="샤브샤브"><label for="shabu">샤브샤브</label>
			<input type="checkbox" id="onigiri" name="storeCateDetailName" onclick="check()" value="오니기리"><label for="onigiri">오니기리</label>
			<input type="checkbox" id="omelet" name="storeCateDetailName" onclick="check()" value="오므라이스"><label for="omelet">오므라이스</label>
			<input type="checkbox" id="udonSoba" name="storeCateDetailName" onclick="check()" value="우동,소바"><label for="udonSoba">우동,소바</label>
			<input type="checkbox" id="japaneseFry" name="storeCateDetailName" onclick="check()" value="일식튀김,꼬치"><label for="japaneseFry">일식튀김,꼬치</label>

		</div>
	</div>
	<div class="detailSearch">
		<div>
			<input type="checkbox" id="sushi" name="storeCateDetailName" onclick="check()" value="초밥,롤"><label for="sushi" style="margin-left:119px;">초밥,롤</label>		
			<input type="checkbox" id="riceBowl" name="storeCateDetailName" onclick="check()" value="덮밥"><label for="riceBowl">덮밥</label>
		</div>
	</div>			
		
		</c:when>
		<c:when test="${food eq '양식'}">
			
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="steak" name="storeCateDetailName" onclick="check()" value="스테이크,립"><label for="steak">스테이크,립</label>
			<input type="checkbox" id="pizza" name="storeCateDetailName" onclick="check()" value="피자"><label for="pizza">피자</label>
			<input type="checkbox" id="hamburger" name="storeCateDetailName" onclick="check()" value="햄버거"><label for="hamburger">햄버거</label>
			<input type="checkbox" id="hotdog" name="storeCateDetailName" onclick="check()" value="핫도그"><label for="hotdog">핫도그</label>
			<input type="checkbox" id="frenchFry" name="storeCateDetailName" onclick="check()" value="후렌치후라이"><label for="frenchFry">후렌치후라이</label>
			<input type="checkbox" id="sandwich" name="storeCateDetailName" onclick="check()" value="샌드위치"><label for="sandwich">샌드위치</label>
			<input type="checkbox" id="brunch" name="storeCateDetailName" onclick="check()" value="브런치"><label for="brunch">브런치</label>
			<input type="checkbox" id="seafood" name="storeCateDetailName" onclick="check()" value="해물,생선요리"><label for="seafood">해물,생선요리</label>
			<input type="checkbox" id="franceFood" name="storeCateDetailName" onclick="check()" value="프랑스음식"><label for="franceFood">프랑스음식</label>
		</div>
	</div>
	
	<div class="detailSearch">
		<div>
			<input type="checkbox" id="italyFood" name="storeCateDetailName" onclick="check()" value="이탈리아음식"><label for="italyFood" style="margin-left:119px;">이탈리아음식</label>
			<input type="checkbox" id="usaFood" name="storeCateDetailName" onclick="check()" value="미국음식"><label for="usaFood">미국음식</label>
			<input type="checkbox" id="mexicoFood" name="storeCateDetailName" onclick="check()" value="멕시코음식"><label for="mexicoFood">멕시코음식</label>
			<input type="checkbox" id="spainFood" name="storeCateDetailName" onclick="check()" value="스페인음식"><label for="spainFood">스페인음식</label>
			<input type="checkbox" id="greeceFood" name="storeCateDetailName" onclick="check()" value="그리스음식"><label for="greeceFood">그리스음식</label>
			<input type="checkbox" id="turkeyFood" name="storeCateDetailName" onclick="check()" value="터키음식"><label for="turkeyFood">터키음식</label>
			<input type="checkbox" id="germanyFood" name="storeCateDetailName" onclick="check()" value="독일음식"><label for="germanyFood">독일음식</label>
		</div>
	</div>				
			
		</c:when>

		<c:when test="${food eq '뷔페'}">
		
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="koreaBuffet" name="storeCateDetailName" onclick="check()" value="한식뷔페"><label for="koreaBuffet">한식뷔페</label>
			<input type="checkbox" id="meatBuffet" name="storeCateDetailName" onclick="check()" value="고기뷔페"><label for="meatBuffet">고기뷔페</label>
			<input type="checkbox" id="seafoodBuffet" name="storeCateDetailName" onclick="check()" value="해산물뷔페"><label for="seafoodBuffet">해산물뷔페</label>
			<input type="checkbox" id="sushiBuffet" name="storeCateDetailName" onclick="check()" value="일식,초밥뷔페"><label for="sushiBuffet">일식,초밥뷔페</label>
			<input type="checkbox" id="saladBuffet" name="storeCateDetailName" onclick="check()" value="채식,샐러드뷔페"><label for="saladBuffet">채식,샐러드뷔페</label>
		</div>
	</div>			
		
		</c:when>
		
		<c:when test="${food eq '디저트'}">

	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="cafe" name="storeCateDetailName" onclick="check()" value="카페"><label for="cafe">카페</label>
			<input type="checkbox" id="bakery" name="storeCateDetailName" onclick="check()" value="베이커리"><label for="bakery">베이커리</label>
			<input type="checkbox" id="cake" name="storeCateDetailName" onclick="check()" value="케이크전문"><label for="cake">케이크전문</label>
			<input type="checkbox" id="donut" name="storeCateDetailName" onclick="check()" value="도넛"><label for="donut">도넛</label>
			<input type="checkbox" id="waffle" name="storeCateDetailName" onclick="check()" value="와플"><label for="waffle">와플</label>
			<input type="checkbox" id="walnut" name="storeCateDetailName" onclick="check()" value="호두과자"><label for="walnut">호두과자</label>
			<input type="checkbox" id="mochi" name="storeCateDetailName" onclick="check()" value="떡,한과"><label for="mochi">떡,한과</label>
		</div>
	</div>			
		
		</c:when>
		
		<c:when test="${food eq '술집'}">
		
	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<input type="checkbox" id="bar" name="storeCateDetailName" onclick="check()" value="바"><label for="bar">바</label>
			<input type="checkbox" id="pub" name="storeCateDetailName" onclick="check()" value="펍"><label for="pub">펍</label>
		</div>
	</div>			
		
		</c:when>		
		<c:when test="${food eq '기타'}">
			<div class="detailSearch">
				<h3>세부 음식 검색</h3>
				<div>
					<input type="checkbox" id="familyRestaurant" name="storeCateDetailName" onclick="check()" value="패밀리레스토랑"><label for="familyRestaurant">패밀리레스토랑</label>
					<input type="checkbox" id="asiaFood" name="storeCateDetailName" onclick="check()" value="아시아음식"><label for="asiaFood">아시아음식</label>
					<input type="checkbox" id="vietnamFood" name="storeCateDetailName" onclick="check()" value="베트남음식"><label for="vietnamFood">베트남음식</label>
					<input type="checkbox" id="indiaFood" name="storeCateDetailName" onclick="check()" value="인도음식"><label for="indiaFood">인도음식</label>
					<input type="checkbox" id="thaiFood" name="storeCateDetailName" onclick="check()" value="태국음식"><label for="thaiFood">태국음식</label>
					<input type="checkbox" id="lunchBox" name="storeCateDetailName" onclick="check()" value="도시락,컵밥"><label for="lunchBox">도시락,컵밥</label>
					<input type="checkbox" id="chicken" name="storeCateDetailName" onclick="check()" value="치킨,닭강정"><label for="chicken">치킨,닭강정</label>
				</div>
			</div>	
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	<div class="detailSearch">
		<h3>예산(2인 기준)</h3>
		<div>
			<input type="checkbox" id="money0" name="owBudget" onclick="check()" value="2만원미만"><label for="money0">2만원미만</label>
			<input type="checkbox" id="money2" name="owBudget" onclick="check()" value="2-5만원"><label for="money2">2-5만원</label>
			<input type="checkbox" id="money5" name="owBudget" onclick="check()" value="5-10만원"><label for="money5">5-10만원</label>
			<input type="checkbox" id="money10" name="owBudget" onclick="check()" value="10만원이상"><label for="money10">10만원이상</label>
		</div>
	</div>
	<div class="detailSearch">
		<h3 style="margin-right:55px;">부가 정보</h3>
		<div>
			<input type="checkbox" id="parkingAvailable" name="owSubInfo" onclick="check()" value="주차 가능"><label for="parkingAvailable">주차 가능</label>
			<input type="checkbox" id="childAvailable" name="owSubInfo" onclick="check()" value="아이동반 가능"><label for="childAvailable">아이동반 가능</label>
			<input type="checkbox" id="groupReservation" name="owSubInfo" onclick="check()" value="단체석 예약 가능"><label for="groupReservation">단체석 예약 가능</label>
			<input type="checkbox" id="open24" name="owSubInfo" onclick="check()" value="24시간 영업"><label for="open24">24시간 영업</label>
		</div>		
	</div>
	<div class="detailSearch">
		<h3>판매 주류 종류</h3>
		<div>
			<input type="checkbox" id="soju" name="owDrinkListInfo" onclick="check()" value="소주"><label for="soju">소주</label>
			<input type="checkbox" id="beer" name="owDrinkListInfo" onclick="check()" value="맥주"><label for="beer">맥주</label>
			<input type="checkbox" id="sake" name="owDrinkListInfo" onclick="check()" value="사케"><label for="sake">사케</label>
			<input type="checkbox" id="liquor" name="owDrinkListInfo" onclick="check()" value="양주"><label for="liquor">양주</label>
			<input type="checkbox" id="wine" name="owDrinkListInfo" onclick="check()" value="와인"><label for="wine">와인</label>
			<input type="checkbox" id="cocktail" name="owDrinkListInfo" onclick="check()" value="칵테일"><label for="cocktail">칵테일</label>
		</div>
	</div>
	<h4>총 <span>0</span>개가 검색되었습니다</h4>
	<p><span>대기순</span> | <span>추천순</span></p>
	<div class="search-page">
		<c:forEach items="${search}" var="search">
			<div style="background-image:url(${pageContext.request.contextPath}/resources/${search.owPhotoRoute}); position:relative;">
				<div style="background-color:rgba(0,0,0,0.5);position:relative;bottom:0;">
					<h5>${search.owStoreNum }</h5>
					<p>서울 > 마포구</p>
					<p>보쌈,족발</p>
					<p>대기시간 : 0분 남았습니다</p>
				</div>
			</div>
		</c:forEach>
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
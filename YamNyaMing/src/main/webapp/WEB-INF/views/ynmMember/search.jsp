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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/search.css?ver=7">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=506d35ab67392611ab5c3ecf1938286e&libraries=services"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberSearch.js?ver=1"></script>
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
	<div class="member-search-wrapper">
		<h2>자세히 검색</h2>
		<form action="/search.do" method="get">
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
			</c:choose>
		</form>
	</div>
	<!-- Trigger/Open The Modal -->
	<button id="reservation">예약하기</button>
	<!-- The Modal -->
	<div id="reservationModal" class="modal">
	  <!-- Modal content -->
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <p>Some text in the Modal..</p>
	  </div>
	</div>
	<script>
	// Get the modal
	var modal = document.getElementById('reservationModal');
	
	// Get the button that opens the modal
	var btn = document.getElementById("reservation");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}
	</script>
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
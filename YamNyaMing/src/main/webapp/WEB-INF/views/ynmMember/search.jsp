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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberDetail.js?ver=1"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=506d35ab67392611ab5c3ecf1938286e&libraries=services"></script>
</head>
<body>
<header id="member-search-header">
	<h1><a href="/index.jsp">YamNyaMing</a></h1>
    <form action="/search.do" method="get">
    	<select name="place" id="place">
    		<option disabled>지역 선택</option>
	    	<option value="홍대" selected>홍대</option>
    	</select>
    	<select name="food" id="food">
    	<c:choose>
    		<c:when test="${food eq '한식'}">
	     		<option disabled>음식 종류 선택</option>
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
	     		<option disabled>음식 종류 선택</option>
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
	     		<option disabled>음식 종류 선택</option>
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
	     		<option disabled>음식 종류 선택</option>
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
	     		<option disabled>음식 종류 선택</option>
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
	     		<option disabled>음식 종류 선택</option>
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
	     		<option disabled>음식 종류 선택</option>
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
	     		<option disabled>음식 종류 선택</option>
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
	     		<option selected disabled>음식 종류 선택</option>
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
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new daum.maps.LatLng(37.556888697557625, 126.92367442251489), // 지도의 중심좌표
	    level: 6 // 지도의 확대 레벨
	}; 
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	var x = new Array();
	var y = new Array();
	setPoint();
	function setPoint()
	{		
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		//title = ${resultMap}[0].owStoreName;
		var title = new Array();
		var name = "";
		for (var i = 0; i < Object.keys( ${resultMap}).length; i++) {
			title[i] = ${resultMap}[i].owStoreName;
			name = title[i];
			console.log(name);
			geocoder.addressSearch(${resultMap}[i].owStoreAddr, function(result,status){
				if(status === daum.maps.services.Status.OK){				
					x[i] = result[0].x;
					y[i] = result[0].y;
					// 마커 이미지의 이미지 크기 입니다
				    var imageSize = new daum.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
					console.log(title[i]);
				    // 마커를 생성합니다
				    var marker = new daum.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: new daum.maps.LatLng(y[i],x[i]), // 마커를 표시할 위치
				        title :  name , // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				}
			});
		}
	}
	loadMap();
	
	function loadMap(){
		// 마커를 표시할 위치와 title 객체 배열입니다 
		/* var positions =
		[
			for(var i=0; i<Object.keys(${resultMap}).length;i++)
			{
				{
					title:  ${resultMap}[i].owStoreName ,
					latlng:new daum.maps.LatLng(y[i],x[i])
				},
			}
		]; */
		
	/*  var positions = [		
		    {
		        title: '빠넬로', 
		        latlng: new daum.maps.LatLng(y,x)
		    },
		    {
		        title: '몽고네', 
		        latlng: new daum.maps.LatLng(y2,x2)
		    },
		    {
		        title: '텃밭', 
		        latlng: new daum.maps.LatLng(33.450879, 126.569940)
		    },
		    {
		        title: '근린공원',
		        latlng: new daum.maps.LatLng(33.451393, 126.570738)
		    }
		]; */
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
	/* 	//for (var i = 0; i < positions.length; i ++) {
		for(var i=0; i<Object.keys(${resultMap}).length;i++){    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new daum.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    console.log(${resultMap}[i].owStoreName);
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: new daum.maps.LatLng(33.451393, 126.570738), //new daum.maps.LatLng(y[i],x[i]), // 마커를 표시할 위치
		        title :  "'" + ${resultMap}[i].owStoreName +"'" , // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
		 */
	}
	</script>
	
	
	<div class="member-search-wrapper">
	<h2>자세히 검색</h2>
	<c:forEach items="${search.storeCateDetailName}" var="s">
		${s}
	</c:forEach>
	<form action="/search.do" method="get">
	<c:choose>
		<c:when test="${food eq '한식' }">
		<input type="hidden" name="food" value="한식">

	<div class="detailSearch">
		<h3>세부 음식 검색</h3>
		<div>
			<c:choose>
				<c:when test="${storeCateDetailName eq '백반가정식'}">
					<input type="checkbox" id="homeFood" name="storeCateDetailName" value="백반가정식" checked><label for="homeFood">백반,가정식</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" id="homeFood" name="storeCateDetailName" value="백반가정식"><label for="homeFood">백반,가정식</label>
				</c:otherwise>
			</c:choose>
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
	<input type="submit" value="상세정보 검색하기">
	</form>
	<h4>총 <span>${search.recordTotalCount }</span>개가 검색되었습니다</h4>
	<p><span>대기순</span> | <span>추천순</span> | <span>별점순</span></p>
	<div class="search-page">
		<c:forEach items="${search.noticelist}" var="search">
			<div class="search-result">
				<div class="search-result-img" style="background-image:url('${pageContext.request.contextPath}/${search.owPhotoRoute}');">
					<form action="/detailPage.do" method="get">
						<input type="hidden" name="owStoreInfoPk" value="${search.owStoreInfoPk}">
						<input type="submit" value="">
					</form>
							<div>
								<p>대기인원 0 추천${search.favoriteTotal}</p>
								<c:if test="${search.favoriteChk==1}">
									<div class="heart" id="${search.owStoreInfoPk}"
										onclick="favorite('${sessionScope.member.memberEntireNo}','${search.owStoreInfoPk}');">
										<img style="width: 100%; height: 100%; cursor: pointer;"
											src='${pageContext.request.contextPath}/resources/image/member/search/heart-click.png'>
									</div>
								</c:if>
								<c:if test="${search.favoriteChk!=1}">
									<div class="heart" id="${search.owStoreInfoPk}"
										onclick="favorite('${sessionScope.member.memberEntireNo}','${search.owStoreInfoPk}');">
										<img style="width: 100%; height: 100%; cursor: pointer;"
											src='${pageContext.request.contextPath}/resources/image/member/search/heart.png'>
									</div>
								</c:if>
							</div>
							<div>
						<h5>${search.owStoreName }</h5>
						<p>${search.owStoreAddrFirst} > ${search.owStoreAddrFinal} ㆍ ${search.storeCateDetailName}</p>		
					</div>
				</div>
				<div class="search-result-text">
					<div>
							<c:choose>
								<c:when test="${search.starAvg>=1}"><span class="star-full"></span></c:when>
								<c:otherwise><span class="star"></span></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${search.starAvg>=2}"><span class="star-full"></span></c:when>
								<c:otherwise><span class="star"></span></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${search.starAvg>=3}"><span class="star-full"></span></c:when>
								<c:otherwise><span class="star"></span></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${search.starAvg>=4}"><span class="star-full"></span></c:when>
								<c:otherwise><span class="star"></span></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${search.starAvg>=5}"><span class="star-full"></span></c:when>
								<c:otherwise><span class="star"></span></c:otherwise>
							</c:choose>
						<p class="star-result">${search.starAvg}</p>
					</div>
					<div>${search.owStoreComment}</div>
				</div>
				<script>
				 function popupPost(value){
	               var reserve = document.reserve;
	               var pop = window.open;
				   var windowW = 560;
				   var windowH = 560;
				   var left = Math.ceil((window.screen.width - windowW) / 2);
				   var top = Math.ceil((window.screen.height - windowH) / 2);
	               pop("/reservation.do?owStoreInfoPk="+value,"popup","top=" + top + ", left=" + left + ", height=" + windowH + ", width=" + windowW + ", toolbar='no'");
	               reserve.target="popup";
	               reserve.method="get";
	               reserve.submit();
	            }
	            </script>  	            
	                
	            <!-- form action="reservation.do" method="get" name="reserve">
	               <input type="button" onclick="popupPost(${search.owStoreInfoPk})" value="예약하기">
	            </form> -->
	            <button id="myBtn" onclick="modalPopup('${search.owStoreName}','${search.owStoreAddrFirst}');">예약하기</button>
				<button>리뷰쓰기</button>
			</div>
		</c:forEach>
		<div class="content-title"></div>
		<c:if test="${search.currentPage>1}" var="search">
			<button onclick="searchPaging()"> < </button>
		</c:if>
<%-- <%-- 		<c:forEach items="${search}" var="search" begin="${search.startNavi}" end="${search.endNavi}" step=1>
			<c:if test="${search.currentPage eq search.startNavi}">
				<button onclick="searchPaging()">${search.startNavi}</button>
			</c:if>
		</c:forEach> --%>
<%-- 		<c:if test="${search.currentPage < search.pageTotalCount}">
			<button onclick="searchPaging()"> > </button>
		</c:if> --%>
	</div>
	</div>
	
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p id="modalValue"></p>
  </div>

</div>	
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
</style>
<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
function modalPopup(storeIndex,storeAddr) {
    modal.style.display = "block";
    $('#modalValue').html(storeIndex + storeAddr);
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
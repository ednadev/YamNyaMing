
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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/detail.css?ver=8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/lightslider.css" />                  
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/member/lightslider.js"></script>
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
<section id="member-detail-section">
	<div id="main" style="background-image:url(${pageContext.request.contextPath}/resources/${store.owStoreHeadPhoto});"></div>
	<div>
		<div class="member-detail-wrapper">
			<h3>${store.owStoreName}</h3>
			<p>${store.owStoreAddrFirst} > ${store.owStoreAddrFinal} ㆍ ${store.storeCateDetailName}</p>
			<p>대기인원 0 추천 0</p>
			<div class="heart"></div>
			<p>추천</p>
			<hr>
			<div class="main-detail">
				<table>
					<tbody>
					<tr>
						<th>별점</th>
						<td>
							<span class="star"></span>
							<span class="star"></span>
							<span class="star"></span>
							<span class="star"></span>
							<span class="star"></span>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${store.owStoreTel}</td>
					</tr>	
					<tr>
						<th>웹사이트</th>
						<td>${store.owStoreUrl}</td>
					</tr>	
					<tr>
						<th>주소</th>
						<td>${store.owStoreAddr}</td>
					</tr>	
					<tr>
						<th>영업시간</th>
						<td>${store.owStoreWorkingTime}</td>
					</tr>
					<tr>
						<th>예산 (2인 기준)</th>
						<td>${store.owBudget}</td>
					</tr>	
					<tr>
						<td colspan="2"><button>예약하기</button></td>
					</tr>																													
					</tbody>
				</table>
				<button onclick="plusDivs(-1)">&lt;</button>
				<div>
				<c:forEach items="${storeImg}" var="storeImg">
					<img class="mySlides" src="${pageContext.request.contextPath}/resources/${storeImg.owPhotoRoute}">
				</c:forEach>
				</div>
				<button onclick="plusDivs(1)">&gt;</button>
				<script>
					var slideIndex = 1;
					showDivs(slideIndex);
					function plusDivs(n){
						showDivs(slideIndex += n);
					}
					function showDivs(n){
						var i;
						var x = document.getElementsByClassName("mySlides");
						if(n>x.length){slideIndex = 1}
						if(n<1){slideIndex = x.length}
						for(i=0;i<x.length;i++){
							x[i].style.display = "none";
						}
						x[slideIndex-1].style.display = "block";
					}
				</script>
			</div>
		</div>
	</div>
	<div class="member-detail-page-wrapper">
		<div class="tab">
			<button class="tablink click" onclick="openTab(event,'Info')">정보</button>
		    <button class="tablink" onclick="openTab(event,'Photo')">포토</button>
		    <button class="tablink" onclick="openTab(event,'Review')">리뷰</button>
		    <button class="tablink" onclick="openTab(event,'Menu')">메뉴</button>
		    <button class="tablink" onclick="openTab(event,'Map')">지도</button>
		</div>
		<div id="Info" class="tabInfo">
			<div>
				<h4>한줄 설명</h4>
				<p>${store.owStoreComment}</p>
			</div>
			<div>
				<h4>음식 종류</h4>
				<p>${store.storeCateMainName} / ${store.storeCateDetailName}</p>
			</div>
			<div>
				<h4>예산 (2인 기준)</h4>
				<p>${store.owBudget}</p>
			</div>
			<div>
				<h4>테이블</h4>
				<p>${store.owStoreTableInfo}</p>
			</div>
			<div>
				<h4>부가 정보</h4>
				<p>${store.owSubInfo}</p>
			</div>
			<div>
				<h4>판매 주류</h4>
				<p>${store.owDrinkListInfo}</p>
			</div>
			<div>
				<h4>최근 예약 히스토리</h4>
				<p>9612님이 2018.7.30 오후 12:30, 1명 예약하셨습니다.</p>
			</div>
			<div>
				<a href="#">정보를 수정해주세요</a>
			</div>								
		</div>
		<div id="Photo" class="tabInfo" style="display:none;">	

			<div class="container">
				<a class="prev" onclick="plusSlides(-1)">❮</a>
			<c:forEach items="${storeImg}" var="storeImg">
				<div class="mySlidesPhoto">
				<img src="${pageContext.request.contextPath}/resources/${storeImg.owPhotoRoute}">
				</div>
			</c:forEach>				
			  <a class="next" onclick="plusSlides(1)">❯</a>
			
			  <div class="row">
			  <c:forEach items="${storeImg}" var="storeImg" begin="0" varStatus="status" end="${size}">
			    <div class="column">
			      <img class="demo cursor" src="${pageContext.request.contextPath}/resources/${storeImg.owPhotoRoute}" onclick="currentSlide(${status.index+1})">
			    </div>
			  </c:forEach>
			  </div>
			</div>

		<script>
			var slideIndex = 1;
			showSlides(slideIndex);
			
			function plusSlides(n) {
			  showSlides(slideIndex += n);
			}
			
			function currentSlide(n) {
			  showSlides(slideIndex = n);
			}
			
			function showSlides(n) {
			  var i;
			  var slides = document.getElementsByClassName("mySlidesPhoto");
			  var dots = document.getElementsByClassName("demo");
			  var captionText = document.getElementById("caption");
			  if (n > slides.length) {slideIndex = 1}
			  if (n < 1) {slideIndex = slides.length}
			  for (i = 0; i < slides.length; i++) {
			      slides[i].style.display = "none";
			  }
			  for (i = 0; i < dots.length; i++) {
			      dots[i].className = dots[i].className.replace(" active", "");
			  }
			  slides[slideIndex-1].style.display = "flex";
			  dots[slideIndex-1].className += " active";
			  captionText.innerHTML = dots[slideIndex-1].alt;
			}
		</script>
		</div>
		<div id="Review" class="tabInfo" style="display:none;">
			<h4>리뷰 쓰기</h4>
			<table>
			<tbody>
			<tr>
				<th>별점</th>
				<td>
					<span class="star-yellow"></span>
					<span class="star-yellow"></span>
					<span class="star-yellow"></span>
					<span class="star-yellow"></span>
					<span class="star-yellow"></span>
				</td>
			</tr>
			<tr>
				<th>리뷰</th>
				<td><textarea placeholder="매장에 대한 리뷰를 30자 이상 작성해주세요.&#13;&#10;매장과 관계없는 글, 광고성, 욕성, 비방, 도배 등의 글은 예고 없이 삭제됩니다."></textarea></td>
			</tr>
			<tr>
				<th>사진 등록</th>
				<td>
					<input type="file" id="photoEnroll"><label for="photoEnroll">사진 등록하기</label>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<div style="display:none;"></div>
				</td>
			</tr>
			</tbody>
			</table>
			<button>리뷰 올리기</button>
			<h4>리뷰</h4>
			<p><span>최신순</span> | <span>인기순</span></p>
			<div>
				<div>
					<div id="profile-image"></div>
					<div>
						<p>Jihae</p>
						<p>4 리뷰, 4 팔로워</p>				
					</div>
				 	<button>팔로우</button>				
				</div>
				<div>
					<p>
						<span class="star-yellow"></span>
						<span class="star-yellow"></span>
						<span class="star-yellow"></span>
						<span class="star-yellow"></span>
						<span class="star-yellow"></span>
						4.5 / 오랫동안 기억에 남을 만한 곳이에요.
					</p>
					<p>티본을 메인으로 다양한 단품을 먹어봤습니다. 육즙 폭팔한 티본, 생면 파스타와 피자 등 모두 맛있게 먹었습니다. 
					자극적이지 않아 더 좋았고 친절한 서비스도 감동~~^^ 멀리까지 찾아간 보람이 있었어요.</p>
					<div>
						<div></div>
					</div>
					<p>정범진님, 김수한님 외 18명이 좋아합니다.</p>
					<p><button><div></div><p>좋아요 20</p></button><button><div></div><p>찜하기 0</p></button><button><div></div><p>댓글 0</p></button><button><div></div><p>공유</p></button></p>
  				</div>
  				<div>
  					<div></div>
  					<input type="text" placeholder="댓글을 입력해주세요">
  				</div>
			</div>
		</div>
		<div id="Menu" class="tabInfo" style="display:none;">
			메뉴
		</div>
		<div id="Map" class="tabInfo" style="display:none;">
			지도
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberDetail.js?ver=1"></script>
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
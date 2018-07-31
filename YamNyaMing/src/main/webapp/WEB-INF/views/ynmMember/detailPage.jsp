
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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/detail.css?ver=1">             
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

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
			<input type="hidden" value="review" name="detailMenu" id="storeInfoType">
			<input type="hidden" name="owStoreInfoPk" value="${store.owStoreInfoPk}"> 
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
        	var locked=0;
		function show(star){
			if(locked)
				return;
			var image;
			var el;
			var e=document.getElementById('startext');
			var stateMsg;
			
			for(var i=0; i<star; i++){
				image='image' +i;
				var image2=document.getElementById(image);
		        image2.src="${pageContext.request.contextPath}/resources/image/member/search/star-full.png";
			}
			switch(star){
			case 1:
				stateMsg="실망이에요. 집에서 먹는게 나을 뻔 했어요.";
				break;
			case 2:
				stateMsg="평균이하! 이정도 레스토랑은 어디에나 있죠.";
				break;
			case 3:
				stateMsg="보통이에요. 이정도면 괜찮네요.";
				break;
			case 4:
				stateMsg="인상적이네요.꼭 추천하고 싶어요.";
				break;
			case 5:
				stateMsg="완벽 그 자체!! 환상적이에요.";
				break;
			default:
				stateMsg="";
			}
			e.innerHTML=stateMsg;
			
		} 
		function noshow(star){
			if(locked)
				return;
			var image;
			var el;
			for(var i=0; i<star; i++);{
				image='image'+i;
				el=document.getElementById(image);
				el.src="${pageContext.request.contextPath}/resources/image/member/search/star.png";
			}
		}
		var chk=false;
		function lock(star){
			if(chk=false){
			show(star);
			locked=1;
			chk=true;
			}else{
			locked=0;
			}
		}
		function starPoint(star){
			lock(star);
			document.reviewform.reviewStar.value=star;
		} 

      </script>
		</div>
		<div id="Review" class="tabInfo" style="display:none;">
			<form action="/storeReviewInsert.do" enctype="multipart/form-data" method="post" name="reviewform">
			<h4>리뷰 쓰기</h4>
			<input type="hidden" name="ownerStoreEntireNo" value="${store.owStoreInfoPk}"/>
			<table>
			<tbody>
			<tr>
				<th>별점</th>
				<td>
					<img id="image0" style="width:20px; height:20px;" onmouseout="noshow(1);" onmouseover="show(1);" onclick="starPoint(1);" src="${pageContext.request.contextPath}/resources/image/member/search/star.png">
					<img id="image1" style="width:20px; height:20px;" onmouseout="noshow(2);" onmouseover="show(2);" onclick="starPoint(2);" src="${pageContext.request.contextPath}/resources/image/member/search/star.png">
					<img id="image2" style="width:20px; height:20px;" onmouseout="noshow(3);" onmouseover="show(3);" onclick="starPoint(3);" src="${pageContext.request.contextPath}/resources/image/member/search/star.png">
					<img id="image3" style="width:20px; height:20px;" onmouseout="noshow(4);" onmouseover="show(4);" onclick="starPoint(4);" src="${pageContext.request.contextPath}/resources/image/member/search/star.png">
					<img id="image4" style="width:20px; height:20px;" onmouseout="noshow(5);" onmouseover="show(5);" onclick="starPoint(5);" src="${pageContext.request.contextPath}/resources/image/member/search/star.png">
					<span id="startext">평가평가</span>
					<input type="hidden" name="reviewStar">
				</td>
			</tr>
			<tr>
				<th>리뷰</th>
				<td><textarea id="reviewContent" name="reviewContent" placeholder="매장에 대한 리뷰를 30자 이상 작성해주세요.&#13;&#10;매장과 관계없는 글, 광고성, 욕성, 비방, 도배 등의 글은 예고 없이 삭제됩니다."></textarea></td>
			</tr>
			<tr>
				<th>사진 등록</th>
				<td>
					<input type="file" id="input_reviewPhoto" name="reviewImgList" multiple/>
					<label for="input_reviewPhoto" onclick="reviewFilesUpload();">사진 등록하기</label>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<div class="imgs_wrap" style="display:block;width:100%;">
							

						
					</div>
				</td>
			</tr>
			</tbody>
			</table>
			<button>리뷰 올리기</button>
			</form>
			
			<h4>리뷰</h4>
			<p><span>최신순</span> | <span>인기순</span></p>
				<c:forEach items="${review}" var="r">
			<div>
				<div>
					<div id="profile-image">
						<c:if test="${r.memberUploadPhotoNo ne 1}">	
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src='${pageContext.request.contextPath}/resources/image/member/${r.photoViewRoute}'>
						</c:if>
					</div>
					<div>
						<p>${r.memberNickName}</p>
						<p>4 리뷰, 4팔로워</p>				
					</div>
				 	<button name="${r.memberEntireNo}" onclick="follow('${r.memberEntireNo }','${sessionScope.member.memberEntireNo}','${r.memberEntireNo}');">팔로우</button>				
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
					<p><button onclick="like('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}','${r}');"><div></div><p>좋아요</p><p id="${r}">${r.likeTotal}</p></button>
					<button onclick="jjim('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}','${r}${r}');"><div></div><p>찜하기</p><p id="${r}${r}">${r.jjimTotal}</p></button>
					<button><div></div><p>댓글 0</p></button>
					<button><div></div><p>공유</p></button></p>
  				</div>
  				<div>
  					<div></div>
  					<input type="text" placeholder="댓글을 입력해주세요">
  				</div>
			</div>
			</c:forEach>
		</div>
		<div id="Menu" class="tabInfo" style="display:none;">
			메뉴
		</div>
		<div id="Map" class="tabInfo" style="display:none;">
			지도
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberDetail.js?ver=3"></script>
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
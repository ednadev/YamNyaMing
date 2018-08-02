
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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/detail.css?ver=3">             
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=506d35ab67392611ab5c3ecf1938286e&libraries=services"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberDetail.js?ver=4"></script>
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
			<p>대기인원 0 추천 ${store.favoriteTotal}</p>
			<c:if test="${favoriteChk==1}">
			<div class="heart" id="${store.owStoreInfoPk}" onclick="favorite('${sessionScope.member.memberEntireNo}','${store.owStoreInfoPk}');">
				<img style=width:100%;height:100%; src='${pageContext.request.contextPath}/resources/image/member/search/heart-click.png'>
			</div>
			</c:if>
			<c:if test="${favoriteChk!=1}">
			<div class="heart" id="${store.owStoreInfoPk}" onclick="favorite('${sessionScope.member.memberEntireNo}','${store.owStoreInfoPk}');">
				<img style=width:100%;height:100%; src='${pageContext.request.contextPath}/resources/image/member/search/heart.png'>
			</div>
			</c:if>
			
			<p>추천</p>
			<hr>
			<div class="main-detail">
				<table>
					<tbody>
					<tr>
						<th>별점</th>
						<td>
							<c:choose>
								<c:when test="${starAvg>=1}"><span class="star-full"></span></c:when>
								<c:otherwise><span class="star"></span></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${starAvg>=2}"><span class="star-full"></span></c:when>
								<c:otherwise><span class="star"></span></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${starAvg>=3}"><span class="star-full"></span></c:when>
								<c:otherwise><span class="star"></span></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${starAvg>=4}"><span class="star-full"></span></c:when>
								<c:otherwise><span class="star"></span></c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${starAvg>=5}"><span class="star-full"></span></c:when>
								<c:otherwise><span class="star"></span></c:otherwise>
							</c:choose>
							/${starAvg}
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

			  <a class="row-prev" onclick="plusSlidesPhoto(-1)">❮</a>
			  <div class="row">		  
			  <c:forEach items="${storeImg}" var="storeImg" begin="0" varStatus="status" end="${size}">
			    <div class="column">
			      <img class="demo cursor" src="${pageContext.request.contextPath}/resources/${storeImg.owPhotoRoute}" onclick="currentSlide(${status.index+1})">
			    </div>
			  </c:forEach>
			  </div>
			  <a class="row-next" onclick="plusSlidesPhoto(1)">❯</a>
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
		
		 function likeTotalMemberInfo(value,total){
			 console.log(total);
             var reserve = document.reserve;
             var pop = window.open;
			   var windowW = 300;
			   var windowH = 420;
			   var left = Math.ceil((window.screen.width - windowW) / 2);
			   var top = Math.ceil((window.screen.height - windowH) / 2);
             pop("/likeTotalMemberInfo.do?storeReviewNo="+value,"popup","top=" + top + ", left=" + left + ", height=" + windowH + ", width=" + windowW + ", toolbar='no'");
             reserve.target="popup";
             reserve.method="get";
          }

      </script>
		</div>
		<div id="Review" class="tabInfo" style="display:none;">
			<form action="/storeReviewInsert.do" enctype="multipart/form-data" method="post" name="reviewform">
			<h4>리뷰 쓰기</h4>
			<input type="hidden" name="owStoreInfoPk" value="${store.owStoreInfoPk}"/>
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
						<c:if test="${r.memberUploadPhotoNo eq 1}">
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src='${pageContext.request.contextPath}/resources/image/member/profile.png'>
						</c:if>
						<c:if test="${r.memberUploadPhotoNo ne 1}">	
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src='${pageContext.request.contextPath}/resources/image/member/${r.photoViewRoute}'>
						</c:if>
					</div>
					<div>
						<p>${r.memberNickName}</p>
						<p>리뷰${r.reviewTotal},팔로워<label id="${r.memberEntireNo + 1}" name="${r.memberEntireNo + 1}" style="color:black;">${r.followTotal}</label></p>				
					</div>
					<c:if test="${follow!=null }">
						<c:forEach items="${follow}" var="f">
						<c:choose>
							<c:when test="${f.followMemberIdNo==r.memberEntireNo}">
							<button name="${r.memberEntireNo}" style="background-color:#fb0; color:white;" onclick="follow('${r.memberEntireNo }','${sessionScope.member.memberEntireNo}','${r.memberEntireNo}','${r.memberEntireNo + 1}');">팔로우</button>
							</c:when>
							<c:otherwise>
							<button name="${r.memberEntireNo}" onclick="follow('${r.memberEntireNo }','${sessionScope.member.memberEntireNo}','${r.memberEntireNo}','${r.memberEntireNo + 1}');">팔로우</button>
							</c:otherwise>
						</c:choose>	
						</c:forEach>
					</c:if>
					
				
					<c:if test="${follow==null && sessionScope.member!=null}">
				 		<button name="${r.memberEntireNo}" onclick="follow('${r.memberEntireNo }','${sessionScope.member.memberEntireNo}','${r.memberEntireNo}','${r.memberEntireNo + 1}');">팔로우</button>				
					</c:if>
					
					<c:if test="${sessionScope.member.memberEntireNo==null}">
					<button onclick="nomember();">팔로우</button>
					</c:if>
					
				</div>
				<div>
					<p>
						<c:forEach var="i" begin="1" end="${r.reviewStar}" step="1">
						<span class="star-full"></span>
						</c:forEach>
						<c:forEach var="i" begin="1" end="${5- r.reviewStar}" step="1">
						<span class="star-yellow2"></span>
						</c:forEach>
						
						${r.reviewStar} / 
						<c:choose>
							<c:when test="${r.reviewStar ==1}">
								실망이에요. 집에서 먹는게 나을 뻔 했어요.
							</c:when>
							<c:when test="${r.reviewStar ==2}">
								평균이하! 이정도 레스토랑은 어디에나 있죠.
							</c:when>
							<c:when test="${r.reviewStar ==3}">
								보통이에요. 이정도면 괜찮네요.
							</c:when>
							<c:when test="${r.reviewStar ==4}">
								인상적이네요.꼭 추천하고 싶어요.
							</c:when>
							<c:when test="${r.reviewStar ==5}">
								완벽 그 자체!! 환상적이에요.
							</c:when>
						</c:choose>
					</p>
					<p>${r.reviewContent}</p>
					<div>
					<c:forEach items="${r.photoObjList}" var="photo">
						<div>
	
							<img id="img" style="width:100%; height:100%;" name=img src='${pageContext.request.contextPath}/resources/image/member/${photo.photoViewRoute}'>
						</div>
						</c:forEach>
					</div>
					
					
					
					<p onclick="likeTotalMemberInfo('${r.storeReviewNo}','${r.likeTotal}');" style="cursor:pointer;">
					<c:if test="${r.memberLikeInfo!=null}">
						<c:forEach items='${r.memberLikeInfo}' var="li" >
						<label>${li.memberName}</label>
						</c:forEach>
						<c:if test="${r.likeTotal >3}">
						님 외 ${r.likeTotal - 2}명이 좋아합니다.
						</c:if>
						<c:if test="${r.likeTotal <= 2}">
						님이 좋아합니다.
						</c:if>
						
					</c:if>
					
					<c:if test="${r.memberLikeInfo==null}">
						<label>0</label>명이 좋아합니다.
					</c:if>
					</p>
					<p>
				<%-- 		
						<c:if test="${sessionScope.member.memberEntireNo eq r.memberEntireNo }">
								<button onclick="sameMember();">
				 				<div></div>
				 				<p>좋아요</p>
				 				<p id="${r}">${r.likeTotal}</p>
				 				</button>
						</c:if>	 
						 && sessionScope.member.memberEntireNo != r.memberEntireNo 
						--%>	
					<c:if test="${sessionScope.member!=null}">

							
				 			<c:if test="${r.myLikeChk==0}">
				 				<button name="${r}" onmouseover="likeover(${r});" onclick="like('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}','${r}');">
				 				<div name="${r}"></div>
				 				<p name="${r}">좋아요</p>
				 				<p name="${r}" id="${r}">${r.likeTotal}</p>
				 				</button>
				 			</c:if>
				 			<c:if test="${r.myLikeChk==1}">
				 				<button name="${r}" style="background-color:#fb0;" onclick="like('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}','${r}');">
					 				<div name="${r}"><img style="width:100%; height:100%;" src='${pageContext.request.contextPath}/resources/image/member/search/like-white.png'></div>
					 				<p name="${r}" style="color:white;">좋아요</p>
					 				<p name="${r}" id="${r}" style="color:white;">${r.likeTotal}</p>
				 				</button>
				 			</c:if>
				 						
					</c:if>
					
					<c:if test="${sessionScope.member==null}">
				 		<button onclick="nomember();"><div></div><p>좋아요</p><p id="${r}">${r.likeTotal}</p></button>				
					</c:if>
					
	<%-- 					<c:if test="${sessionScope.member.memberEntireNo eq r.memberEntireNo }">
								<button onclick="sameMember();">
				 				<div></div>
				 				<p>찜하기</p>
				 				<p id="${r}">${r.likeTotal}</p>
				 				</button>
						</c:if>		
					 --%>
					
							<c:if test="${sessionScope.member!=null}">
				 			<c:if test="${r.myJjimChk==0}">
				 				<button name="${r}" onclick="jjim('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}','${r}${r}','${r}');">
								<div name="${r}"></div>
								<p name="${r}">찜하기</p>
								<p name="${r}" id="${r}${r}">${r.jjimTotal}</p>
								</button>
				 			</c:if>
				 			<c:if test="${r.myJjimChk==1}">
				 				<button name="${r}" style="background-color:#fb0;" onclick="jjim('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}','${r}${r}','${r}');">
					 				<div name="${r}"><img style="width:100%; height:100%;" src='${pageContext.request.contextPath}/resources/image/member/search/heart.png'></div>
					 				<p name="${r}" style="color:white;">찜하기</p>
					 				<p name="${r}" id="${r}${r}" style="color:white;">${r.jjimTotal}</p>
				 				</button>
				 			</c:if>
				 						
					</c:if>
					
					<c:if test="${sessionScope.member==null}">
				 	<button onclick="nomember();"><div></div>
					<p>찜하기</p>
					<p id="${r}${r}">${r.jjimTotal}</p>
					</button>				
					</c:if>

  				</div>
  				<div>
  					<div>
  						<c:if test="${sessionScope.member==null }">
  							<img style="width:100%; height:100%; border-radius:50%;" src='${pageContext.request.contextPath}/resources/image/member/profile.png'>
  						</c:if>
  						<c:if test="${sessionScope.member!=null && sessionScope.member.memberUploadPhotoNo==1}">
  							<img style="width:100%; height:100%; border-radius:50%;" src='${pageContext.request.contextPath}/resources/image/member/profile.png'>
  						</c:if>
  						<c:if test="${sessionScope.member!=null && sessionScope.member.memberUploadPhotoNo!=1}">
  							<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src='${pageContext.request.contextPath}/resources/image/member/${r.photoViewRoute}'>
  						</c:if>
  						
  					</div>
  					
  					<form action="/storeUnderReviewInsert.do">
  					<input type="hidden" name="storeReviewNo" value="${r.storeReviewNo}">
					<input type="hidden" name="memberEntireNo" value="${sessionScope.member.memberEntireNo}">
  					<input type="text" name="underReviewContent" placeholder="댓글을 입력해주세요">
  					<input type="submit" value="등록">
  					</form>
  				</div>
			</div>
			</c:forEach>
		</div>
		<div id="Menu" class="tabInfo" style="display:none;">
			메뉴
		</div>
		<div id="Map" class="tabInfo" style="display:none;">
			<div id="map-info"></div>
			<script>
/* 			//지도
			var mapContainer = document.getElementById('map-info'), // 지도를 표시할 div 
			mapOption = {
			    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			    level: 3 // 지도의 확대 레벨
			};  

			//지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 

			//주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();

			//주소로 좌표를 검색합니다
			geocoder.addressSearch('${store.owStoreAddr}', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			 if (status === daum.maps.services.Status.OK) {

			    var coords = new daum.maps.LatLng(result[0].y, result[0].x);

			    // 결과값으로 받은 위치를 마커로 표시합니다
			    var marker = new daum.maps.Marker({
			        map: map,
			        position: coords
			    });

			    // 인포윈도우로 장소에 대한 설명을 표시합니다
			    var infowindow = new daum.maps.InfoWindow({
			        content: '<div style="width:150px;text-align:center;padding:6px 0;">'+${store.owStoreName}+'</div>'
			    });
			    infowindow.open(map, marker);

			    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			    map.setCenter(coords);
			} 
			});  */
			</script>
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
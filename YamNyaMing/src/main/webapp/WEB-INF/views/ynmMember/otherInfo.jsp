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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/otherInfo.css?ver=8">             
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberMyInfo.js?ver=7"></script>
</head>
<script>
function openmodal(storeReviewNo){
	var modal = document.getElementById('myModal');
	modal.style.display = "block";
	$.ajax({
		url : "/likeTotalMemberInfo.do",
		data : {storeReviewNo:storeReviewNo},
		dataType:"json",
		success : function(data){
		if(data.length>0){
			$("#likeTotalNum").html(data[0].likeTotal);
			$(".profile-follow").remove();
			for(var i=0; i<data.length; i++){
			var html = '';
            html += '<div class="profile-follow "id="profile-follow">';
            if(data[i].memberUploadPhotoNo==1){
            html += '<div id="profile-follow-image"><img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="/resources/image/member/profile.png"></div>';
            }else{
            html += '<div id="profile-follow-image"><img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="/resources/image/member/'+data[i].photoViewRoute+'"></div>';	
            }
            html += '<div>';
            html += '<p>'+data[i].memberNickName+'</p>';
            html += '<p>'+data[i].reviewTotal+' 리뷰,<label name='+(data[i].memberEntireNo+0.1)+' style="color:black;">'+data[i].followTotal+'</label>  팔로워</p>';
			if(data[i].followChk==1){
            html += '<button style="background-color:#fb0; color:white;" name="'+data[i].memberEntireNo+'" onclick="follow('+data[i].memberEntireNo+',${sessionScope.member.memberEntireNo},'+data[i].memberEntireNo+','+(data[i].memberEntireNo+0.1)+')">팔로우</button>';
			}else{
			html += '<button name="'+data[i].memberEntireNo+'" onclick="follow('+data[i].memberEntireNo+',${sessionScope.member.memberEntireNo},'+data[i].memberEntireNo+','+(data[i].memberEntireNo+0.1)+')">팔로우</button>';
			}
            html += '</div>';
            html += '</div>';
            $("#Follower").after(html);
			}
		}else{
			$("#likeTotalNum").html("");
			$(".profile-follow").remove();
		}
			
			
		}
	});	
	
}

function openImagemodal(storeReviewNo){
	console.log(storeReviewNo);
	var modal = document.getElementById('imageModal');
	modal.style.display = "block";
	$.ajax({
		url : "/reviewDetail.do",
		data : {storeReviewNo:storeReviewNo},
		dataType:"json",
		success : function(data){
			console.log(data);
  			$("#reviewImageDetail").remove();
			var html="";
			html +='<div id="reviewImageDetail" style="width:50%; height:550px;">';
			html +='<img class="reviewImages" src="/resources/image/member/'+data[0].photoViewRoute+'"style="width:200%; height:100%; display:block;">';
			if(data.length>1){
			for(var i=1; i<data.length; i++){
				html +='<img class="reviewImages" src="/resources/image/member/'+data[i].photoViewRoute+'" style="width:200%; height:100%; display:none;">';
			}	
			}
		html+='<button onclick="plusreviewDivs(-1)">&lt;</button>';
		html+='<button onclick="plusreviewDivs(1)">&gt;</button>';
		html+='</div>';
		$("#reviewDetail").append(html);	 
				 
			
		}
	});	
	
}
</script>
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
<section id="member-myinfo-section">
	<div id="main"></div>
	<div>
		<div class="member-myinfo-wrapper">

			<label id="profile-img" for="input_avatarPhoto">
			<c:if test="${info.memberUploadPhotoNo!=1 }">
			<img id="img" name=img src='${pageContext.request.contextPath}/resources/image/member/${img}'>
			</c:if>
			<c:if test="${info.memberUploadPhotoNo==1}">
			<img id="img" name=img src='${pageContext.request.contextPath}/resources/image/member/profile.png'>
			</c:if>
			</label>

			<div>
				<h2>${info.memberName}</h2>
				<p>LV.${info.memberPoint} 맛있는 즐거움, 얌냐밍에 오신 것을 환영합니다</p>
				<p>
						<c:choose>
							<c:when test="${info.memberPoint>=1 }">
								<span class="nemo-box-white first"></span>
							</c:when>
							<c:otherwise>
								<span class="nemo-box first"></span>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${info.memberPoint>2 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>3 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>4 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>5 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>6 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>7 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>8 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>9 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>10 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>11 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
			
						<c:choose>
							<c:when test="${info.memberPoint>12 }">
								<span class="nemo-box-white final"></span>
							</c:when>
							<c:otherwise>
								<span class="nemo-box final"></span>
							</c:otherwise>
						</c:choose>
				</p>
				<p>

					<span onclick="openOtherTab(event,'Review')">리뷰 ${info.reviewTotal}</span>
					<span onclick="openOtherTab(event,'Like')">찜한 매장${info.jjimTotal}</span>
					<span id="myBtn" >팔로워 ${info.followTotal}</span>
					<div id="myModal" class="modal">
					  <div class="modal-content">
					    <span class="close">&times;</span>
					    <div class="tab">
					    	<button class="tablink click" onclick="openModal(event,'Follower')">팔로워</button>
		   					 <button class="tablink" onclick="openModal(event,'Following')">팔로잉</button>
					    </div>
					    <div id="Follower" class="tabInfo">
					    	<c:forEach items="${followerYm}" var="fry">
					    	<div id="profile-follow">
					    		<div id="profile-follow-image">
					    		<img style="border-radius:50%;width:100%; height:100%;"src='${pageContext.request.contextPath}/resources/image/member/${fry.photoViewRoute}'>
					    		</div>
					    		<div>
					    			<p>${fry.memberNickName}</p>
					    			<p>${fry.reviewTotal} 리뷰, <label style="color:black;" id="${fry.memberId}">${fry.followTotal}</label> 팔로워</p>
					<c:if test="${fry.followerChk==0}">
						<button id="${fry.memberNickName}" onclick="follow('${fry.memberEntireNo }','${sessionScope.member.memberEntireNo}','${fry.memberNickName }','${fry.memberId}');">팔로우</button>
					</c:if>
					<c:if test="${fry.followerChk==1}">
						<button  style="background-color:#fb0; color:white;" id="${fry.memberNickName }" onclick="follow('${fry.memberEntireNo }','${sessionScope.member.memberEntireNo}','${fry.memberNickName }','${fry.memberId}');">팔로우</button>
					</c:if>
					    	
								
					    		</div>
					    	</div>	
					    	</c:forEach>				    	
					    	
					    	<div id="profile-follow">
					    		
					    	</div>
					    </div>
					    
					    <div id="Following" class="tabInfo" style="display:none;">
					    	<c:forEach items="${followingYm}" var="fy">
					    	<div id="profile-follow">
					    		<div id="profile-follow-image">
					    			<img style="border-radius:50%;width:100%; height:100%;"src='${pageContext.request.contextPath}/resources/image/member/${fy.photoViewRoute}'>
					    		</div>
					    		<div>
					    			<p>${fy.memberNickName}</p>
					    			<p>${fy.reviewTotal} 리뷰, <label style="color:black;" id="${fy.memberEntireNo}">${fy.followTotal}</label> 팔로워</p>
					    				<c:if test="${fy.followChk==0}">
						<button id="${fy.memberEmail}" onclick="follow('${fy.memberEntireNo }','${sessionScope.member.memberEntireNo}','${fy.memberEmail}','${fy.memberEntireNo }');">팔로우</button>
					</c:if>
					<c:if test="${fy.followChk==1}">
						<button id="${fy.memberEmail}" style="background-color:#fb0; color:white;" onclick="follow('${fy.memberEntireNo }','${sessionScope.member.memberEntireNo}','${fy.memberEmail}','${fy.memberEntireNo }');">팔로우</button>
					</c:if>
					    			
					    		</div>
					    	</div>
					    	</c:forEach>					    	
					    </div>
					  </div>
					</div>
					<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberMyInfo.js?ver=5"></script>
				
					
			</div>
	
		</div>
	</div>
	<div class="member-myinfo-page-wrapper">
		<div class="tab">
		    <button class="tablink click" onclick="openOtherTab(event,'Review')">리뷰</button>
		    <button class="tablink" onclick="openOtherTab(event,'Like')">매장</button>
		</div>

		<div id="Review" class="tabInfo">	
		
			<div class="tab-review">
				<button class="tablink-review click" onclick="openReviewTab(event,'writeReview')">${info.memberNickName} 님이 쓴 리뷰</button>
				<button class="tablink-review" onclick="openReviewTab(event,'jjimReview')">${info.memberNickName} 님이 찜한 리뷰</button>
			</div>
			<div id="writeReview" class="tabInfo-review">
			gdgdgd		
				
			</div>
			<div id="jjimReview" class="tabInfo-review">
			
			fghjtyhfghfr
			</div>			
			
			
		</div>
		<div id="Like" class="tabInfo" style="display:none;">
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
			
	
			<c:forEach items="${search.noticelist}" var="search">
				<c:forEach items="${favorite}" var="f">
				<c:if test="${f.owStoreInfoNo eq search.owStoreInfoPk}">
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
	            <form action="reservation.do" method="get" name="reserve">
	               <input type="button" onclick="popupPost(${search.owStoreInfoPk})" value="예약하기">
	            </form>
				<button>리뷰쓰기</button>
			</div>
			</c:if>
			</c:forEach>
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
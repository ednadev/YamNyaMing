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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/myinfo.css?ver=5">             
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberMyInfo.js?ver=5"></script>
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
<section id="member-myinfo-section">
	<div id="main"></div>
	<div>
		<div class="member-myinfo-wrapper">
			<form action="/updateMemberPhoto.do" method="post" enctype="multipart/form-data">
			<label id="profile-img" for="input_avatarPhoto">
			<img id="img" name=img src='${pageContext.request.contextPath}/resources/image/member/${img}'>
			
			</label>
			
			<input type="file" id="input_avatarPhoto" name="avatarPhoto" value="C:/Users/user1/git/YamNyaMing/YamNyaMing/src/main/webapp/resources/image/member/profile.png">
			<input type="submit" value="변경">
			</form>
			<div>
				<h2>${info.memberName}</h2>
				<p>LV.1 맛있는 즐거움, 얌냐밍에 오신 것을 환영합니다</p>
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
							<c:when test="${info.memberPoint>2 }">
								<span class="nemo-box-white final"></span>
							</c:when>
							<c:otherwise>
								<span class="nemo-box final"></span>
							</c:otherwise>
						</c:choose>
				</p>
				<p>
					<span onclick="openTab(event,'Reservation')">예약 ${info.reservationTotal}</span>
					<span onclick="openTab(event,'Review')">리뷰 ${info.reviewTotal}</span>
					<span onclick="openTab(event,'Like')">찜한 매장${info.jjimTotal}</span>
					<span onclick="openTab(event,'Follow')">팔로워 ${info.followTotal}</span></p>
			</div>
	
		</div>
	</div>
	<div class="member-myinfo-page-wrapper">
		<div class="tab">
			<button class="tablink click" onclick="openTab(event,'Reservation')">예약</button>
		    <button class="tablink" onclick="openTab(event,'Coupon')">쿠폰</button>
		    <button class="tablink" onclick="openTab(event,'Review')">리뷰</button>
		    <button class="tablink" onclick="openTab(event,'Like')">찜</button>
		    <button class="tablink" onclick="openTab(event,'Setting')">설정</button>
		</div>
		<div id="Reservation" class="tabInfo">	
			<h3>방문 예정 예약</h3>
			<h3>지나간 예약</h3>	
		</div>
		<div id="Coupon" class="tabInfo" style="display:none;">			
			<h3>사용 예정 티켓</h3>
			<h3>이미 사용한 티켓</h3>	
		</div>
		<div id="Review" class="tabInfo" style="display:none;">	
			<h3>내가 쓴 리뷰</h3>
			<h3>찜한 리뷰</h3>	
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
				<div class="search-result-img" style="background-image:url(${pageContext.request.contextPath}/resources/${search.owPhotoRoute});">
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
		<div id="Setting" class="tabInfo" style="display:none;">
			<h3>기본 정보</h3>
			<table border="1">
			<tbody>
			<tr>
				<th>아이디</th>
				<td>${info.memberId}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<p>**********<button onclick="pwChange();" id="pwName">변경하기</button></p>
					<form style="display:none;" id="pwChange">
						<p><label>현재 비밀번호</label><input type="password"></p>
						<p><label>새 비밀번호</label><input type="password"></p>
						<p><label>새 비밀번호 확인</label><input type="password"></p>
						<input type="submit" value="비밀번호 변경">
					</form>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${info.memberName}</td>				
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<p>${info.memberNickName}<button onclick="nickChange();" id="nickName">변경하기</button></p>
					<form style="display:none;" id="nickChange">
						<p><input type="text"><input type="submit" value="변경"></p>
					</form>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${info.memberEmail}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${info.memberPhone}</td>
			</tr>			
			</tbody>
			</table>
			<form>
			<h3>알림 / 프라이버시</h3>
			<input type="submit" value="변경하기">
			<table border="1">
			<tbody>
			<tr>
				<th rowspan="2">알림 설정</th>
				<td>
					<p>푸시 수신동의 
						<input type="radio" name="push" id="pushFalse" value="n" checked><label for="pushFalse">동의안함</label>
						<input type="radio" name="push" id="pushTrue" value="y"><label for="pushTrue">동의함</label>
					</p>
					예약/거래정보와 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.
					<div>
						<p>
							<span>내 리뷰-좋아요</span><input type="radio" name="like" id="likeTrue" value="y"><label for="likeTrue">ON</label>
							<input type="radio" name="like" id="likeFalse" value="n" checked><label for="likeFalse" style="margin-right:120px;">OFF</label> 
							<span>내 리뷰-코멘트</span><input type="radio" name="comment" id="commentTrue" value="y"><label for="commentTrue">ON</label>
							<input type="radio" name="comment" id="commentFalse" value="n" checked><label for="commentFalse">OFF</label> 
						</p>
						<p>
							<span>내 리뷰-찜하기</span><input type="radio" name="jjim" id="jjimTrue" value="y"><label for="jjimTrue">ON</label>
							<input type="radio" name="jjim" id="jjimFalse" value="n" checked><label for="jjimFalse" style="margin-right:120px;">OFF</label> 
							<span>나를 팔로우했을때</span><input type="radio" name="follow" id="followTrue" value="y"><label for="followTrue">ON</label>
							<input type="radio" name="follow" id="followFalse" value="n" checked><label for="followFalse">OFF</label> 
						</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<p style="margin-bottom:15px;">제 3자 마케팅 활용 동의 
						<input type="radio" name="agree" id="agreeFalse" value="n" checked><label for="agreeFalse">동의안함</label>
						<input type="radio" name="agree" id="agreeTrue" value="y"><label for="agreeTrue">동의함</label>						
					</p>
					<p>이벤트 알림 서비스</p>
					예약/거래정보와 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.
					<div>
						<p>
							<span>SMS 수신동의</span><input type="radio" name="sms" id="smsTrue" value="y"><label for="smsTrue">동의함</label>
							<input type="radio" name="sms" id="smsFalse" value="n" checked><label for="smsFalse" style="margin-right:74px;">동의안함</label> 
							<span>이메일 수신동의</span><input type="radio" name="email" id="emailTrue" value="y"><label for="emailTrue">동의함</label>
							<input type="radio" name="email" id="emailFalse" value="n" checked><label for="emailFalse">동의안함</label> 
						</p>
					</div>
				</td>
			</tr>			
			<tr>
				<th>정보공개설정</th>
				<td>
					<div>
						<p>
							<span>내 리뷰</span><input type="radio" name="reviewOpen" id="reviewOpenAll" value="y"><label for="reviewOpenAll">전체공개</label>
							<input type="radio" name="reviewOpen" id="reviewOpenPerson" value="n" checked><label for="reviewOpenPerson" style="margin-right:103px;">나만보기</label> 
							<span>찜한 리뷰</span><input type="radio" name="ReviewJjim" id="ReviewJjimAll" value="y"><label for="ReviewJjimAll">전체공개</label>
							<input type="radio" name="ReviewJjim" id="ReviewJjimPerson" value="n" checked><label for="ReviewJjimPerson">나만보기</label> 
						</p>
						<p>
							<span>찜한 매장</span><input type="radio" name="StoreJjim" id="StoreJjimAll" value="y"><label for="StoreJjimAll">전체공개</label>
							<input type="radio" name="StoreJjim" id="StoreJjimPerson" value="n" checked><label for="StoreJjimPerson">나만보기</label>
						</p>
					</div>
					예약 내역은 나와 해당 예약 참석자만 볼 수 있어요!			
				</td>
			</tr>
			</tbody>
			</table>
			</form>
			<form>
				<input type="submit" value="회원 탈퇴">
			</form>
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
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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/myinfo.css?ver=16">             
<script src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member/memberMyInfo.js?ver=3"></script>

</head>
<script>


$(document).ready(function(){
	'${setting.themePushUpdate}'=='y' ? document.getElementsByName('push')[0].checked=true :document.getElementsByName('push')[1].checked=true;
	'${setting.alarmPushReviewLike}'=='y' ? document.getElementsByName('like')[0].checked=true :document.getElementsByName('like')[1].checked=true;
	'${setting.alarmPushReviewComment}'=='y' ? document.getElementsByName('comment')[0].checked=true :document.getElementsByName('comment')[1].checked=true;
	'${setting.alarmPushReviewJjim}'=='y' ? document.getElementsByName('jjim')[0].checked=true :document.getElementsByName('jjim')[1].checked=true;
	'${setting.alarmPushFollow}'=='y' ? document.getElementsByName('follow')[0].checked=true :document.getElementsByName('follow')[1].checked=true;
	'${setting.myinfoAgree}'=='y' ? document.getElementsByName('agree')[0].checked=true :document.getElementsByName('agree')[1].checked=true;
	'${setting.alarmEventEmail}'=='y' ? document.getElementsByName('sms')[0].checked=true :document.getElementsByName('sms')[1].checked=true;
	'${setting.alarmEventSms}'=='y' ? document.getElementsByName('email')[0].checked=true :document.getElementsByName('email')[1].checked=true;
	'${setting.myinfoReviewOpen}'=='y' ? document.getElementsByName('reviewOpen')[0].checked=true :document.getElementsByName('reviewOpen')[1].checked=true;
	'${setting.myinfoReviewJjim}'=='y' ? document.getElementsByName('ReviewJjim')[0].checked=true :document.getElementsByName('ReviewJjim')[1].checked=true;
	'${setting.myinfoStoreJjim}'=='y' ? document.getElementsByName('StoreJjim')[0].checked=true :document.getElementsByName('StoreJjim')[1].checked=true;
});

function deleteBook(bookNo){
	if(confirm("예약을 취소 하시겠습니까?")){
	var id="book_"+bookNo;
	console.log(id);
	$.ajax({
		url : "/deleteBook.do",
		data : {bookNo:bookNo},
		success : function(data){
			if(data==1){
				$("#"+id).remove();
			}
			
		}
	});	
	}
	
}

function likeopenmodal(storeReviewNo){
	var modal = document.getElementById('likeModal');
	modal.style.display = "block";
	$.ajax({
		url : "/likeTotalMemberInfo.do",
		data : {storeReviewNo:storeReviewNo},
		dataType:"json",
		success : function(data){
		if(data.length>0){
			$("#waitTotalNum").html("${b.bookTotal}");
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
            html += '<p><a style="color:black;" href="/otherMember.do?memberEntireNo='+data[i].memberEntireNo+'">'+data[i].memberNickName+'</a></p>';
            html += '<p>'+data[i].reviewTotal+' 리뷰,<label name='+(data[i].memberEntireNo+0.1)+' style="color:black;">'+data[i].followTotal+'</label>  팔로워</p>';
			if(data[i].followChk==1){
            html += '<button style="background-color:#fb0; color:white;" name="'+data[i].memberEntireNo+'" onclick="follow('+data[i].memberEntireNo+',${sessionScope.member.memberEntireNo},'+data[i].memberEntireNo+','+(data[i].memberEntireNo+0.1)+')">팔로우</button>';
			}else{
			html += '<button name="'+data[i].memberEntireNo+'" onclick="follow('+data[i].memberEntireNo+',${sessionScope.member.memberEntireNo},'+data[i].memberEntireNo+','+(data[i].memberEntireNo+0.1)+')">팔로우</button>';
			}
            html += '</div>';
            html += '</div>';
            $("#liker").after(html);
			}
		}else{
			$("#waitTotalNum").html("");
			$(".profile-follow").remove();
		}
			
			
		}
	});	
	
}

function insertUnderReview(storeReviewNo,memberEntireNo,reviewType){
	
	var underReviewContentId=null;
	var divId=null;
	var reviewChk=reviewType;
	console.log(reviewChk);
	if(reviewChk=="myReview"){
	underReviewContentId=parseInt(storeReviewNo)+0.2;
	divId=parseInt(storeReviewNo)+0.1;
	}else{
	underReviewContentId=parseInt(storeReviewNo)+0.5;
	divId=parseInt(storeReviewNo)+0.5;
	}
	
	var underReviewContent=document.getElementById(underReviewContentId).value;

 		$.ajax({
			url : "/storeUnderReviewInsert.do",
			data : {storeReviewNo:storeReviewNo,memberEntireNo:memberEntireNo,underReviewContent:underReviewContent},
			success : function(data){
						console.log(data);
					
						var html="";
						html +='<div class="underBox">';
						html +='<div class="underImageBox">';
						
						if(data.memberUploadPhotoNo==1){
							html +='<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="${pageContext.request.contextPath}/resources/image/member/profile.png">';
						}else{
							html +='<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="/resources/image/member/'+data.photoViewRoute+'">';
						}
						html+='</div>';
						html+='<div>';
						html+='<label class="undernick">'+data.memberNickName+'</label>';
						html+='<input type="text" class="underinput" name="underReviewContent" value="'+data.underReviewContent+'" readonly>';
						html+='</div>';
						html+='</div>';
					
					var e = document.createElement('div');
					e.innerHTML = html;
					document.getElementById('review_u_'+divId).append(e.firstChild); 

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
			html +='<div id="reviewImageDetail" style="display:flex;justify-content:center;">';
			html +='<img class="reviewImages" src="/resources/image/member/'+data[0].photoViewRoute+'"style="height:90%; display:block;">';
			if(data.length>1){
			for(var i=1; i<data.length; i++){
				html +='<img class="reviewImages" src="/resources/image/member/'+data[i].photoViewRoute+'" style="height:90%; display:none;">';
			}	
			}
			html+='</div>';	
			html+='<div id="slideBtn">';
			html+='<button onclick="plusreviewDivs(-1)">&lt;</button>';
			html+='<button onclick="plusreviewDivs(1)">&gt;</button>';
			html+='</div>';	
			$("#reviewDetail").append(html); 
				 
			
		}
	});	
	
}

function waitRefresh(storeEntireNo){
	$.ajax({
		url : "/storeWaitNum.do",
		data : {storeEntireNo:storeEntireNo},
		dataType:"json",
		success : function(data){
			console.log("대기 인원 데이터 " + data);
			if(data.length>0){
				$("#waitTotalNum").html(data[0].likeTotal);
				$(".waitprofile-follow").remove();
				for(var i=0; i<data.length; i++){
				var html = '';
	            html += '<div class="waitprofile-follow "id="waitprofile-follow">';
	            if(data[i].memberUploadPhotoNo==1){
	            html += '<div id="profile-follow-image"><img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="/resources/image/member/profile.png"></div>';
	            }else{
	            html += '<div id="profile-follow-image"><img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="/resources/image/member/'+data[i].photoViewRoute+'"></div>';	
	            }
	            html += '<div>';
	            html += '<p><a style="color:black;" href="/otherMember.do?memberEntireNo='+data[i].memberEntireNo+'">'+data[i].memberNickName+'</a></p>';
	            html += '</div>';
	            html += '</div>';
	            $("#waiter").after(html);
				}
			}else{
				$("#waitTotalNum").html("");
				$(".waitprofile-follow").remove();
			}
				 
			
		}
	});	
}
function waitModal(storeEntireNo){
	var modal = document.getElementById('waitNumModal');
		modal.style.display = "block";


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
			<form action="/updateMemberPhoto.do" method="post" enctype="multipart/form-data">
			<label id="profile-img" for="input_avatarPhoto" onclick="deleteImageAction();">
			<c:if test="${info.memberUploadPhotoNo!=1 }">
			<img id="img" name=img src='${pageContext.request.contextPath}/resources/image/member/${img}'>
			</c:if>
			<c:if test="${info.memberUploadPhotoNo==1}">
			<img id="img" name=img src='${pageContext.request.contextPath}/resources/image/member/profile.png'>
			</c:if>
			</label>
			
			<input type="file" id="input_avatarPhoto" name="avatarPhoto" value="C:/Users/user1/git/YamNyaMing/YamNyaMing/src/main/webapp/resources/image/member/profile.png">
			<input type="submit" value="변경">
			</form>
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
							<c:when test="${info.memberPoint>=2 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>=3 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>=4 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>=5 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>=6 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>=7 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>=8 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>=9 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>=10 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
									<c:choose>
							<c:when test="${info.memberPoint>=11 }">
									<span class="nemo-box-white"></span>
							</c:when>
							<c:otherwise>
									<span class="nemo-box"></span>
							</c:otherwise>
						</c:choose>
			
						<c:choose>
							<c:when test="${info.memberPoint>=12 }">
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
					<span id="myBtn" onclick="followModal();" >팔로워 ${info.followTotal}</span>
					<div id="myModal" class="modal">
					  <div class="modal-content">
					    <span class="close" onclick="followClose();">&times;</span>
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
					    			<p><a style="color:black;" href="/otherMember.do?memberEntireNo=${fry.memberEntireNo}">${fry.memberNickName}</a></p>
					    			<p>${fry.reviewTotal} 리뷰, <label style="color:black;" name="mreview_${fry.memberId}">${fry.followTotal}</label> 팔로워</p>
					<c:if test="${fry.followChk==0}">
						<button name="mreview_${fry.memberNickName}" onclick="follow('${fry.memberEntireNo }','${sessionScope.member.memberEntireNo}','mreview_${fry.memberNickName }','mreview_${fry.memberId}');">팔로우</button>
					</c:if>
					<c:if test="${fry.followChk==1}">
						<button  style="background-color:#fb0; color:white;" name="mreview_${fry.memberNickName }" onclick="follow('${fry.memberEntireNo }','${sessionScope.member.memberEntireNo}','mreview_${fry.memberNickName }','mreview_${fry.memberId}');">팔로우</button>
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
					    			<p><a style="color:black;" href="/otherMember.do?memberEntireNo=${fy.memberEntireNo}">${fy.memberNickName}</a></p>
					    			<p>${fy.reviewTotal} 리뷰, <label style="color:black;" name="ireview_${fy.memberEntireNo}">${fy.followTotal}</label> 팔로워</p>
					    			<button name="ireview_${fy.memberEmail}" style="background-color:#fb0; color:white;" onclick="follow('${fy.memberEntireNo }','${sessionScope.member.memberEntireNo}','ireview_${fy.memberEmail}','ireview_${fy.memberEntireNo }');">팔로우</button>
					    		</div>
					    	</div>
					    	</c:forEach>					    	
					    </div>
					  </div>
					</div>
				
				
					
			</div>
	
		</div>
	</div>
	<div class="member-myinfo-page-wrapper">
		<div class="tab">
			<button class="tablink click" onclick="openTab(event,'Reservation')">예약</button>
		    <button class="tablink" onclick="openTab(event,'Coupon')">쿠폰</button>
		    <button class="tablink" onclick="openTab(event,'Review')">리뷰</button>
		    <button class="tablink" onclick="openTab(event,'Like')">매장</button>
		    <button class="tablink" onclick="openTab(event,'Setting')">설정</button>
		</div>
		<div id="Reservation" class="tabInfo">	
			<div class="tab-reservation">
				<button class="tablink-reservation click" onclick="openReservationTab(event,'visitedReservation')">방문 예정 예약</button>
				<button class="tablink-reservation" onclick="openReservationTab(event,'goneReservation')">지나간 예약</button>
			</div>
			<div id="visitedReservation" class="tabInfo-reservation" style="display:block;">
			<c:forEach items="${book}" var="b">
			<div class="bookBox" id="book_${b.bookNo}">
  					<div class="bookImageBox">
						<img id="img" style="border-radius:50%;width:100%; height:100%;" name=img src="${pageContext.request.contextPath}/${b.owPhotoViewRoute}">
	
  					</div>
  					<div>
  					<label class="booknick"><a href="/detailPage.do?owStoreInfoPk=${b.storeEntireNo}">${b.owStoreName}</a></label>
  					<label class="booknick">${b.bookDateAndTime2}</label>
  					<label class="bookNum" style="margin-left:12px;" onclick="waitModal('${b.storeEntireNo}');">${b.bookTotal}명 대기중</label>
					<label onclick="deleteBook('${b.bookNo}')">예약취소</label>
					<script>
					storeIndex('${b.storeEntireNo}');
				
					</script>
  					</div>
  					
  				</div>
				</c:forEach>
				<script>
				
				loadWaitList();
				</script>
				
				
				
			</div>
			<div id="goneReservation" class="tabInfo-reservation" style="display:none;">
					<c:forEach items="${lastBook}" var="lb">
			<div class="bookBox">
  					<div class="bookImageBox">
						<img id="img"  style="border-radius:50%; width:100%; height:100%;" name=img src="${pageContext.request.contextPath}/${lb.owPhotoViewRoute}">
	
  					</div>
  					<div >
  					<label class="booknick"><a href="/detailPage.do?owStoreInfoPk=${lb.storeEntireNo}">${lb.owStoreName}</a></label>
  					<label class="booknick">${lb.bookDateAndTime2}</label>
						
  					</div>
  					
  				</div>
				</c:forEach>

			</div>
		</div>
		<div id="Coupon" class="tabInfo" style="display:none;">			
			<div class="tab-coupon">
				<button class="tablink-coupon click" onclick="openCouponTab(event,'usedCoupon')">사용 예정 쿠폰</button>
				<button class="tablink-coupon" onclick="openCouponTab(event,'goneCoupon')">이미 사용한 쿠폰</button>
			</div>
			<div id="usedCoupon" class="tabInfo-coupon">
				사용 예정 쿠폰
			</div>
			<div id="goneCoupon" class="tabInfo-coupon" style="display:none;">
				이미 사용한 쿠폰
			</div>
		</div>
		<div id="Review" class="tabInfo" style="display:none;">	
		
			<div class="tab-review">
				<button class="tablink-review click" onclick="openReviewTab(event,'writeReview')">내가 쓴 리뷰</button>
				<button class="tablink-review" onclick="openReviewTab(event,'jjimReview')">찜한 리뷰</button>
			</div>
			<div id="writeReview" class="tabInfo-review">
		<c:forEach items="${review}" var="r">
			<div  id="review_u_${r.storeReviewNo + 0.1 }">
				<div>
					<div id="profile-image">
					
						<c:if test="${r.memberUploadPhotoNo eq 1}">
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="${pageContext.request.contextPath}/resources/image/member/profile.png">
						</c:if>
						<c:if test="${r.memberUploadPhotoNo ne 1}">	
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="${pageContext.request.contextPath}/resources/image/member/${r.photoViewRoute}">
						</c:if>
					</div>
					<div>
						<p><a href="/otherMember.do?memberEntireNo=${r.memberEntireNo}" style="color:black;">${r.memberNickName}</a></p>
						<p>리뷰${r.reviewTotal},팔로워<label name="fLabel_${r.memberEntireNo}" style="color:black;">${r.followTotal}</label></p>				
					</div>
				
					<c:if test="${r.myfollowChk==0 && sessionScope.member.memberEntireNo!=null}">
						<button name="fbtn_${r.memberEntireNo}" onclick="follow('${r.memberEntireNo }','${sessionScope.member.memberEntireNo}','fbtn_${r.memberEntireNo}','fLabel_${r.memberEntireNo}');">팔로우</button>
					</c:if>
					<c:if test="${r.myfollowChk==1 && sessionScope.member.memberEntireNo!=null}">
					<button name="fbtn_${r.memberEntireNo}" style="background-color:#fb0; color:white;" onclick="follow('${r.memberEntireNo }','${sessionScope.member.memberEntireNo}','fbtn_${r.memberEntireNo}','fLabel_${r.memberEntireNo}');">팔로우</button>
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
	
							<img onclick="openImagemodal('${r.storeReviewNo}');" style="width:100%; height:100%;" name=img src='${pageContext.request.contextPath}/resources/image/member/${photo.photoViewRoute}'>
						</div>
						</c:forEach>
					</div>
					
					
					
					<p onclick="likeopenmodal('${r.storeReviewNo}');" style="cursor:pointer;">
					<c:if test="${r.memberLikeInfo!=null}">
						<c:forEach items='${r.memberLikeInfo}' var="li" >
						<label>${li.memberName}</label>
						</c:forEach>
						<c:if test="${r.likeTotal >=3}">
						님 외 ${r.likeTotal - 2}명이 좋아합니다.
						</c:if>
						<c:if test="${r.likeTotal <= 2}">
						님이 좋아합니다.
						</c:if>
						
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
  					<div class="underImage">
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
  				
  				
  					<input type="hidden" name="storeReviewNo" value="${r.storeReviewNo}">
					<input type="hidden" name="memberEntireNo" value="${sessionScope.member.memberEntireNo}">
  					<input type="text" class="reviewText" id="${r.storeReviewNo + 0.2}" name="underReviewContent" placeholder="댓글을 입력해주세요">
  					<c:if test="${sessionScope.member!=null }">
  					<input type="button" class="underButton" onclick="insertUnderReview('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}','myReview');" value="등록">
  					</c:if>
  					<c:if test="${sessionScope.member==null }">
  					<input type="button" class="underButton" onclick="nomember();" value="등록">
  					</c:if>

  				</div>

  				<c:forEach items="${r.ysurList}" var="under">
  				<c:if test="${under.storeReviewNo==r.storeReviewNo}">
  				<div class="underBox">
  					<div class="underImageBox">
						<c:if test="${under.memberUploadPhotoNo eq 1}">
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="${pageContext.request.contextPath}/resources/image/member/profile.png">
						</c:if>
						<c:if test="${under.memberUploadPhotoNo ne 1}">	
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="${pageContext.request.contextPath}/resources/image/member/${under.photoViewRoute}">
						</c:if>
  					</div>
  					
  					
  					<div >
  					<label class="undernick"><a style="color:black;" href="/otherMember.do?memberEntireNo=${under.memberEntireNo}">${under.memberNickName}</a></label>
					<input type="text" class="underinput" name="underReviewContent" value="${under.underReviewContent}" readonly>
  					</div>
  				</div>
  				</c:if>
  				</c:forEach>
  				
			</div>
			</c:forEach>
			
			
				
			</div>
			<div id="jjimReview" class="tabInfo-review" style="display:none;">
				<c:forEach items="${jjimReview}" var="r">
				<div  id="review_u_${r.storeReviewNo + 0.5 }">
				<div>
					<div id="profile-image">
					
						<c:if test="${r.memberUploadPhotoNo eq 1}">
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="${pageContext.request.contextPath}/resources/image/member/profile.png">
						</c:if>
						<c:if test="${r.memberUploadPhotoNo ne 1}">	
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="${pageContext.request.contextPath}/resources/image/member/${r.photoViewRoute}">
						</c:if>
					</div>
					<div>
						<p><a style="color:black;" href="/otherMember.do?memberEntireNo=${r.memberEntireNo}">${r.memberNickName}</a></p>
						<p>리뷰${r.reviewTotal},팔로워<label name="jfLabel_${r.memberEntireNo}" style="color:black;">${r.followTotal}</label></p>				
					</div>
				
					<c:if test="${r.myfollowChk==0 && sessionScope.member.memberEntireNo!=null}">
						<button name="jfbtn_${r.memberEntireNo}" onclick="follow('${r.memberEntireNo }','${sessionScope.member.memberEntireNo}','jfbtn_${r.memberEntireNo}','jfLabel_${r.memberEntireNo}');">팔로우</button>
					</c:if>
					<c:if test="${r.myfollowChk==1 && sessionScope.member.memberEntireNo!=null}">
					<button name="jfbtn_${r.memberEntireNo}" style="background-color:#fb0; color:white;" onclick="follow('${r.memberEntireNo }','${sessionScope.member.memberEntireNo}','jfbtn_${r.memberEntireNo}','jfLabel_${r.memberEntireNo}');">팔로우</button>
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
	
							<img onclick="openImagemodal('${r.storeReviewNo}');" style="width:100%; height:100%;" name=img src='${pageContext.request.contextPath}/resources/image/member/${photo.photoViewRoute}'>
						</div>
						</c:forEach>
					</div>
					
					
					
					<p onclick="likeopenmodal('${r.storeReviewNo}');" style="cursor:pointer;">
					<c:if test="${r.memberLikeInfo!=null}">
						<c:forEach items='${r.memberLikeInfo}' var="li" >
						<label>${li.memberName}</label>
						</c:forEach>
						<c:if test="${r.likeTotal >=3}">
						님 외 ${r.likeTotal - 2}명이 좋아합니다.
						</c:if>
						<c:if test="${r.likeTotal <= 2}">
						님이 좋아합니다.
						</c:if>
						
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
  					<div class="underImage">
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
  				
  				
  					<input type="hidden" name="storeReviewNo" value="${r.storeReviewNo}">
					<input type="hidden" name="memberEntireNo" value="${sessionScope.member.memberEntireNo}">
  					<input type="text" class="reviewText" id="${r.storeReviewNo + 0.5}" name="underReviewContent" placeholder="댓글을 입력해주세요">
  					<c:if test="${sessionScope.member!=null }">
  					<input type="button" class="underButton" onclick="insertUnderReview('${r.storeReviewNo}','${sessionScope.member.memberEntireNo}');" value="등록">
  					</c:if>
  					<c:if test="${sessionScope.member==null }">
  					<input type="button" class="underButton" onclick="nomember();" value="등록">
  					</c:if>

  				</div>

  				<c:forEach items="${r.ysurList}" var="under">
  				<c:if test="${under.storeReviewNo==r.storeReviewNo}">
  				<div class="underBox">
  					<div class="underImageBox">
						<c:if test="${under.memberUploadPhotoNo eq 1}">
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="${pageContext.request.contextPath}/resources/image/member/profile.png">
						</c:if>
						<c:if test="${under.memberUploadPhotoNo ne 1}">	
						<img id="img" style="width:100%; height:100%; border-radius:50%;" name=img src="${pageContext.request.contextPath}/resources/image/member/${under.photoViewRoute}">
						</c:if>
  					</div>
  					
  					
  					<div >
  					<label class="undernick">${under.memberNickName}</label>
					<input type="text" class="underinput" name="underReviewContent" value="${under.underReviewContent}" readonly>
  					</div>
  				</div>
  				</c:if>
  				</c:forEach>
  				
			</div>
			</c:forEach>
			
			</div>
			</div>
		<div id="Like" class="tabInfo" style="display:none;">            
	
			<c:forEach items="${storeAllList}" var="search">
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
									<div class="heart" id="${search.owStoreInfoPk}"
										onclick="favorite('${sessionScope.member.memberEntireNo}','${search.owStoreInfoPk}');">
										<img style="width: 100%; height: 100%; cursor: pointer;"
											src='${pageContext.request.contextPath}/resources/image/member/search/heart-click.png'>
									</div>
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
					<form style="display:none;" id="pwChange" action="/pwChange.do">
						
						<p><label>현재 비밀번호</label><input type="password" onChange="nowPwCheck('${sessionScope.member.memberId}');" id="nowPw"></p>
							
						<p><label>새 비밀번호</label><input type="password" name="memberPw" id="memberPw" onChange="pwCheck('${sessionScope.member.memberId}');"></p>
						<p><label>새 비밀번호 확인</label><input type="password" id="memberPw2" onChange="pwreCheck();"><br><label id="pw_check"></label></p>
						<input id="newPwChange" type="submit" value="비밀번호 변경">
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
					<form style="display:none;" id="nickChange" action="/nickNameChange.do">
						<p><input type="text" name="memberNickName" id="memberNickName" onchange="nickCheck();"><input type="submit" id="newNick" value="변경"><br><label id="nick_check"></label></p>
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
			<input type="button" value="변경하기" onclick="setting();">
			<table border="1">
			<tbody>
			<tr>
				<th rowspan="2">알림 설정</th>
				<td>
					<p>푸시 수신동의 
						<input type="radio" name="push" id="pushFalse" value="n"><label for="pushFalse">동의안함</label>
						<input type="radio" name="push" id="pushTrue" value="y"><label for="pushTrue">동의함</label>
					</p>
					예약/거래정보와 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.
					<div>
						<p>
							<span>내 리뷰-좋아요</span><input type="radio" name="like" id="likeTrue" value="y"><label for="likeTrue">ON</label>
							<input type="radio" name="like" id="likeFalse" value="n"><label for="likeFalse" style="margin-right:120px;">OFF</label> 
							<span>내 리뷰-코멘트</span><input type="radio" name="comment" id="commentTrue" value="y"><label for="commentTrue">ON</label>
							<input type="radio" name="comment" id="commentFalse" value="n" checked><label for="commentFalse">OFF</label> 
						</p>
						<p>
							<span>내 리뷰-찜하기</span><input type="radio" name="jjim" id="jjimTrue" value="y"><label for="jjimTrue">ON</label>
							<input type="radio" name="jjim" id="jjimFalse" value="n"><label for="jjimFalse" style="margin-right:120px;">OFF</label> 
							<span>나를 팔로우했을때</span><input type="radio" name="follow" id="followTrue" value="y"><label for="followTrue">ON</label>
							<input type="radio" name="follow" id="followFalse" value="n"><label for="followFalse">OFF</label> 
						</p>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<p style="margin-bottom:15px;">제 3자 마케팅 활용 동의 
						<input type="radio" name="agree" id="agreeFalse" value="n"><label for="agreeFalse">동의안함</label>
						<input type="radio" name="agree" id="agreeTrue" value="y"><label for="agreeTrue">동의함</label>						
					</p>
					<p>이벤트 알림 서비스</p>
					예약/거래정보와 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.
					<div>
						<p>
							<span>SMS 수신동의</span><input type="radio" name="sms" id="smsTrue" value="y"><label for="smsTrue">동의함</label>
							<input type="radio" name="sms" id="smsFalse" value="n"><label for="smsFalse" style="margin-right:74px;">동의안함</label> 
							<span>이메일 수신동의</span><input type="radio" name="email" id="emailTrue" value="y"><label for="emailTrue">동의함</label>
							<input type="radio" name="email" id="emailFalse" value="n"><label for="emailFalse">동의안함</label> 
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
							<input type="radio" name="reviewOpen" id="reviewOpenPerson" value="n"><label for="reviewOpenPerson" style="margin-right:103px;">나만보기</label> 
							<span>찜한 리뷰</span><input type="radio" name="ReviewJjim" id="ReviewJjimAll" value="y"><label for="ReviewJjimAll">전체공개</label>
							<input type="radio" name="ReviewJjim" id="ReviewJjimPerson" value="n"><label for="ReviewJjimPerson">나만보기</label> 
						</p>
						<p>
							<span>찜한 매장</span><input type="radio" name="StoreJjim" id="StoreJjimAll" value="y"><label for="StoreJjimAll">전체공개</label>
							<input type="radio" name="StoreJjim" id="StoreJjimPerson" value="n"><label for="StoreJjimPerson">나만보기</label>
						</p>
					</div>
					예약 내역은 나와 해당 예약 참석자만 볼 수 있어요!			
				</td>
			</tr>
			</tbody>
			</table>
			</form>
			<form>
				<input type="button" style="float:right;" onclick="deleteMember();" value="회원 탈퇴">
			</form>
		</div>
	
	</div>
	
		<div id="likeModal" class="modal">
				<div class="modal-content">
					<span class="close" onclick="closemodal();">&times;</span>
					<div class="tab">
						<button class="likemodaltablink click">이 댓글을 좋아하는 사람들<label id="likeTotalNum"></label> </button>
					</div>
					<div id="liker" class="likemodaltabInfo">
	
					</div>
			</div>

		</div>				
				<script>
					var slideIndex = 1;
					showreviewDivs(slideIndex);
					function plusreviewDivs(n){
						showreviewDivs(slideIndex += n);
					}
					function showreviewDivs(n){
						var i;
						var x = document.getElementsByClassName("reviewImages");
						if(n>x.length){slideIndex = 1}
						if(n<1){slideIndex = x.length}
						for(i=0;i<x.length;i++){
							x[i].style.display = "none";
						}
						x[slideIndex-1].style.display = "block";
					}
				</script>
		
		<div id="imageModal" class="modal">
				<div class="imagemodal-content">
					<span class="close" onclick="closeimagemodal();">&times;</span>
					<div class="tab">
						<button class="likemodaltablink click">댓글에 등록된 사진</button>
					</div>
					<div id="Follower" class="likemodaltabInfo">
							<div id="reviewDetail">
		
							</div>
					</div>
			</div>

		</div>	
		
		<div id="waitNumModal" class="modal">
				<div class="waitmodal-content">
					<span class="close" onclick="waitclosemodal();">&times;</span>
					<div class="waittab">
						<button class="waittablink click">대기 중인 사람들<label id="waitTotalNum"></label> </button>
					</div>
					<div id="waiter" class="waittabInfo">
	
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
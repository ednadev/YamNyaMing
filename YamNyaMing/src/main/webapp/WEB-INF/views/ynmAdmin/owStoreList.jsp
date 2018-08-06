<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"

	import="com.kh.ynm.admin.model.vo.*"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
</head>
<style>
.paging-num {
	float:center;
	width: 80px;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #FFBB00;
	background: #FFBB00;
	padding: 16px 18px 14px;
	font-size: 20px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px rebeccapurple;
	-moz-box-shadow: 0px 6px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
}
.paging-num:active {
	-webkit-box-shadow: 0px 1px 0px rebeccapurple;
	-moz-box-shadow: 0px 2px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
	position: relative;
	top: -1px;
}

.btn {
	float:right;
	width: 100px;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #FFBB00;
	background: #FFBB00;
	padding: 16px 18px 14px;
	font-size: 20px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px rebeccapurple;
	-moz-box-shadow: 0px 6px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
}
.btn:active {
	-webkit-box-shadow: 0px 1px 0px rebeccapurple;
	-moz-box-shadow: 0px 2px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
	position: relative;
	top: -1px;
}
.btn2 {
	float:right;
	margin:-35px;
	margin-right:-9px;
	width: 100px;
	display: inline-block;
	color: #ecf0f1;
	text-decoration: none;
	border-radius: 5px;
	border: solid 1px #FFBB00;
	background: #FFBB00;
	padding: 16px 18px 14px;
	font-size: 10px;
	-webkit-transition: all 0.1s;
	-moz-transition: all 0.1s;
	transition: all 0.1s;
	-webkit-box-shadow: 0px 6px 0px rebeccapurple;
	-moz-box-shadow: 0px 6px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
}
.btn2:active {
	-webkit-box-shadow: 0px 1px 0px rebeccapurple;
	-moz-box-shadow: 0px 2px 0px rebeccapurple;
	box-shadow: 0px 0px 0px rebeccapurple;
	position: relative;
	top: -1px;
}

</style>
<body>
	<header id="admin-login-header">
		<h1>
			<a href="/adminInfo.do">YamNyaMing 관리자</a>
		</h1>
		<p>
			[${sessionScope.admin.ad_nickname}] 님 안녕하세요  <a href="/logoutAdmin.do">로그아웃</a>
		</p>
	</header>
	<nav id="admin-main-nav">
		<ul>
	        <li><a href="/adminInfo.do">관리자 정보</a></li>
			<li><a href="/allMemberView.do">회원 관리</a></li>
			<li><a href="/allOwnerView.do">점장 관리</a></li>
			<li><a href="/boardAdmin.do">게시판</a></li>
			<li><a href="/statAdmin.do">통계</a></li>
		</ul>
	</nav>


	    <c:forEach var="storeInfo" items="${storeList}">
	    <div class="col-lg-4 col-md-4 col-sm-6">
           <div class="thumbnail img-thumb-bg">
               <div class="overlay"></div>
               <div class="caption">
               	  
                   <div class="tag">${storeInfo.owStoreName}
                   <c:choose>
                   <c:when test="${storeInfo.owBigTypeFk==1}">(한식)</c:when>
                   <c:when test="${storeInfo.owBigTypeFk==2}">(중식)</c:when>
                   <c:when test="${storeInfo.owBigTypeFk==3}">(일식) </c:when>
                   <c:when test="${storeInfo.owBigTypeFk==4}">(양식)</c:when>
                   <c:when test="${storeInfo.owBigTypeFk==5}">(뷔페)</c:when>
                   <c:when test="${storeInfo.owBigTypeFk==6}">(디저트)</c:when>
                   <c:when test="${storeInfo.owBigTypeFk==7}">(술집)</c:when>
                   <c:otherwise>기타</c:otherwise>
                   </c:choose>
				   </div>
                   <c:if test="${storeInfo.owStoreUrl!=null}">
                   <a href="${storeInfo.owStoreUrl}">사이트 주소 : ${storeInfo.owStoreUrl}</a> 
                   </c:if>
                   <c:if  test="${storeInfo.owStoreUrl==null}">
                   <a style="color:red;">사이트 없음</a>
                   </c:if>
                   <div>영업시간 : ${storeInfo.owStoreWorkingTime}</div>
                   <div>주소 : ${storeInfo.owStoreAddr }</div><br>
                   <div>Tell : ${storeInfo.owStoreTel}</div><br>
                   <div>${storeInfo.storeTableInfo}</div>
                   <div>
                    <c:choose>
      				<c:when test="${storeInfo.store_enroll_rq_state eq '2'}">
    			    <form action="/upGrade.do">
     			    <input type="hidden" id="owStoreInfoPk" name="owStoreInfoPk" class="owStoreInfoPk" value="${storeInfo.owStoreInfoPk}"/>
      				<input type="submit" style="background-color:white;font-size:20px; font-family: 'Sunflower'; border:0px solid maroon"value="수락"/>
      				</form>
      				</c:when>
      				<c:otherwise>
     				<form action="/downGrade.do">
      				<input type="hidden" id="owStoreInfoPk" name="owStoreInfoPk" class="owStoreInfoPk" value="${storeInfo.owStoreInfoPk}"/>
      				<input type="submit" style="background-color:white; font-size:20px; font-family: 'Sunflower'; border:0px solid maroon"value="강등"/>
      				</form>
      				</c:otherwise>
      				</c:choose>
                   </div>
               </div>
           </div>
        </div>
	</div>
</c:forEach> 


   
  <!-- 게시물 리스트 보여주기 -->

  
       
      
   

	
     <!-- 페이지 -->
    <c:if test="${pageNaviData!=null}">
    	
					<div id="pagingNumber">
						<c:if test="${pageNaviData.startNavi!=1}">
							<form action="/ownerStoreList.do" method="post">
								<!--  <input type="hidden" value="${o.owEntirePk}" id="owEntirePk" name="owEntirePk"/> -->
								<input type="hidden"  name="currentPage" value="${pageNaviData.startNavi-1}"> 
								<input type="submit" class="paging-num" value="<">
							</form>
						</c:if>
						<c:forEach var="i" begin="${pageNaviData.startNavi}" end="${pageNaviData.endNavi}">
							<c:if test="${pageNaviData.currentPage==i}">
								<form action="/ownerStoreList.do" method="post">
								   <!--  <input type="hidden" value="${o.owEntirePk}" id="owEntirePk" name="owEntirePk"/> -->
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form>
							</c:if>
							<c:if test="${pageNaviData.currentPage!=i}">
								<form action="/ownerStoreList.do" method="post">
								    <!--  <input type="hidden" value="${o.owEntirePk}" id="owEntirePk" name="owEntirePk"/> -->
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form>
							</c:if>
						</c:forEach>
						<c:if test="${pageNaviData.endNavi!=pageNaviData.pageTotalCount}">
							<form action="/ownerStoreList.do" method="post">	
							  <!--  <input type="hidden" value="${o.owEntirePk}" id="owEntirePk" name="owEntirePk"/> --> 
								<input type="hidden" name="currentPage"	value="${pageNaviData.endNavi+1}"> 
								<input type="submit"  class="paging-num"  value=">">
							</form>
						</c:if>
					</div>
			
				</c:if>
		

<script>
function goPage(pages, lines) {
    location.href = '?' + "pages=" + pages;
}
</script>
<!-- 페이징 끝 -->



<footer id="admin-main-footer">
		<h2>YamNyaMing</h2>
		<p>Immediately Reservation!</p>
		<address>
			㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
			주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018
			YamNyaMing Co. All rights reserved
		</address>
	</footer>
</body>
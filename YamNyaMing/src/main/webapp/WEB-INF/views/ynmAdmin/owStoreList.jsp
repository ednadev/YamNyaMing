<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="com.kh.ynm.admin.model.vo.*"
	import ="com.kh.ynm.owner.model.vo.*"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
  <% Notice g = (Notice)request.getAttribute("StoreInfo"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/btn.css?ver=1">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
<style>li {float: left;}</style>
</head>
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
<body>
	    <c:forEach var="storeInfo" items="${storeList}">
	    <div class="col-lg-4 col-md-4 col-sm-6" style="width:60%; margin-left:20%; margin-right:20%;">
           <div class="thumbnail img-thumb-bg">
               <div class="overlay"></div>
               <div class="caption">
      			<div class="tag"><h2></h2>
                   
                   <c:choose>
                   <c:when test="${storeInfo.owBigTypeFk==1}"><h2>${storeInfo.owStoreName}(한식)</h2></c:when>
                   <c:when test="${storeInfo.owBigTypeFk==2}"><h2>${storeInfo.owStoreName}(중식)</h2></c:when>
                   <c:when test="${storeInfo.owBigTypeFk==3}"><h2>${storeInfo.owStoreName}(일식)</h2></c:when>
                   <c:when test="${storeInfo.owBigTypeFk==4}"><h2>${storeInfo.owStoreName}(양식)</h2></c:when>
                   <c:when test="${storeInfo.owBigTypeFk==5}"><h2>${storeInfo.owStoreName}(뷔페)</h2></c:when>
                   <c:when test="${storeInfo.owBigTypeFk==6}"><h2>${storeInfo.owStoreName}(디저트)</h2></c:when>
                   <c:when test="${storeInfo.owBigTypeFk==7}"><h2>${storeInfo.owStoreName}(술집)</h2></c:when>
                   <c:otherwise><h2>${storeInfo.owStoreName}(기타)</h2></c:otherwise>
                  
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
      				<c:when test="${storeInfo.store_enroll_rq_state eq '1'}">
    			    <form action="/storeYes.do">
     			    <input type="hidden" id="owStoreInfoPk" name="owStoreInfoPk" class="owStoreInfoPk" value="${storeInfo.owStoreInfoPk}"/>
      				<input type="submit" class="storeYesno" value="수락"/>
      				</form>
      				</c:when>
      				<c:otherwise>
     				<form action="/storeNo.do">
      				<input type="hidden" id="owStoreInfoPk" name="owStoreInfoPk" class="owStoreInfoPk" value="${storeInfo.owStoreInfoPk}"/>
      				<input type="submit" class="storeYesno" value="정지"/>
      				</form>
      				</c:otherwise>
      				</c:choose>
                   </div>
               </div>
           </div>
        </div>
</body>
	
</c:forEach> 
  <!-- 게시물 리스트 보여주기 -->
     <!-- 페이지 -->
  <div class="text-center marg-top" align="right">
<ul class="pagination" style="list-style:none;
    margin:0;
    padding:0;">
 
    <c:if test="${pageNaviData!=null}">
    	
					<div id="pagingNumber">
						<c:if test="${pageNaviData.startNavi!=1}">
							   <form action="/ownerStoreList.do" method="post">
                        <input type="hidden" value="<%=g.getNoticeNo() %>" name="owEntirePk"/>
								<input type="hidden"  name="currentPage" value="${pageNaviData.startNavi-1}"> 
								<input type="submit" class="paging-num" value="<">
							</form>
						</c:if>
						<c:forEach var="i" begin="${pageNaviData.startNavi}" end="${pageNaviData.endNavi}">
							<c:if test="${pageNaviData.currentPage==i}">
								<li>   <form action="/ownerStoreList.do" method="post">
                        <input type="hidden" value="<%=g.getNoticeNo() %>" name="owEntirePk"/>
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form></li>
							</c:if>
							<c:if test="${pageNaviData.currentPage!=i}">
								<li>   <form action="/ownerStoreList.do" method="post">
                        <input type="hidden" value="<%=g.getNoticeNo() %>" name="owEntirePk"/>
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageNaviData.endNavi!=pageNaviData.pageTotalCount}">
							<li>   <form action="/ownerStoreList.do" method="post">
                        <input type="hidden" value="<%=g.getNoticeNo() %>" name="owEntirePk"/>	
								<input type="hidden" name="currentPage"	value="${pageNaviData.endNavi+1}"> 
								<input type="submit"  class="paging-num"  value=">">
							</form><li>
						</c:if>
					</div>
			
				</c:if>
		
</ul>
</div>
<script>
function goPage(pages, lines) 
{
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
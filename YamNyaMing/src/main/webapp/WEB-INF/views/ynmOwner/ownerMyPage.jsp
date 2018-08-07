<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=4">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerInfo.js"></script>
</head>
<body>
	<header id="owner-main-header">
		<h1>
			<a href="/ownerMyPage.do">YamNyaMing 관리</a>
		</h1>
		<p>
			<a href="/storeEnrollOwner.do">입점 신청하기</a>
		</p>
		<p>
			${sessionScope.owner.owName} 님 (${sessionScope.owner.owId}) <a href="/ownerLogout.do">로그아웃</a>
		</p>
	</header>
	<nav id="owner-main-nav">
		<ul>
			<li><a href="/ownerInfo.do">정보 관리</a></li>
			<li><a href="/storeManage.do">음식점 관리</a></li>
			<li><a href="/reservationManage.do">예약 관리</a></li>
			<li><a href="/couponManage.do">쿠폰 관리</a></li>
			<li><a href="/boardOwner.do">게시판 관리</a></li>
			<li><a href="/analysisOwner.do">통계 관리</a></li>
		</ul>
	</nav>
	<section id="store-select-detail">
		<div>
			<c:if test="${storeTitleInfo!=null}">
				<c:forEach var="storeList" items="${storeTitleInfo}">
					<!-- 해당 가게의 정보를 아래에 뿌려줌 -->
					<form action="/storeInfoPage.do" method="post">
						<jsp:include page="storeTitleInfo.jsp">
							<jsp:param name="storeIndex" value="${storeList.owStoreInfoPk}"/>
						  	<jsp:param name="storeName" value="${storeList.owStoreName}"/>
						  	<jsp:param name="storeTip" value="${storeList.owStoreTip}"/>
						  	<jsp:param name="storeAbsRoute" value="${storeList.owPhotoRoute}"/>
						  	<jsp:param name="storePhoto" value="${storeList.owPhotoViewRoute}"/>
						  	<jsp:param name="storeStarPoint" value="${storeList.storeStarPoint}"/>
						  	<jsp:param name="contextRoute" value="${pageContext.request.contextPath}"/>
						</jsp:include>
						<input type="hidden" name="storeIndex" value="${storeList.owStoreInfoPk}">
						<input type="submit" value="가게 정보 확인하기">
					</form>
				</c:forEach>
			</c:if>
			<!-- 없을 때 -->
			<c:if test="${storeTitleInfo==null}">
				등록된 가게가 없습니다.
			</c:if>
			<hr style="clear:both;">
			페이징
			<c:if test="${pageNaviData!=null}">
				<div id="pagingNumber">
					<c:if test="${pageNaviData.startNavi!=1}">
						<form action="/couponManage.do" method="post">
							<input type="hidden"  name="currentPage" value="${pageNaviData.startNavi-1}"> 
							<input type="submit" class="paging-num" value="<">
						</form>
					</c:if>
					<c:forEach var="i" begin="${pageNaviData.startNavi}"
						end="${pageNaviData.endNavi}">
						<c:if test="${pageNaviData.currentPage==i}">
							<form action="/couponManage.do" method="post">
								<input type="hidden" name="currentPage" value="${i}"> 
								<input type="submit" class="paging-num-select" value="${i}">
							</form>
						</c:if>
						<c:if test="${pageNaviData.currentPage!=i}">
							<form action="/couponManage.do" method="post">
								<input type="hidden" name="currentPage" value="${i}"> 
								<input type="submit" class="paging-num" value="${i}">
							</form>
						</c:if>
					</c:forEach>
					<c:if test="${pageNaviData.endNavi!=pageNaviData.pageTotalCount}">
						<form action="/couponManage.do" method="post">
							<input type="hidden" name="currentPage"	value="${pageNaviData.endNavi+1}"> 
							<input type="submit"  class="paging-num"  value=">">
						</form>
					</c:if>
				</div>
			</c:if>
		</div>
	</section>
	<script>
		/* window.onload=function(){
			var storeDivArr = document.getElementsByClassName("store-info-div");
		var data = {"result":"success","menuExplain":"?? ??!","menuCate":"????","menuTitle":"????","menuCost":"7000","menuId":"1533176031706_1_????","storeIndex":5};
			console.log(data.result);
			for(var i = 0; i<storeDivArr.length;i++)
			{
				if(i=="${storeTapType}"){
					storeDivArr[i].style.display = "block";
				}
				else storeDivArr[i].style.display="none";
			}
			 menuChangeMode("menu_title_" + "${firstMenutitle}"); 
		} */
		
		
	</script>	
	<footer id="owner-main-footer">
		<h2>YamNyaMing</h2>
		<p>Immediately Reservation!</p>
		<address>
			㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
			주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018
			YamNyaMing Co. All rights reserved
		</address>
	</footer>
</body>
</html>
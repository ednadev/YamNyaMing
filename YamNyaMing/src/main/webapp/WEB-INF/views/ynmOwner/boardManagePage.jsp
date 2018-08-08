<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍-게시판 관리</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=4">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/storeTitleInfo.css?ver=4">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/boardManage.css?ver=5">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerInfo.js?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerBoard.js?ver=4"></script>

<!-- include jquery -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- include libraries BS3 -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" />
<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<!-- include summernote -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/summernote/summernote.css?ver=1">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/owner/summernote/summernote.js?ver=1"></script>

<style>
	#owner-section-board>div>h2 {
    clear: both;
    padding: 20px 10px 0px;
}
h2 {
    margin-left: 10%;
    margin-top: 20px;
    display: block;
    font-weight: bold;
}
#enrollStoreLink font{
	color:white;
}
button font{
	color:white;
}

.board-area{
	margin-left:7%;
	margin-right:7%;
}
footer font{
	color:white;
}
footer h2{
	margin-left:0%;
}

</style>
</head>
<body>
	<header id="owner-main-header">
		<a href="/index.jsp"><img src="${pageContext.request.contextPath}/resources/image/plate-white.png" style="width:44px;float:left;margin:10px;"></a>	
		<h1>
			<a href="/ownerMyPage.do">YamNyaMing 관리</a>
		</h1>
		<p>
			<a id="enrollStoreLink" href="/storeEnrollOwner.do" style="color:white !important;" >입점 신청하기</a>
		</p>
		<p>
			${sessionScope.owner.owName} 님 (${sessionScope.owner.owId}) <a href="/index.jsp">로그아웃</a>
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
			<c:if test="${fn:length(storeTitleInfo)>0}">
				<c:forEach var="storeList" items="${storeTitleInfo}">
					<!-- 해당 가게의 정보를 아래에 뿌려줌 -->
					<form action="/boardOwner.do" method="post" class="design-card">
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
						<input type="submit" value="${storeList.owStoreName}">
					</form>
				</c:forEach>
			</c:if>
			<!-- 없을 때 -->
			<c:if test="${fn:length(storeTitleInfo)==0}">
				등록된 가게가 없습니다.
			</c:if>
		</div>
		<c:if test="${currentBoardTap==0}">
			<div class="board-area">
				<div id="owner-section-board">
					<h2>공지사항</h2>
					<br>
					<div id="boardList">
						<table id="keywords" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th style="width:10%;"><center>NO</center></th>
									<th style="width:40%;"><center>공지 제목</center></th>
									<th style="width:20%;"><center>등록일</center></th>
									<th style="width:30%;"><center>보기</center></th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${boardListData!=null}">
								<c:forEach var="board" items="${boardListData}">
									<tr>
										<form action="/boardSelect.do" method="post">
											<input type="hidden" name="boardIndex" value="${board.owBoarInfoPk}">
											<td style="width:10%;">${board.owBoarInfoPk}</td>
											<td style="width:60%;">${board.owBoardTitle}</td>
											<td style="width:30%;">${board.owEnrollDate}</td>
											<td><input type="submit" value="공지 확인"/></td>
										</form>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<button id="submitBoardBtn" onclick="boardWrite();">글작성하기</button>
				</div>
			</div>
					<c:if test="${pageNaviData!=null}">
						<div id="pagingNumber">
							<c:if test="${pageNaviData.startNavi!=1}">
								<form action="/boardOwner.do" method="post">
									<input type="hidden"  name="currentPage" value="${pageNaviData.startNavi-1}"> 
									<input type="submit" class="paging-num" value="<">
								</form>
							</c:if>
							<c:forEach var="i" begin="${pageNaviData.startNavi}"
								end="${pageNaviData.endNavi}">
								<c:if test="${pageNaviData.currentPage==i}">
									<form action="/boardOwner.do" method="post">
										<input type="hidden" name="currentPage" value="${i}"> 
										<input type="submit" class="paging-num-select" value="${i}">
									</form>
								</c:if>
								<c:if test="${pageNaviData.currentPage!=i}">
									<form action="/boardOwner.do" method="post">
										<input type="hidden" name="currentPage" value="${i}"> 
										<input type="submit" class="paging-num" value="${i}">
									</form>
								</c:if>
							</c:forEach>
							<c:if test="${pageNaviData.endNavi!=pageNaviData.pageTotalCount}">
								<form action="/boardOwner.do" method="post">
									<input type="hidden" name="currentPage"	value="${pageNaviData.endNavi+1}"> 
									<input type="submit"  class="paging-num"  value=">">
								</form>
							</c:if>
						</div>
					</c:if>
			</div>
		</c:if>
		<c:if test="${currentBoardTap==1}">
			<div class="board-area">
				번호 : ${storeBoardData.owBoarInfoPk}<br>
				작성일 : ${storeBoardData.owEnrollDate}<br>
				제목 : ${storeBoardData.owBoardTitle}<br>
				내용 : ${storeBoardData.owBoardContent}<br>
			</div>
		</c:if>
		<hr>
		<div class="board-area" style="display:none;">
			<div id="toolbar"></div>
			<form id="summernote-form" action="/boardAdd.do" method="post" enctype="multipart/form-data">
				<h3 style="display:inline-block;">제목 :</h3> <input type="text" name="owBoardTitle" placeholder="공지사항 제목 입력">
				<textarea name="boardInfo" class="summernote" placeholder="공지글을 입력해주세요." value=""></textarea>
				
				<div style="display:block; height:60px;"><input id="submitBoardBtn" type="submit" value="공지글 제출"/></div>
			</form>
		</div>
	</section>
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
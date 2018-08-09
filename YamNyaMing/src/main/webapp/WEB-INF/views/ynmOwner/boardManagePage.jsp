<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍-게시판 관리</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=4">
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
	#owner-main-header>h1{
		padding:0;
		margin:0;
		margin-top:17px;
		font-weight:bold;
		font-size:1.6em;
	}
	#owner-main-header>p{
		font-size:1em;
	}
	#owner-main-header>p>a{
		color:black;
	}
	#owner-main-nav>ul>li>a{
		color:black;
		font-size:1.1em;
	}
	#owner-main-nav>ul>li>a:hover{
		color:black;
	}
	.panel-success{
		border-color:white;
	}
	.panel-success>.panel-heading{
		background-color:white;
	}
	.panel-success>.panel-heading>.row>.col-xs-12{
		width:218px;
	}
	.container-fluid>center>.panel-body>.table>thead>tr>th{
		text-align:center;
	}
	.text-center>.glyphicon{
		margin-right:15px;
	}
	.container-fluid>center>.panel-body>.table>tbody>tr>td{
		text-align:center;
	}
	.board-area>button{
		margin-left:20px;
		background-color:#555;
		border:none;
		padding:11px;
		color:white;
		border-radius:5px;
		margin-bottom:10px;
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
			<a href="/storeEnrollOwner.do">입점 신청하기</a>
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
			<li><a href="/boardOwner.do" style="border-bottom:3px solid #fb0;">게시판 관리</a></li>
			<li><a href="/analysisOwner.do">통계 관리</a></li>
		</ul>
	</nav>
	
	<c:if test="${currentBoardTap==0}">
		<div class="board-area">
				<c:if test="${boardListData!=null}">
					<c:forEach var="board" items="${boardListData}">
						<form action="/boardSelect.do" method="post">
							<input type="hidden" name="boardIndex" value="${board.owBoarInfoPk}">
							번호 : ${board.owBoarInfoPk} <br>
							제목 : ${board.owBoardTitle} <br>
							일시 : ${board.owEnrollDate} <br>
							<input type="submit" value="공지 확인"/>
						</form>
					</c:forEach>
				</c:if>
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
				<button onclick="boardWrite();">글작성하기</button>
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
	<div class="board-area">
		<div id="toolbar"></div>
		<form id="summernote-form" action="/boardAdd.do" method="post" enctype="multipart/form-data">
			제목 : <input type="text" name="owBoardTitle" placeholder="공지사항 제목 입력">
			<textarea name="boardInfo" class="summernote" placeholder="공지글을 입력해주세요." value=""></textarea>
			<input type="submit" value="공지글 제출"/>
		</form>
	</div>
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
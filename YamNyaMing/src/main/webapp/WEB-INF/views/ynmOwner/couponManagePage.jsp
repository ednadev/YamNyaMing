<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍-쿠폰관리</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=4">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owner/ownerCoupon.css?ver=1">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/owner/ownerCoupon.js?ver=4"></script>
	
<!-- DatePicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script>
 $(document).ready(function () {
	$.datepicker.regional['ko'] = {
	        closeText: '닫기',
	        prevText: '이전달',
	        nextText: '다음달',
	        currentText: '오늘',
	        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
	        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
	        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	        '7월','8월','9월','10월','11월','12월'],
	        dayNames: ['일','월','화','수','목','금','토'],
	        dayNamesShort: ['일','월','화','수','목','금','토'],
	        dayNamesMin: ['일','월','화','수','목','금','토'],
	        weekHeader: 'Wk',
	        dateFormat: 'yy-mm-dd',
	        firstDay: 0,
	        isRTL: false,
	        showMonthAfterYear: true,
	        yearSuffix: '',
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        yearRange: 'c-99:c+99',
	    };
	    $.datepicker.setDefaults($.datepicker.regional['ko']);
	 
	    $('#sdate').datepicker();
	    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
	    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#edate").datepicker( "option", "minDate", selectedDate );
	    });
	 
	    $('#edate').datepicker();
	    $('#edate').datepicker("option", "minDate", $("#sdate").val());
	    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#sdate").datepicker( "option", "maxDate", selectedDate );
	    });
	    
	    $('#sdateN').datepicker();
	    $('#sdateN').datepicker("option", "maxDate", $("#edateN").val());
	    $('#sdateN').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#edateN").datepicker( "option", "minDate", selectedDate );
	    });
	 
	    $('#edateN').datepicker();
	    $('#edateN').datepicker("option", "minDate", $("#sdateN").val());
	    $('#edateN').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#sdateN").datepicker( "option", "maxDate", selectedDate );
	    });
	 });
</script>
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
		${sessionScope.owner.owName} 님 (${sessionScope.owner.owId}) <a
			href="/index.jsp">로그아웃</a>
	</p>
	</header>
	<nav id="owner-main-nav">
	<ul>
		<li><a href="/ownerInfo.do">정보 관리</a></li>
		<li><a href="/storeManage.do">음식점 관리</a></li>
		<li><a href="/reservationManage.do">예약 관리</a></li>
		<li><a href="/couponManage.do" style="border-bottom:3px solid #fb0;">쿠폰 관리</a></li>
		<li><a href="/boardOwner.do">게시판 관리</a></li>
		<li><a href="/analysisOwner.do">통계 관리</a></li>
	</ul>
	</nav>
	<section id="owner-coupon-section">
	<div>
		<div id="coupon-enroll">
			<h2>쿠폰 등록</h2>
			<form action="/couponEnroll.do" method="post">
				<div class="signUp-table">
					<div>쿠폰 이름</div>
					<div>
						<input type="text" name="owCouponName" placeholder="쿠폰 이름"
							onkeydown="couponNameCheck();" onchange="couponNameCheck();">
						<p id="couponNameResult">쿠폰 이름을 입력해주세요</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>쿠폰 개수</div>
					<div>
						<input type="number" name="couponCount" min="-1"
							placeholder="쿠폰 개수(갯수 제한이 없으면 -1 입력)"
							onkeydown="couponCountCheck();" onchange="couponCountCheck();">
						<p id="couponCheckResult">쿠폰 개수를 입력해주세요</p>
					</div>
				</div>

				<div class="signUp-table">
					<div>쿠폰 유효기간</div>
					<div>
						<input type="text" name="couponStartDate" placeholder="시작날짜" id="sdate" onkeydown="dateCheck();" onchange="dateCheck();" style="width:23.5%;">
							 <span> - </span>
						<input	type="text" name="couponExpireDate" placeholder="종료날짜" id="edate" onkeydown="dateCheck();"  onchange="dateCheck();" style="width:23.5%;">
						<p id="dateResultCheck">쿠폰 유효기간을 입력해주세요</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>쿠폰 설명</div>
					<div>
						<textarea type="text" name="couponDetail" placeholder="쿠폰 상세 설명"></textarea>
						<p>쿠폰 설명을 입력해주세요</p>
					</div>
				</div>
				<div>
					<input type="hidden" id="couponStoreIndex" value="" />
					<button id="couponEnrollBtn" onclick="couponEnroll();">쿠폰
						등록</button>
				</div>
			</form>
		</div>

		<div id="owner-section-coupon">
			<h2>등록된 쿠폰</h2>
			<br>
			<div id="enrollCouponList">
				<table id="keywords" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th><span>NO</span></th>
							<th><span>쿠폰 이름</span></th>
							<th><span>남은 갯수</span></th>
							<th><span>쿠폰 기간</span></th>
							<th><span>상세 설명</span></th>
							<th><span>활성화상태</span></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${couponListData!=null}">
							<c:forEach var="coupon" items="${couponListData}">
								<tr>
									<td class="lalign">${coupon.owCouponInfoPk}
									<input type="hidden" id="couponIndexVal" name="couponIndex" value="${coupon.owCouponInfoPk}" >
									</td>
									<td>
										<span class="coupon_${coupon.owCouponInfoPk}">${coupon.owCouponName}</span>
										<input type="text" id="owCouponNameUpdate" class="coupon_edit_${coupon.owCouponInfoPk}" name="owCouponName" value="${coupon.owCouponName}" style="display:none;">
									</td>
									<td>
										<span class="coupon_${coupon.owCouponInfoPk}">
											<c:if test="${coupon.owCouponCount>=0}">
												${coupon.owCouponCount}
											</c:if>
											<c:if test="${coupon.owCouponCount==-1}">
												제한없음
											</c:if>
										</span>
										<input type="text" class="coupon_edit_${coupon.owCouponInfoPk}" id="couponCountUpdate" name="couponCount" value="${coupon.owCouponCount}" style="display:none; height:35px;">
									</td>
									<td>
										<span class="coupon_${coupon.owCouponInfoPk}"> ${coupon.owCouponDuringDate} </span>
										<input type="text" class="coupon_edit_${coupon.owCouponInfoPk}" readonly name="couponStartDate" value="${coupon.owCouponStartDate}" placeholder="${coupon.owCouponStartDate}" id="sdateN" onkeydown="dateCheck();" onchange="dateCheck();" style="width:30%; height:35px; display:none;">
				
										<input type="text" class="coupon_edit_${coupon.owCouponInfoPk}" readonly name="couponExpireDate" value="${coupon.owCouponExpireDate}" placeholder="${coupon.owCouponExpireDate}" id="edateN" onkeydown="dateCheck();" onchange="dateCheck();" style="width:30%; height:35px; display:none;">
									</td>
									<td>
										<span class="coupon_${coupon.owCouponInfoPk}">${coupon.owCouponDetail}</span>
										<input type="text" id="couponDetailUpdate" class="coupon_edit_${coupon.owCouponInfoPk}" name="menuCost" value="${coupon.owCouponDetail}" style="display:none; height:35px;">
									</td>
									<td>
										<button id="couponDelBtn" class="coupon_${coupon.owCouponInfoPk}" onclick="couponChange('coupon_${coupon.owCouponInfoPk}','coupon_edit_${coupon.owCouponInfoPk}');">수정</button>
										<button id="couponDelBtn" class="coupon_${coupon.owCouponInfoPk}" onclick="couponDel();">삭제</button>
										<button id="couponDelBtn" class="coupon_edit_${coupon.owCouponInfoPk}" onclick="couponUpdate();" style="display:none;">변경</button>
										<button id="couponDelBtn" class="coupon_edit_${coupon.owCouponInfoPk}" onclick="couponChange('coupon_edit_${coupon.owCouponInfoPk}','coupon_${coupon.owCouponInfoPk}');" style="display:none; ">취소</button>
									</td>
								</tr>
							</c:forEach>
						</c:if>

					</tbody>
				</table>
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
		</div>
	</div>
	</section>
	<footer id="owner-main-footer">
	<h2>YamNyaMing</h2>
	<p>Immediately Reservation!</p>
	<address>
		㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
		주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018 YamNyaMing
		Co. All rights reserved
	</address>
	</footer>
</body>
</html>
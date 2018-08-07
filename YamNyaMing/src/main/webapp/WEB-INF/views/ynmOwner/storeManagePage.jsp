<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍-가게 관리</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=4">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/storeTitleInfo.css?ver=2">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/storeManage.css?ver=4">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerInfo.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerCategory.js?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerStoreAdd.js?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerMenuManage.js?ver=6"></script>
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
			<li><a href="/storeManage.do" style="border-bottom:3px solid #fb0;">음식점 관리</a></li>
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
					<form action="/storeInfoPage.do" method="post" class="main-card">
						<input type="submit" value="${storeList.owStoreName}">
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
					</form>
				</c:forEach>
			</c:if>
			<!-- 없을 때 -->
			<c:if test="${storeTitleInfo==null}">
				등록된 가게가 없습니다.
			</c:if>



		</div>
		
		<div id="storeInfo">
		<h2>가게 정보</h2>
		<div>
			 <form action="/storePageTypeLoad.do" method="post" class="store-form">
				<!-- 현재 선택된  -->
				<input type="submit" name="storeTapType" value="정보">
				<input type="submit" name="storeTapType" value="포토">
				<input type="submit" name="storeTapType" value="리뷰">
				<input type="submit" name="storeTapType" value="메뉴">
				<input type="submit" name="storeTapType" value="지도">
			</form>
		</div>
		
		<hr style="clear:both;margin-bottom:10px;">

		
		<div class="store-info-div" style="display:block;">
			<form action="/storeInfoEdit.do" method="post">
				
				<!-- name은 바꾸면 안됨 -->
				
				<span>가게 이름 :</span><p id="owStorePId" style="display:inline;"> ${storeInfoPageData.owStoreName}</p>
				<input type="text" style="display:none;" id="owStoreNameEditBtn" name="owStoreName" value="${storeInfoPageData.owStoreName}">
				<button type="button" onclick="editShow(owStorePId,owStoreNameEditBtn);">수정</button>
				<br>
				
				<span>별점 : </span>${storeInfoPageData.storeStarPoint} <br>
				
				<span>전화번호 :</span>  <p id="owStoreTelPId" style="display:inline;">${storeInfoPageData.owStoreTel}</p>
				<input type="text" style="display:none;" id="owStoreTelEditBtn" name="owStoreTel" value="${storeInfoPageData.owStoreTel}">
				<button type="button" onclick="editShow(owStoreTelPId,owStoreTelEditBtn);">수정</button>
				<br>
				
				<span>주소 :</span>  <p id="owStoreAddrPId" style="display:inline;">${storeInfoPageData.owStoreAddr}</p> 
				<input type="text" style="display:none;" id="owStoreAddrEditBtn" name="owStoreAddr" value="${storeInfoPageData.owStoreAddr}">
				<button type="button" onclick="editShow(owStoreAddrPId,owStoreAddrEditBtn);">수정</button>
				<br>
				
				<span>웹사이트 : </span><p id="owStoreUrlPId" style="display:inline;">${storeInfoPageData.owStoreUrl}</p> 
				<input type="text" style="display:none;" id="owStoreUrlEditBtn" name="owStoreUrl" value="${storeInfoPageData.owStoreUrl}">
				<button type="button" onclick="editShow(owStoreUrlPId,owStoreUrlEditBtn);">수정</button>
				<br>
				
				<span>영업시간 :</span>  <p id="owStoreWorkingPId" style="display:inline;">${storeInfoPageData.owStoreWorkingTime}</p>
				<input type="text" style="display:none;" id="owStoreWorkingEditBtn" name="owStoreWorkingTime" value="${storeInfoPageData.owStoreWorkingTime}">
				<button type="button" onclick="editShow(owStoreWorkingPId,owStoreWorkingEditBtn);">수정</button>
				<br>
				
				<span>예산 :</span>   <p id="owStoreBudgetPId" style="display:inline;">${storeInfoPageData.budgetInfo}</p>
				<input type="text" style="display:none;" id="owStoreBudgetEditBtn" name="budgetInfo" value="${storeInfoPageData.budgetInfo}">
				<button type="button" onclick="editShow(owStoreBudgetPId,owStoreBudgetEditBtn);">수정</button>
				<br>
				
				<br>
				
				<span>한줄설명 : </span><p id="owStoreCommentPId" style="display:inline;">${storeInfoPageData.owStoreLineComment}</p>
				<input type="text" style="display:none;" id="owStoreCommentEditBtn" name="owStoreLineComment" value="${storeInfoPageData.owStoreLineComment}">
				<button type="button" onclick="editShow(owStoreCommentPId,owStoreCommentEditBtn);">수정</button>
				<br>
				
				<span>팁 : </span> <p id="owStoreTipPId" style="display:inline;">${storeInfoPageData.owStoreTip}</p>
				<input type="text" style="display:none;" id="owStoreTipEditBtn" name="owStoreTip" value="${storeInfoPageData.owStoreTip}">
				<button type="button" onclick="editShow(owStoreTipPId,owStoreTipEditBtn);">수정</button>
				<br>
				
				<span>음식 종류 : </span><p id="owStoreTypePId" style="display:inline;">${storeInfoPageData.owBigTypeFk}/${storeInfoPageData.owSmallTypeFk}</p>
					<div id="owStoreTypeEditSelect" style="display:none;">
						<select name="owBigTypeFk" id="firstSelect" onchange="changeSelect()">
							<option>대분류</option>
						</select>
						<select name="owSmallTypeFk" id="finalSelect">
							<option>소분류</option>
						</select>
					</div>
				<button type="button" onclick="editShow(owStoreTypePId,owStoreTypeEditSelect);">수정</button>
				<br>
				
				<span>추천메뉴 :</span> <p id="owStoreRecommandPId" style="display:inline;">${storeInfoPageData.recommandMenu}</p>
				<input type="text" style="display:none;" id="owStoreRecommandEditBtn" name="recommandMenu" value="${storeInfoPageData.recommandMenu}">
				<button type="button" onclick="editShow(owStoreRecommandPId,owStoreRecommandEditBtn);">수정</button>
				<br>
				
				<span>테이블 : </span><p id="owStoreTablePId" style="display:inline;">${storeInfoPageData.storeTableInfo}</p>
				<input type="text" style="display:none;" id="owStoreTableEditBtn" name="storeTableInfo" value="${storeInfoPageData.owStoreLineComment}">
				<button type="button" onclick="editShow(owStoreTablePId,owStoreTableEditBtn);">수정</button>
				<br>
				
				<span>부가정보 :</span> <p id="owStoreSubInfoPId" style="display:inline;">${storeInfoPageData.owSubInfo}</p>
				<input type="text" style="display:none;" id="owStoreSubInfoEditBtn" name="owSubInfo" value="${storeInfoPageData.owStoreLineComment}">
				<button type="button" onclick="editShow(owStoreSubInfoPId,owStoreSubInfoEditBtn);">수정</button>
				<br>
				
				<span>판매주류 :</span> <p id="owStoreDrinkInfoPId" style="display:inline;">${storeInfoPageData.owDrinkListInfo}</p>
				<input type="text" style="display:none;" id="owStoreDrinkInfoEditBtn" name="owDrinkListInfo" value="${storeInfoPageData.owStoreLineComment}">
				<button type="button" onclick="editShow(owStoreDrinkInfoPId,owStoreDrinkInfoEditBtn);">수정</button>
				<br>
				<span>최근 예약 히스토리 : </span><br>		
				<input type="submit" value="가게 정보 업데이트">
			</form>
		</div>
		<div class="store-info-div" style="display:none;">
			<h3>이미지를  클릭해서 삭제 할 수 있습니다.</h3>
			<!-- <form action="/storeHeadPhotoEdit.do" method="post"> -->
			<c:if test="${headPhotoList!=null}">
				<c:forEach var="headPhoto" items="${headPhotoList}">
					<input type="hidden" id="${headPhoto.owStorePhotoPk}_route" value="${headPhoto.photoRoute}">
					<input type="hidden" id="${headPhoto.owStorePhotoPk}_name" value="${headPhoto.remakeName}">
					<input type="hidden" id="${headPhoto.owStorePhotoPk}_detailPk" value="${headPhoto.storeDetailPk}">
					<input type="hidden" id="${headPhoto.owStorePhotoPk}_headList" value="${headPhoto.headStoreList}">
					<img src="${headPhoto.owPhotoViewRoute}" id="${headPhoto.owStorePhotoPk}"
					onclick='deleteHeadPhoto(${headPhoto.owStorePhotoPk});' 
					style="width:200px; height:200px;margin-left:15px;" />
				</c:forEach>
			</c:if>
			<c:if test="${headPhotoList==null}">
				대표사진이 없습니다.
			</c:if>
			<form action="/storeHeadPhotoUpload.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="storeTapType" value="정보">
				<div id="menuType">
					<input type="file" name="mainImgFile" id="mainImage" accept="${pageContext.request.contextPath}/resources/image/*" onchange="reviewFilesUpload();" multiple/>
					<label for="mainImage">이미지 추가</label>
					<div>
						<div class="imgs_wrap">
							<img id="img"/>
						</div>
					</div>
					<img id="output"/>
					<p style="font-size:0.9em;font-weight:bold;">업체를 대표하는 이미지를 추가해주세요.</p>
				</div>
				<input type="submit" value="대표사진 등록">
			</form>
		</div>
		<div class="store-info-div" style="display:none;">
			리뷰
		</div>
		<div class="store-info-div" style="display:none;">
			<div id="enrollMenuList">
				<c:if test="${menuInfoList!=null}">
					<c:forEach var="menuTitle" items="${menuTitleGroup}" varStatus="status">
						<c:choose>
							<c:when test="${status.index eq 0}">
								<div class="menuTitleBtn" onclick="menuChangeMode('menu_title_${menuTitle}', this);"> ${menuTitle} </div>
							</c:when>
							<c:otherwise>
								<div class="menuTitleBtn-none" onclick="menuChangeMode('menu_title_${menuTitle}', this);"> ${menuTitle} </div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:forEach var="menu" items="${menuInfoList}">
						<div class="menuTapClass" id="menu_title_${menu.menuTitle}" name=menu_title_${menu.owMenuInfoPk}">
							<input type="hidden" name="menuIndex" value="${menu.owMenuInfoPk}">
							메뉴 이름 :<span class="menu_${menu.owMenuInfoPk}"> ${menu.subTitle} </span>
							<input type="text" class="menu_edit_${menu.owMenuInfoPk}" name="menuTitle" value="${menu.subTitle}" style="display:none;"> <br>
							
							메뉴 설명 : <span class="menu_${menu.owMenuInfoPk}" > ${menu.explain}  </span> 
							<input type="text" class="menu_edit_${menu.owMenuInfoPk}" name="menuExplain" value="${menu.explain}" style="display:none;"> <br>
							
							메뉴 가격 : <span class="menu_${menu.owMenuInfoPk}" > ${menu.menuCost} </span> 
							<input type="text" class="menu_edit_${menu.owMenuInfoPk}" name="menuCost" value="${menu.menuCost}" style="display:none;"><br>
							
							<button type="button" id="menu_${menu.owMenuInfoPk}" class="menu_${menu.owMenuInfoPk}" onclick="menuEditMode('menu_${menu.owMenuInfoPk}','menu_edit_${menu.owMenuInfoPk}')" >메뉴 수정</button>
							<button type="button" id="menu_${menu.owMenuInfoPk}" class="menu_${menu.owMenuInfoPk}" onclick="menuTextDelete('menu_title_${menu.owMenuInfoPk}', '${menu.owMenuInfoPk}')">메뉴 삭제</button>
							<button type="button" id="menu_edit_${menu.owMenuInfoPk}" class="menu_edit_${menu.owMenuInfoPk}" onclick="textMenuUpdate('${menu.owMenuInfoPk}','menu_edit_${menu.owMenuInfoPk}');" style="display:none;">수정 완료</button>
							<button type="button" id="menu_${menu.owMenuInfoPk}" class="menu_edit_${menu.owMenuInfoPk}" onclick="menuEditMode('menu_edit_${menu.owMenuInfoPk}','menu_${menu.owMenuInfoPk}')" style="display:none;">취소</button>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<c:if test="${menuPhotoList!=null}">
				<c:forEach var="menuPhoto" items="${menuPhotoList}">
					<input type="hidden" id="${menuPhoto.owStorePhotoPk}_route" value="${menuPhoto.photoRoute}">
					<input type="hidden" id="${menuPhoto.owStorePhotoPk}_name" value="${menuPhoto.remakeName}">
					<input type="hidden" id="${menuPhoto.owStorePhotoPk}_detailPk" value="${menuPhoto.storeDetailPk}">
					<input type="hidden" id="${menuPhoto.owStorePhotoPk}_headList" value="${menuPhoto.headStoreList}">
					<img src="${menuPhoto.owPhotoViewRoute}" id="${menuPhoto.owStorePhotoPk}"
					onclick='deleteHeadPhoto(${menuPhoto.owStorePhotoPk});' 
					style="width:200px; height:200px;" />
				</c:forEach>
			</c:if>
			<c:if test="${menuInfoData.menuType==1}">
				<!-- 사진만 등록 -->
				<div class="menuInfo">  
					<form action="/storeMenuPhotoUpload.do" method="post" enctype="multipart/form-data">
						<div>
							<input type="file" name="menuImageFile" id="menuImage" accept="${pageContext.request.contextPath}/resources/image/*" onchange="reviewFilesUpload();" multiple/>
							<label for="menuImage" id="menu-image">사진등록/편집</label>
								<div class="imgs_wrap_menu">
									<img id="img"/>
								</div>
							<img id="output"/>
							<input type="submit" value="메뉴사진 등록">
						</div> 
					</form>	
				</div>
			</c:if>
			<c:if test="${menuInfoData.menuType==2}">
				<!-- 글씨만 등록 -->
				<div id="menuPriceInfo">
					<div class="menuInfo">
						<select class="menuCategory">
							<option>분류 항목 </option>
							<c:forEach var="menuTitle" items="${menuTitleGroup}">
								<option value="${menuTitle}"> ${menuTitle} </option>
							</c:forEach>
						</select>
						<input type="text" name="owMenuType" placeholder="예)식사,요리,스페셜" class="menuStyle">
						<label class="menuCateBtn" id="addMenuCateBtn" onclick="addMenuCategory();">추가</label>
						<label class="menuCateBtn" id="removeMenuCateBtn" onclick="removeMenuCategory();">삭제</label>
					</div>
					<div class="menuInfo" id="menu-info-text">
						<select id="menuCategoryTitle" class="menuCategory">
							<option>분류 항목 </option>
							<c:forEach var="menuTitle" items="${menuTitleGroup}">
								<option value="${menuTitle}"> ${menuTitle} </option>
							</c:forEach>
						</select>
						<br>
						<input type="text" id="owRecommandMenu" placeholder="예) 꽃등심" class="menuStyle">
						<input type="text" id="owRecommandMenuPrice" placeholder="예) 30,000" class="priceStyle"><span> 원</span>
						<label for="menuDesc" class="detailStyle">메뉴 상세 설명 (최대 100자)</label>
						<textarea id="menuDesc" placeholder="예) 고유의 숙성방식으로 육즙과 풍미를 이끌어낸 등심과 안심"></textarea>
						<br>
						<button id="storeIndex" onclick="newMenuAdd(${sessonScope.currentStoreIndex});">메뉴 추가</button>
					</div>
				</div>
			</c:if>
			
			
		</div>
		<div class="store-info-div" style="display:none;">
			맵
		</div>	
		</div>	
	</section>
	<script>
		window.onload=function(){
			var storeDivArr = document.getElementsByClassName("store-info-div");
		/* 	var data = {"result":"success","menuExplain":"?? ??!","menuCate":"????","menuTitle":"????","menuCost":"7000","menuId":"1533176031706_1_????","storeIndex":5};
			console.log(data.result); */
			for(var i = 0; i<storeDivArr.length;i++)
			{
				if(i=="${storeTapType}"){
					storeDivArr[i].style.display = "block";
				}
				else storeDivArr[i].style.display="none";
			}
			menuChangeMode("menu_title_${firstMenutitle}");
		}
		
		
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
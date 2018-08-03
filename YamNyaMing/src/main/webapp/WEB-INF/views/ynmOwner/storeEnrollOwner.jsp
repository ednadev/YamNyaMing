<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/owner.css?ver=3">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner/datePickerCss.css?ver=3">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerCategory.js?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerStoreAdd.js?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/ownerCheckPrice.js?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/datePickerbasic.js?ver=1"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner/odatePickerUi.js?ver=1"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

</head>
<body>
	<header id="owner-signUp-header">
		<h1><a href="/index.jsp">YamNyamCompany</a></h1>
	</header>
	<div class="wrapper">
		<nav id="owner-signUp-nav">
			<h2>입점 신청하기</h2>
		</nav>
		<form id="fileForm" action="/ownerAddStore.do" enctype="multipart/form-data" method="post">
			<section id="owner-signUp-section">	
				<h3>음식점 정보 입력</h3>	
				<div class="signUp-table">
					<div>사업자 등록번호</div>
					<div>
						<input type="text" name="owStoreBizNum" placeholder="사업자 등록번호"/> <!-- onkeydown="owStoreBizCheck();" onchange="owStoreBizCheck();"> -->
						<p id="owStoreBizNumResult">사업자 등록번호를 입력해주세요.</p>
					</div>
				</div>	
				<div class="signUp-table">
					<div>상호명</div>
					<div>
						<input type="text" name="owStoreName" placeholder="상호명" onkeydown="owStoreNameCheck();" onchange="owStoreNameCheck();">
						<p id="owStoreNameResult">상호명을 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>전화번호</div>
					<div>
						<select name="regionTel" onchange="telCheck();">
						    <option value="02">02</option>
						    <option value="051">051</option>
						    <option value="053">053</option>
						    <option value="032">032</option>
						    <option value="062">062</option>
						    <option value="042">042</option>
						    <option value="052">052</option>
						    <option value="044">044</option>
						    <option value="031">031</option>
						    <option value="033">033</option>
						    <option value="041">041</option>
						    <option value="043">043</option>
						    <option value="061">061</option>
						    <option value="063">063</option>
						    <option value="054">054</option>
						    <option value="055">055</option>
						    <option value="064">064</option>
						</select>
						<input type="tel" name="owTel" placeholder="전화번호" onkeydown="telCheck();" onchange="telCheck();">
						<p id="owStoreTel">연락 가능한 전화번호를 입력해주세요.</p>
					</div>
				</div>
	<!-- 			<div class="signUp-table">
					<div>휴대폰</div>
					<div>
						<input type="tel" name="owPhone" placeholder="휴대폰">
						<p>연락 가능한 휴대폰 번호를 입력해주세요.</p>
					</div>
				</div>	 -->
				<div class="signUp-table">
					<div>업종</div>
					<div>
						<select name="owStoreBigType" id="firstSelect" onchange="changeSelect()">
							<option>대분류</option>
						</select>
						<select name="owStoreSmallType" id="finalSelect">
							<option>소분류</option>
						</select>
					</div>
				</div>				
				<div class="signUp-table">
					<div>웹사이트</div>
					<div>
						<input type="url" name="owStoreUrl" placeholder="웹사이트">
						<p>웹사이트를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>주소</div>
					<div>					
					<input type="text" id="storePostCode" name="postNum" placeholder="우편번호 (클릭하면 주소를 검색 할 수 있습니다.)" onclick="storeAddress();">
					<input type="text" id="storeRoadAddr" name="addrStreet" placeholder="도로명주소">
					<input type="hidden" id="storeJibunAddr" name="addrState" placeholder="지번주소">
					<input type="text" id="storeRoadAddr" name="detailAddr" placeholder="상세주소">
					<span id="guide" style="color:#999"></span>
					<p id="addressOwner">주소를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>영업시간</div>
					<div id="timeStyle">
						<select name="workingWeek">
							<option value="매일">매일</option>
							<option value="평일">평일</option>
							<option value="주말">주말</option>
							<option value="월">월요일</option>
							<option value="화">화요일</option>
							<option value="수">수요일</option>
							<option value="목">목요일</option>
							<option value="금">금요일</option>
							<option value="토">토요일</option>
							<option value="일">일요일</option>
						</select>
						
						<input type="time" name="owStoreWorkingTimeStart" >
						<span> - </span>
						<input type="time" name="owStoreWorkingTimeEnd">
						<input type="text" name="extWorkingOption" placeholder="예) 화요일 휴무">
						<p>주요 영업시간을 입력해주세요. 예외는 기타 사항에 입력해주세요.</p>
					</div>
				</div>	
				<h3>상세 정보 입력</h3>
				<div class="signUp-table">
					<div>가게 한줄평</div>
					<div>
						<input type="text" name="owStoreLineComment" class="keywordStyle" style="width:50%;">
						<p id="tipResult">(가게를 소개할 한줄 코멘트를 적어주세요.)</p>
					</div>
				</div>	
				<div class="signUp-table">
					<div>대표 키워드</div>
					<div>
						<input type="text" name="owStoreTip" class="keywordStyle">
						<input type="text" name="owStoreTip" class="keywordStyle">
						<input type="text" name="owStoreTip" class="keywordStyle">
						<input type="text" name="owStoreTip" class="keywordStyle">
						<input type="text" name="owStoreTip" class="keywordStyle">
						<p id="tipResult">업체를 대표하는 메뉴명, 서비스명, 상품명 등을 입력하세요. (최대 5개까지 가능)</p>
					</div>
				</div>	
				<div class="signUp-table">
					<div>대표 이미지</div>
					<div id="menuType">
						<input type="file" name="mainImgFile" id="mainImage" accept="${pageContext.request.contextPath}/resources/image/*" onchange="reviewFilesUpload();" multiple/>
						<label for="mainImage">이미지 추가</label>
						<div>
							<div class="imgs_wrap">
								<img id="img"/>
							</div>
						</div>
						<img id="output"/>
						<p>업체를 대표하는 이미지를 추가해주세요.</p>
					</div>
				</div>							
				<div class="signUp-table">
					<div>메뉴 정보</div>
					<div id="menuPriceInfo">
						<div id="menuType"  style="margin-top: 10px;">
							<label id="menu-info-type-click" class="menu-type" onclick="menuTypeChange(this);">메뉴 사진으로 등록</label>
							<label id="menu-info-type" class="menu-type" onclick="menuTypeChange(this);">메뉴 직접 입력</label>
						</div>
						<!-- 사진만 등록 -->
						<div class="menuInfo">  
							<div>
							<input type="file" name="menuImageFile" id="menuImage" accept="${pageContext.request.contextPath}/resources/image/*" onchange="reviewFilesUpload();" multiple/>
							<label for="menuImage" id="menu-image">사진등록/편집</label>
								<div class="imgs_wrap_menu">
									<img id="img"/>
								</div>
							<img id="output"/>
							</div> 	
						</div>
						<!-- 글씨만 등록 -->
						<div class="menuInfo" style="display:none;">
							<select class="menuCategory">
								<option>분류 항목 </option>
							</select>
							<input type="text" name="owMenuType" placeholder="예)식사,요리,스페셜" class="menuStyle">
							<label class="menuCateBtn" id="addMenuCateBtn" onclick="addMenuCategory();">추가</label>
							<label class="menuCateBtn" id="removeMenuCateBtn" onclick="removeMenuCategory();">삭제</label>
						</div>
						<div class="menuInfo" id="menu-info-text" style="display:none;">
							<select name="menuCategoryTitle" class="menuCategory">
								<option>분류 항목 </option>
							</select>
							<br>
							<input type="text" name="owRecommandMenu" placeholder="예) 꽃등심" class="menuStyle">
							<input type="text" name="owRecommandMenuPrice" placeholder="예) 30,000" class="priceStyle"><span> 원</span>
							<label class="checkStyle"><input type="checkbox" id="checkPrice"> 변동가격</label>
							<label><input type="checkbox"> 추천메뉴</label>
							<label for="menuDesc" class="detailStyle">메뉴 상세 설명 (최대 100자)</label>
							<textarea id="menuDesc" name="owMenuExplain" placeholder="예) 고유의 숙성방식으로 육즙과 풍미를 이끌어낸 등심과 안심"></textarea>
							<button id="addButton" type="button" onclick="menuInfoAdd();">추가</button>
						</div>
					</div>
				</div>
				<div class="signUp-table">
					<div>가게 추천 메뉴</div>
					<div>
						<input type="text" name="owStoreRecommandMenuList" placeholder="추천메뉴">
					</div>
				</div>					
				<div class="signUp-table">
					<div>테이블 정보</div>
					<div>
						<input type="text" name="owStoreTableInfo" placeholder="테이블 정보 입력 (최대 인원)">
					</div>
				</div>	
				<div class="signUp-table">
					<div>예산 정보</div>
					<div>
						<input type="text" name="owBudget" placeholder="예산 정보 입력">
					</div>
				</div>	
				<div class="signUp-table">
					<div>부가 정보</div>
					<div>
						<input type="text" name="owSubInfo" placeholder="부가 정보 입력 (ex. 아이동반 가능여부, 연장영업, 기타 정보사항 )">
					</div>
				</div>	
				<div class="signUp-table">
					<div>주류 정보</div>
					<div>
						<input type="text" name="owDrinkListInfo" placeholder="주류 정보 입력">
					</div>
				</div>																																																										
			</section>
			<input type="hidden" id="storeMenuTypeId" name="storeMenuType" value="1" />
			<input type="submit" value="입점 신청하기">
		</form>
	</div>
	<footer id="owner-signUp-footer">
		<div>
			<h2>YamNyaMing</h2>
			<p>Immediately Reservation!</p>
			<address>㈜ 얌냠컴퍼니 대표: 김미경 | 번호: 010-9612-0530 | 이메일: minimelodi@naver.com<br>
			주소: 서울특별시 영등포구 선유동2로 57 이레빌딩 19층 KH정보교육원 | Copyright ⓒ 2018 YamNyaMing Co. All rights reserved</address>
		</div>
	</footer>
	
	<script>
	function menuInfoAdd(){
		var menuInfo = "";
		menuInfo = menuInfo + "<div class='menuInfo' id='menu-info-text'>"+
		            $('#menu-info-text').html()+"<button id='delButton' type='button' onclick='menuInfoDel();'>삭제</button></div>";
		$('#menuPriceInfo').append(menuInfo);
	}
	function menuInfoDel(){
		$('.menuInfo:last').remove();
	}
	function addMenuCategory()
	{
		if($('input[name=owMenuType]').val().length>0)
		{
			var menuSelect = document.getElementsByClassName("menuCategory");
			//menuSelectMain.add(option);
			for(var i = 0; i<menuSelect.length;i++){
				var option = document.createElement("option");
				if(i==0||i==menuSelect.length-1)option.selected = true;
				option.value =  $('input[name=owMenuType]').val();
				option.text = $('input[name=owMenuType]').val();
				menuSelect[i].add(option);
			} 
		}
		else
		{
			alert("메뉴 항목을 입력해주세요.");
		}
		
		$('input[name=owMenuType]').val("");
	}
	function removeMenuCategory()
	{
		var menuSelect = document.getElementsByClassName("menuCategory");
		for(var i = 0; i<menuSelect.length;i++){
			if(menuSelect[i].length>1){
				menuSelect[i].remove(menuSelect[i].selectedIndex);
			}
		}
	}
	</script>
</body>
</html>
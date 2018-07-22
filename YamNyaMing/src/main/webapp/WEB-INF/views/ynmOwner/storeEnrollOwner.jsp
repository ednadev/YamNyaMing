<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owner.css?ver=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owner.js?ver=1"></script>
</head>
<body>
	<header id="owner-signUp-header">
		<h1><a href="/index.jsp">YamNyamCompany</a></h1>
	</header>
	<div class="wrapper">
		<nav id="owner-signUp-nav">
			<h2>입점 신청하기</h2>
		</nav>
		<form action="storeJoinOwner.do" method="post">
			<section id="owner-signUp-section">	
				<h3>음식점 정보 입력</h3>	
				<div class="signUp-table">
					<div>사업자 등록번호</div>
					<div>
						<input type="text" name="owStoreBizNum" placeholder="사업자 등록번호">
						<p>사업자 등록번호를 입력해주세요.</p>
					</div>
				</div>	
				<div class="signUp-table">
					<div>상호명</div>
					<div>
						<input type="text" name="owStoreName" placeholder="상호명">
						<p>상호명을 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>전화번호</div>
					<div>
						<input type="tel" name="owTel" placeholder="전화번호">
						<p>연락 가능한 전화번호를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>휴대폰</div>
					<div>
						<input type="tel" name="owPhone" placeholder="휴대폰">
						<p>연락 가능한 휴대폰 번호를 입력해주세요.</p>
					</div>
				</div>	
				<div class="signUp-table">
					<div>업종</div>
					<div>
						<select name="owStoreBigType" id="firstSelect" onchange="changeSelect()">
							<option disabled selected>대분류</option>
						</select>
						<select name="owStoreSmallType" id="finalSelect">
							<option disabled selected>소분류</option>
						</select>
					</div>
				</div>				
				<div class="signUp-table">
					<div>웹사이트</div>
					<div>
						<input type="url" name="owStoreUrl" placeholder="http://">
						<p>웹사이트를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>주소</div>
					<div>
						<input type="text" name="owStoreMapinfo" placeholder="주소">
						<p>주소를 입력해주세요.</p>
					</div>
				</div>
				<div class="signUp-table">
					<div>영업시간</div>
					<div>
						<input type="text" name="owStoreWorkingTime" placeholder="ex. 매일  11:30 - 20:00 빵소진시까지  / 일요일, 공휴일 휴무">
						<p>영업시간을 입력해주세요.</p>
					</div>					
				</div>	
				<h3>상세 정보 입력</h3>	
				<div class="signUp-table">
					<div>대표 키워드</div>
					<div>
						<input type="text" name="owStoreTip" class="keywordStyle">
						<input type="text" name="owStoreTip" class="keywordStyle">
						<input type="text" name="owStoreTip" class="keywordStyle">
						<input type="text" name="owStoreTip" class="keywordStyle">
						<input type="text" name="owStoreTip" class="keywordStyle">
						<p>업체를 대표하는 메뉴명, 서비스명, 상품명 등을 입력하세요. (최대 5개까지 가능)</p>
					</div>
				</div>	
				<div class="signUp-table">
					<div>대표 이미지</div>
					<div>
						<input type="file" id="mainImage" accept="${pageContext.request.contextPath}/resources/image/*" onchange="loadFile(event)">
						<label for="mainImage">이미지 추가</label>
						<img id="output"/>
						<p>업체를 대표하는 이미지를 추가해주세요.</p>
					</div>
				</div>			
				<script>
					var loadFile = function(event){
						var output = document.getElementById('output');
						output.src = URL.createObjectURL(event.target.files[0]);
					};
				</script>				
				<div class="signUp-table">
					<div>가격 정보</div>
					<div id="menuPriceInfo">
						<div class="menuInfo">
							<input type="text" name="owRecommandMenu" placeholder="ex. 꽃등심" class="menuStyle">
							<input type="text" name="owRecommandMenuPrice" placeholder="ex. 30,000" class="priceStyle"><span> 원</span>
							<label class="checkStyle"><input type="checkbox" id="checkPrice"> 변동가격</label>
							<label><input type="checkbox"> 추천메뉴</label>
							<label for="menuDesc" class="detailStyle">메뉴 상세 설명 (최대 100자)</label>
							<textarea id="menuDesc" placeholder="ex. 고유의 숙성방식으로 육즙과 풍미를 이끌어낸 등심과 안심"></textarea>
							<label for="menu-file" id="menu-file-text">사진등록/편집</label>
							<input type="file" name="owRecommandMenuFile" id="menu-file">
							<button id="addButton" type="button" onclick="menuInfoAdd();">추가</button>
						</div>
					</div>
				</div>				
				<div class="signUp-table">
					<div>테이블 정보</div>
					<div>
						<input type="text" name="owStoreTableInfo" placeholder="최대 인원수 입력">
					</div>
				</div>	
				<div class="signUp-table">
					<div>예산 정보</div>
					<div>
						<input type="text" name="owBudget" placeholder="ex. 2인기준  20,000원">
					</div>
				</div>	
				<div class="signUp-table">
					<div>부가 정보</div>
					<div>
						<input type="text" name="owSubInfo" placeholder="ex. 주차 가능, 아이동반 가능, 24시간 영업 ">
					</div>
				</div>	
				<div class="signUp-table">
					<div>주류 정보</div>
					<div>
						<input type="text" name="owDrinkListInfo" placeholder="판매 중인 주류 입력  (ex. 소주, 맥주 등)">
					</div>
				</div>																																																										
			</section>
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
		menuInfo = menuInfo + "<div class='menuInfo'>"+
		            $('.menuInfo').html()+"<button id='delButton' type='button' onclick='menuInfoDel();'>삭제</button></div>";
		$('#menuPriceInfo').append(menuInfo);
	}
	function menuInfoDel(){
		$('.menuInfo:last').remove();
	}
	</script>
</body>
</html>
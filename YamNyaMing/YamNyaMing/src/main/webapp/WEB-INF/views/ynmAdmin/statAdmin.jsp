<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.ynm.admin.model.vo.*"
	%>
<% YNMAdmin ad = (YNMAdmin)session.getAttribute("admin");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css?ver=1">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>

<script>
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/board/write.do";
        });
    });
    // **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
    function list(page){
        location.href="${path}/board/list.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    }
</script>
</head>
<body>
<header id="admin-login-header">
		<h1>
			<a href="ynmAdmin.do">YamNyaMing 관리자</a>
		</h1>
		<p>
			[${sessionScope.admin.ad_nickname}] 님 안녕하세요 <a href="logoutAdmin.do">로그아웃</a>
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


			<div id="admin-main-stat">
				<h4>통계</h4>
				<div>
					<canvas id="gender-chart"></canvas>
					<canvas id="year-chart"></canvas>
					<canvas id="time-chart"></canvas>
					<canvas id="store-chart"></canvas>
				</div>
				<script>
				new Chart(document.getElementById("gender-chart"), {
				    type: 'pie',
				    data: {
				      labels: ["남자", "여자"],
				      datasets: [{
				    	label: "성별",
				        backgroundColor: ["#64B5F6", "#E57373"],
				        data: [2005,3006]
				      }]
				    },options: {
				      title: {
				        display: true,
				        text: '성별'
				      }
				    }
				});	
				new Chart(document.getElementById("year-chart"), {
				    type: 'pie',
				    data: {
				      labels: ["10대","20대","30대","40대","50대","60대 이상"],
				      datasets: [{
				        label: "연령대별",
				        backgroundColor: ["#F48FB1", "#B39DDB","#A5D6A7","#FFF59D","#FFCC80","#B0BEC5"],
				        data: [2005,3006,1200,4003,2000,1342]
				      }]
				    },
				    options: {
				      title: {
				        display: false,
				        text: '연령별'
				      }
				    }
				});		
				new Chart(document.getElementById("time-chart"), {
				    type: 'bar',
				    data: {
				      labels: ["3-7시","7-11시","11-15시","15-19시","19-23시","23-3시"],
				      datasets: [{
				        label: "시간대별",
				        backgroundColor: ["#F48FB1", "#B39DDB","#A5D6A7","#FFF59D","#FFCC80","#B0BEC5"],
				        data: [2005,3006,1200,4003,2000,1342]
				      }]
				    },
				    options: {
				      title: {
				        display: false,
				        text: '시간대별'
				      }
				    }
				});	
				new Chart(document.getElementById("store-chart"), {
				    type: 'bar',
				    data: {
				      labels: ["한식","중식","일식","양식","디저트"],
				      datasets: [{
				        label: "업종별",
				        backgroundColor: ["#B39DDB","#A5D6A7","#FFF59D","#FFCC80","#B0BEC5"],
				        data: [2005,3006,1200,4003,2000]
				      }]
				    },
				    options: {
				      title: {
				        display: false,
				        text: '업종별'
				      }
				    }
				});					
				</script>
			</div>

		</div>
		

	
	

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
</html>
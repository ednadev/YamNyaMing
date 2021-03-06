<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.ynm.admin.model.vo.*"
	import="com.kh.ynm.owner.model.vo.*"
	%>
<% YNMAdmin ad = (YNMAdmin)session.getAttribute("admin");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=3">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<header id="admin-login-header">
		<a href="/index.jsp"><img src="${pageContext.request.contextPath}/resources/image/plate-white.png" style="width:44px;float:left;margin:10px;"></a>
		<h1>
			<a href="/ynmAdmin.do">YamNyaMing 관리자</a>
		</h1>
		<p>
			[${sessionScope.admin.ad_nickname}] 님 안녕하세요 <a href="/logoutAdmin.do">로그아웃</a>
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
<div class="container-fluid">
    <div class="panel panel-success">
      <div class="panel-heading">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-3">
            <h2 class="text-center pull-left" style="padding-left: 30px;"> <span class="glyphicon glyphicon-list-alt"> </span>점장관리 </h2>
          </div>
          <div class="col-xs-9 col-sm-9 col-md-9">
            <div class="col-xs-12 col-sm-12 col-md-12">
              <div class="col-xs-12 col-md-4">
                <label> Search </label>
                <div class="form-group">
                  <div class="input-group">
                  
                      <form action="/OwnerSearch.do">
                  		<SELECT name="combo" id="combo">
    						<OPTION value="OwnerName">이름으로 검색</OPTION>
    						<OPTION value="OwnerId">아이디로 검색</OPTION>
						</SELECT>
                          <input type="text" name="keyword" id="keyword" required>
                      <input type="submit" value="검색" class="searchbtn"/>
                  </form>
                      

                 
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
<center>
<div class="panel-body table-responsive">
        <table class="table table-hover" style=" height:70%; overflow:auto;">
				<thead>
				<tr>
				<th class="col-xs-3">아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>계좌정보</th>
					<th>정지</th>

				</tr>
			</thead>
			
			  
			   <thead>
				<tbody class="points_table_scrollbar">
				 <c:forEach items="${list}" var="o">
				 <form action="/ownerStoreList.do" method="post">
				  <tr class="edit" id="detail">
					<td>${o.owId}</td>
					<td>${o.owName} </td>
					<td>${o.owEmail} </td>
					<td>${o.phone}</td>
					<td>${o.owBankAccount} </td>
					<td>
					<input type="hidden" value="${o.owEntirePk}" id="owEntirePk" name="owEntirePk"/>
					<input type="submit" value="점주 가게 현황" class="storeView"/></td>
				</tr>
				</form>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!-- 내용끝 -->
 <!-- 페이지 -->
  <div class="text-center marg-top" align="right">
<ul class="pagination" style="list-style:none;
    margin:0;
    padding:0;">
 
    <c:if test="${pageNaviData!=null}">
    	
					<div id="pagingNumber">
						<c:if test="${pageNaviData.startNavi!=1}">
							<form action="/OwnerSearch.do" method="post" class="btn">
								<input type="hidden"  name="currentPage" value="${pageNaviData.startNavi-1}"> 
								<input type="submit" class="paging-num" value="<">
							</form>
						</c:if>
						<c:forEach var="i" begin="${pageNaviData.startNavi}" end="${pageNaviData.endNavi}">
							<c:if test="${pageNaviData.currentPage==i}">
								<li><form action="/OwnerSearch.do" method="post">
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form></li>
							</c:if>
							<c:if test="${pageNaviData.currentPage!=i}">
								<li><form action="/OwnerSearch.do" method="post">
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageNaviData.endNavi!=pageNaviData.pageTotalCount}">
							<li><form action="/OwnerSearch.do" method="post">	
								<input type="hidden" name="currentPage"	value="${pageNaviData.endNavi+1}"> 
								<input type="submit"  class="paging-num"  value=">">
							</form><li>
						</c:if>
					</div>
			
				</c:if>
		
</ul>
</div>
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
</html>
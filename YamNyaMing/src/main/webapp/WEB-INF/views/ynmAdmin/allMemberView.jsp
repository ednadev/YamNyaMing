<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.ynm.admin.model.vo.*"
	%>
<% YNMAdmin ad = (YNMAdmin)session.getAttribute("admin");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<title>얌냐밍</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link rel="icon" href="${pageContext.request.contextPath}/resources/image/favicon.ico">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/btn.css?ver=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css?ver=1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>

</head>
<body>
	<header id="admin-login-header">
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
            <h2 class="text-center pull-left" style="padding-left: 30px;"> <span class="glyphicon glyphicon-list-alt"> </span>회원관리 </h2>
          </div>
          <div>
            <div>
              <div>
                <label> Search </label>
                <div class="form-group">
                  <div class="input-group">
                  
                      <form action="/MemberSearch.do">
                  		<SELECT name="combo" id="combo">
    						<OPTION value="MemberName">이름으로 검색</OPTION>
    						<OPTION value="MemberNickName">닉네임으로 검색</OPTION>
    						<OPTION value="MemberId">아이디로 검색</OPTION>
						</SELECT>
                      <input type="text" name="keyword" id="keyword" required>
                      <input type="submit" value="검색" />
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
        <table class="table table-hover">
				<thead>
				<tr>
				    <th>아바타</th>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>성별</th>
					<th>생일</th>
					<th>이메일</th>
					<th>폰번</th>
					<th>가입일</th>

				</tr>
			</thead>
			
			   <c:forEach items="${list}" var="m">
			   <thead>
				<tbody class="points_table_scrollbar">
				  <tr class="edit" id="detail">
				 	<td>${m.memberUploadPhotoNo}</td>
					<td>${m.memberId} </td>
					<td>${m.memberName} </td>
					<td>${m.memberNickName}</td>
					<td>
					<c:choose>
					<c:when test="${m.memberGender eq 'M'}">
					남
					</c:when>
					<c:otherwise>
					여
					</c:otherwise>
					</c:choose>
					</td>
					<td>${m.memberBirth} </td>
					<td>${m.memberEmail}</td>
					<td>${m.memberPhone} </td>
					<td>${m.memberRegDate} </td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!-- 내용끝 -->
 <!-- 페이지 -->
    <c:if test="${pageNaviData!=null}">
    	
					<div id="pagingNumber">
						<c:if test="${pageNaviData.startNavi!=1}">
							<form action="/allMemberView.do" method="post">
								<!--  <input type="hidden" value="${o.owEntirePk}" id="owEntirePk" name="owEntirePk"/> -->
								<input type="hidden"  name="currentPage" value="${pageNaviData.startNavi-1}"> 
								<input type="submit" class="paging-num" value="<">
							</form>
						</c:if>
						<c:forEach var="i" begin="${pageNaviData.startNavi}" end="${pageNaviData.endNavi}">
							<c:if test="${pageNaviData.currentPage==i}">
								<form action="/allMemberView.do" method="post">
								   <!--  <input type="hidden" value="${o.owEntirePk}" id="owEntirePk" name="owEntirePk"/> -->
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form>
							</c:if>
							<c:if test="${pageNaviData.currentPage!=i}">
								<form action="/allMemberView.do" method="post">
								    <!--  <input type="hidden" value="${o.owEntirePk}" id="owEntirePk" name="owEntirePk"/> -->
									<input type="hidden" name="currentPage" value="${i}"> 
									<input type="submit" class="paging-num" value="${i}">
								</form>
							</c:if>
						</c:forEach>
						<c:if test="${pageNaviData.endNavi!=pageNaviData.pageTotalCount}">
							<form action="/allMemberView.do" method="post">	
							  <!--  <input type="hidden" value="${o.owEntirePk}" id="owEntirePk" name="owEntirePk"/> --> 
								<input type="hidden" name="currentPage"	value="${pageNaviData.endNavi+1}"> 
								<input type="submit"  class="paging-num"  value=">">
							</form>
						</c:if>
					</div>
				</c:if>
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
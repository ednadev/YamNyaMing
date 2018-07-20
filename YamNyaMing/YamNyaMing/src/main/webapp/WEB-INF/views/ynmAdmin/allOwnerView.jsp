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
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css?ver=1">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>


<script type="text/javascript">  //아이디 체크여부 확인 
function blockBtn(){
    var block = $('#block').value;
        $.ajax({
             url : "/ownerBlock.do",
             data : {block : block},
             dataType:'json',
             success : function(data){
                 console.log(data);
                 if(data>0){
                	 alert("실패했어욧..");
                    return false;
                 } else{
                    alert("블락성공 ^-^"); 
                 }   
             }
         });    
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
                      <input type="submit" value="검색"/>
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
				<th class="col-xs-3">아이디</th>
					<th class="col-xs-3">이름</th>
					<th class="col-xs-3">이메일</th>
					<th class="col-xs-3">전화번호</th>
					<th class="col-xs-3">계좌정보</th>
					<th class="col-xs-3">정지</th>

				</tr>
			</thead>
			
			   <c:forEach items="${list}" var="o">
			   <thead>
				<tbody class="points_table_scrollbar">
				  <tr class="edit" id="detail">
					<td class="col-xs-3">${o.owId}</td>
					<td class="col-xs-3">${o.owName} </td>
					<td class="col-xs-3">${o.owEmail} </td>
					<td class="col-xs-3">0${o.phone}</td>
					<td class="col-xs-3">${o.owBankAccount} </td>
					<td class="col-xs-3"><input type="button" value="삭제" id="block" name="${o.owId}" onclick ="blockBtn()"/>
				</tr>
			</c:forEach>
			</tbody>
		</table>
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
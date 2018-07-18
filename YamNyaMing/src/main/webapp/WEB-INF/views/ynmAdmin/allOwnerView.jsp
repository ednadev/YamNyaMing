<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  import="com.kh.ynm.member.model.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
	 font-family: 'Sunflower';
}
</style>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원들 ㅎㅎ </title>
</head>
<body>
<div class="container-fluid">
    <div class="panel panel-success">
      <div class="panel-heading">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-3">
            <h2 class="text-center pull-left" style="padding-left: 30px;"> <span class="glyphicon glyphicon-list-alt"> </span> Details </h2>
          </div>
          <div class="col-xs-9 col-sm-9 col-md-9">
            <div class="col-xs-12 col-sm-12 col-md-12">
              <div class="col-xs-12 col-md-4">
                <label> Search </label>
                <div class="form-group">
                  <div class="input-group">
                  
                      <form action="/OwnerSearch.do">
                  		<SELECT name="combo" id="search_menu">
    						<OPTION value="OwnerName">이름으로 검색</OPTION>
    						<OPTION value="OwnerNickName">닉네임으로 검색</OPTION>
    						<OPTION value="OwnerId">아이디로 검색</OPTION>
						</SELECT>
                      <input type="text" name="search">
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
					<th class="col-xs-3">이름</th>
					<th class="col-xs-3">나이</th>
					<th class="col-xs-3">폰번</th>

				</tr>
			</thead>
			
			   <c:forEach items="${list}" var="m">
			   <thead>
				<tbody class="points_table_scrollbar">
				  <tr class="edit" id="detail">
					<td class="col-xs-3">${m.memberId}</td>
					<td class="col-xs-3">${m.memberName} </td>
					<td class="col-xs-3">${m.memberPhone} </td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>
   </center>
</body>
</html>
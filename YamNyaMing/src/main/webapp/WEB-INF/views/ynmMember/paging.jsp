<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page import="com.kh.ynm.member.model.vo.*" import="java.util.*"%>
     <%
     pagingTest2 qpd=(pagingTest2)request.getAttribute("test");
	ArrayList<PagingTest> list=qpd.getNoticelist();
	
%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>total : ${test.recordTotalCount}</h4>

				<%for(PagingTest q:list){ %>
						<tr>
							<td><%=q.getStoreNo()%></td><td><%=q.getStoreFk()%>
							</td><td><%=q.getCode()%></td><td><%=q.getName()%></td><td>
						</tr>
						
						<%} %>
						
						<!-- ajax처리 해야 가능할 듯 -->
						<%if(qpd.getCurrentPage()>1){ %>
					<a class="btn btn-primary btn-lg" href="/pagingTest?currentPage=<%=qpd.getCurrentPage()-1%>"> < </a>
					<%} %>
					
					<%for(int i=qpd.getStartNavi(); i<=qpd.getEndNavi();i++){ 
					if(i==qpd.getCurrentPage()){%>
						<a class="btn btn-primary btn-lg" href='/pagingTest?currentPage=<%=i%>'><%=i%></a>
					<%}else{ %>
						<a class="btn btn-primary btn-lg" href='/pagingTest?currentPage=<%=i%>'><%=i%></a>
					<%} %>
				<%} %>
					<%if(qpd.getCurrentPage()<qpd.getPageTotalCount()){ %>
					<a class="btn btn-primary btn-lg" href="/pagingTest?currentPage=<%=qpd.getCurrentPage()+1%>"> > </a>
				<%} %>

</body>
</html>
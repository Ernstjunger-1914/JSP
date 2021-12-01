<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String pcode=request.getParameter("pcode");
	String scode=request.getParameter("scode");
	String sdate=request.getParameter("sdate");
	String pname=request.getParameter("pname");
	String amount=request.getParameter("amount");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			try {
				String sql="";
				
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		
			response.sendRedirect("index.jsp?");
		%>
	</body>
</html>
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
				String sql="insert into TBL_SALELIST_02 values(?, ?, to_date(?, 'yyyy-mm-dd'), ?, ?)";
				PreparedStatement pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, pcode);
				pstmt.setString(2, scode);
				pstmt.setString(3, sdate);
				pstmt.setString(4, pname);
				pstmt.setString(5, amount);
				
				pstmt.executeUpdate();
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		
			response.sendRedirect("index.jsp?");
		%>
	</body>
</html>
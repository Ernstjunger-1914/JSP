<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String costno=request.getParameter("costno");
	String cname=request.getParameter("cname");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String joindate=request.getParameter("joindate");
	String grade=request.getParameter("grade");
	String city=request.getParameter("city");
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
				String sql="insert into member_tbl_02 values(?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, costno);
				pstmt.setString(2, cname);
				pstmt.setString(3, phone);
				pstmt.setString(4, address);
				pstmt.setString(5, joindate);
				pstmt.setString(6, grade);
				pstmt.setString(7, city);
				
				pstmt.executeUpdate();
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("index.jsp?");
		%>
	</body>
</html>
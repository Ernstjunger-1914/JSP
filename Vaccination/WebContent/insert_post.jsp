<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String resvno=request.getParameter("resvno");
	String jumin=request.getParameter("jumin");
	String vcode=request.getParameter("vcode");
	String hcode=request.getParameter("hcode");
	String vdate=request.getParameter("vdate");
	String vtime=request.getParameter("vtime");
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
				String sql="insert into tbl_vaccresv_201808 values(?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, resvno);
				pstmt.setString(2, jumin);
				pstmt.setString(3, vcode);
				pstmt.setString(4, hcode);
				pstmt.setString(5, vdate);
				pstmt.setString(6, vtime);
				
				pstmt.executeUpdate();
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		
			response.sendRedirect("index.jsp?");
		%>
	</body>
</html>
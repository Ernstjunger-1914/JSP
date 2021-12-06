<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String resvnum=request.getParameter("resvnum");
	String jnum=request.getParameter("jnum");
	String codev=request.getParameter("codev");
	String hcode=request.getParameter("hcode");
	String datev=request.getParameter("datev");
	String timev=request.getParameter("timev");
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
				
				pstmt.setString(1, resvnum);
				pstmt.setString(2, jnum);
				pstmt.setString(3, codev);
				pstmt.setString(4, hcode);
				pstmt.setString(5, datev);
				pstmt.setString(6, timev);
				
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(con!=null) {
					con.close();
				}
			}
		
			response.sendRedirect("index.jsp?");
		%>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String anum=request.getParameter("anum");
	String aname=request.getParameter("aname");
	String birthy=request.getParameter("birthy");
	String birthm=request.getParameter("birthm");
	String birthd=request.getParameter("birthd");
	
	if(birthm.length()<2) {
		birthm="0"+birthm;
	}
	
	if(birthd.length()<2) {
		birthd="0"+birthd;
	}
	
	String adate=birthy+birthm+birthd;
	String gender=request.getParameter("gender");
	String talent=request.getParameter("talent");
	String agen=request.getParameter("agen");
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
				String sql="insert into tbl_artist_201905 values(?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, anum);
				pstmt.setString(2, aname);
				pstmt.setString(3, adate);
				pstmt.setString(4, gender);
				pstmt.setString(5, talent);
				pstmt.setString(6, agen);
				pstmt.executeUpdate();
				
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		
			response.sendRedirect("index.jsp?section=select");
		%>
	</body>
</html>
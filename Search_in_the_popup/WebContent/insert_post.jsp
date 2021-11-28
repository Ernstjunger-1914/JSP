<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String saleno=request.getParameter("saleno");
	String pcode=request.getParameter("pcode");
	String saledate=request.getParameter("saledate");
	String scode=request.getParameter("scode");
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
				PreparedStatement pstmt=con.prepareStatement("INSERT INTO tbl_salelist_01 VALUES (?,?,"+"TO_DATE(?,'YYYY-MM-DD')"+",?,?)");
				
				pstmt.setString(1, saleno);
				pstmt.setString(2, pcode);
				pstmt.setString(3, saledate);
				pstmt.setString(4, scode);
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
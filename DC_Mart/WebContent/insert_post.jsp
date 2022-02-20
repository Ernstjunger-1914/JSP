<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String ono=request.getParameter("ono");
	String pcode=request.getParameter("pcode");
	String pdate=request.getParameter("pdate");
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
				String sql="insert into tbl_order_202101 values(?, ?, to_date(?, 'yyyymmdd'), ?, ?)";
				PreparedStatement pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, ono);
				pstmt.setString(2, pcode);
				pstmt.setString(3, pdate);
				pstmt.setString(4, scode);
				pstmt.setString(5, amount);
				
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("index.jsp?section=insert");
		%>
	</body>
</html>
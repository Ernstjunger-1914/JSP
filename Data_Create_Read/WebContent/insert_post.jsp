<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String sale_ymd=request.getParameter("sale_ymd");
	String date=request.getParameter("date");
	String sale_fg=request.getParameter("sale_fg");
	String store_cd=request.getParameter("store_cd");
	String goods_cd=request.getParameter("goods_cd");
	String sale_cnt=request.getParameter("sale_cnt");
	String morc=request.getParameter("morc");
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
				String sql="insert into SALE_TBL_003 values(?, to_date(?, 'yyyy-mm-dd'), ?, ?, ?, ?, ?)";
				PreparedStatement pstmt=con.prepareStatement(sql);

				pstmt.setString(1, sale_ymd);
				pstmt.setString(2, date);
				pstmt.setString(3, sale_fg);
				pstmt.setString(4, store_cd);
				pstmt.setString(5, goods_cd);
				pstmt.setString(6, sale_cnt);
				pstmt.setString(7, morc);
				pstmt.executeUpdate();
				
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("index.jsp?");
		%>
	</body>
</html>
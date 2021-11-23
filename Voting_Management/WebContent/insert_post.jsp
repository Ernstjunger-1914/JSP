<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String j_num=request.getParameter("j_num");
	String j_name=request.getParameter("j_name");
	String m_num=request.getParameter("m_num");
	String v_time=request.getParameter("v_time");
	String v_area=request.getParameter("v_area");
	String chk=request.getParameter("chk");
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
				String sql="insert into tbl_vote_202005 values(?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt=con.prepareStatement(sql);

				pstmt.setString(1, j_num);
				pstmt.setString(2, j_name);
				pstmt.setString(3, m_num);
				pstmt.setString(4, v_time);
				pstmt.setString(5, v_area);
				pstmt.setString(6, chk);
				
				pstmt.executeUpdate();
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			response.sendRedirect("index.jsp?");
		%>
	</body>
</html>
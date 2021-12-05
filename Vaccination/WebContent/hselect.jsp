<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>접종인원통계</h3>
		
		<table border="1">
			<tr>
				<td>병원코드</td>
				<td>병원명</td>
				<td>접종건수</td>
			</tr>
		<%
			try {
				String sql="select h.hospcode, hospname, count(*) from tbl_hosp_201808 h inner join tbl_vaccresv_201808 v on h.hospcode=v.hospcode group by h.hospcode, hospname order by h.hospcode";
				String sql2="select count(*) as cnt from tbl_vaccresv_201808";
				PreparedStatement pstmt=con.prepareStatement(sql);
				PreparedStatement pstmt2=con.prepareStatement(sql2);
				ResultSet rs=pstmt.executeQuery();
				ResultSet rs2=pstmt2.executeQuery();
				
				while(rs.next()) {
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
			</tr>
		<%
				}
				
				rs2.next();
		%>
			<tr>
				<td></td>
				<td>총 누계</td>
				<td><%=rs2.getString(1) %></td>
			</tr>
		<%
				
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
		</table>
	</body>
</html>
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
		<h3>후보자 등수</h3>
		
		<table border="1">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>소속정당</td>
			</tr>
		<%
			try {
				String sql="select m.m_no, m_name, count(*) cnt from tbl_member_202005 m, tbl_vote_202005 v where m.m_no=v.m_no and v_confirm='Y' group by m.m_no, m.m_name order by cnt desc";
				PreparedStatement pstmt=con.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
			
				while(rs.next()) {
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
			</tr>
		<%
				}
				
				con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
		</table>
	</body>
</html>
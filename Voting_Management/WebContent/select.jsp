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
		<h3>후보조회</h3>
		
		<table border="1">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>소속정당</td>
				<td>학력</td>
				<td>주민번호</td>
				<td>지역구</td>
				<td>대표번호</td>
			</tr>
		<%
			try {
				String sql="select m_no, m_name, p_name, decode(p_school, '1', '고졸', '2', '학사', '3', '석사') as p_school, substr(m_jumin, 1,6)||'-'||substr(m_jumin, 7, 7) as m_jumin, m_city, p_tel1||'-'||p_tel2||'-'||p_tel3 as tel from tbl_party_202005 p, tbl_member_202005 m where p.p_code=m.p_code";
				PreparedStatement pstmt=con.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
					
				while(rs.next()) {
						
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
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
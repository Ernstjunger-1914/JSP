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
		<h3>참가자 등수 조회</h3>
		
		<table border="1">
			<tr>
				<td>참가번호</td>
				<td>참가자명</td>
				<td>총점</td>
				<td>평균</td>
				<td>등수</td>
			</tr>
			<%
				try {
					String sql="select a.artist_id, artist_name, sum(point) as sum, to_char(avg(point), '99.99') as avg, rank() over(order by sum(point) desc) from tbl_artist_201905 a inner join tbl_point_201905 p on a.artist_id=p.artist_id group by a.artist_id, artist_name";
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
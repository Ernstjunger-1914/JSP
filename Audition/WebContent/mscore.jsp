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
		<h3>멘토점수조회</h3>
		
		<table border="1">
			<tr>
				<td>채점번호</td>
				<td>참가번호</td>
				<td>참가자명</td>
				<td>생년월일</td>
				<td>점수</td>
				<td>평점</td>
				<td>멘토</td>
			</tr>
		<%
			try {
				String sql="select serial_no, a.artist_id, artist_name, substr(artist_birth, 1, 4)||'년'||substr(artist_birth, 5, 2)||'월'||substr(artist_birth, 8, 2)||'일' as birth, point, mento_name from tbl_point_201905 p inner join tbl_artist_201905 a on a.artist_id=p.artist_id inner join tbl_mento_201905 m on m.mento_id=p.mento_id order by serial_no";
				PreparedStatement pstmt=con.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
				
				while(rs.next()) {
					int s=rs.getInt(5);
					String score="";
					
					if(s>=90) {
						score="A";
					} else if(s>=80) {
						score="B";
					} else if(s>=70) {
						score="C";
					} else if(s>=60) {
						score="D";
					} else {
						score="F";
					}
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=score %></td>
				<td><%=rs.getString(6) %></td>
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
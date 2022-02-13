<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>회원목록조회/수정</h3>
		
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>거주지역</td>
			</tr>
			<%
				try {
					String sql="select custno, custname, phone, address, to_char(joindate, 'yyyy-mm-dd') as dt, decode(grade, 'A', 'VIP', 'B', '일 반', 'C', '직원') as grade, city from member_tbl_02";
					
					PreparedStatement pstmt=con.prepareStatement(sql);
					ResultSet rs=pstmt.executeQuery();
					
					while(rs.next()) {
			%>
			<tr>
				<td><a href="update.jsp?custno=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
			</tr>
			<%
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
			%>
		</table>
	</body>
</html>
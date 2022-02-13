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
		<h3>회원매출조회</h3>
		
		<table border="1">
			<tr>
				<td>회원번호</td>
				<td>회원성명</td>
				<td>고객등급</td>
				<td>매출</td>
			</tr>
		<%
			try {
				String sql="select mt.custno, mt.custname, decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') as grade, sum(price) from member_tbl_02 mt inner join money_tbl_02 mt2 on mt.custno=mt2.custno group by mt.custno, mt.custname, mt.grade order by sum(price) desc";
				
				PreparedStatement pstmt=con.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
				
				while(rs.next()) {
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
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
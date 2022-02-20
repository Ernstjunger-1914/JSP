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
		<h3>점포별 할인률</h3>
		
		<table border="1">
			<tr>
				<td>상품코드</td>
				<td>상품이름</td>
				<td>가격</td>
				<td>10% 할인</td>
				<td>15% 할인</td>
			</tr>
		<%
			try {
				String sql="select p.pcode, pname, to_char(cost, '999,999') as cost, to_char(cost*0.9, '999,999') as dc10, to_char(cost*0.85, '999,999') as dc15 from tbl_product_202101 p";
				
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
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
		</table>
	</body>
</html>
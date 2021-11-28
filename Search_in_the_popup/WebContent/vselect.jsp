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
		<h3>상품별판매액</h3>
		
		<table border="1">
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>상품별 판매액</td>
			</tr>
		<%
			try {
				String sql="select p.pcode, name, sum(cost*amount) from tbl_product_01 p inner join tbl_salelist_01 s on p.pcode=s.pcode group by p.pcode, name order by p.pcode asc";
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
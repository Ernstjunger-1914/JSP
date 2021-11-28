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
		<h3>매장별판매액</h3>
		
		<table border="1">
			<tr>
				<td>매장코드</td>
				<td>매장명</td>
				<td>매장별 판매액</td>
			</tr>
		<%
			try {
				String sql="select s.scode, sname, to_char(sum(cost*amount), '999,999,999') sum from tbl_product_01 p inner join tbl_salelist_01 sl on p.pcode=sl.pcode inner join tbl_shop_01 s on s.scode=sl.scode group by s.scode, sname order by s.scode";
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
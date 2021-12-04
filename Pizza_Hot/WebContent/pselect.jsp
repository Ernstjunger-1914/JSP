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
		<h3>상품별배출현황</h3>
		
		<table border="1">
			<tr>
				<td>피자코드</td>
				<td>피자명</td>
				<td>총매출액</td>
			</tr>
		<%
			try {
				String sql="select p.pcode, pname, to_char(sum(cost*amount), 'L999,999,999') as total from tbl_pizza_02 p inner join tbl_salelist_02 ts on p.pcode=ts.pcode inner join tbl_shop_02 s on ts.scode=s.scode group by p.pcode, pname";
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
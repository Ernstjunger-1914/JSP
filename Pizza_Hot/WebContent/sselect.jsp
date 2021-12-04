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
		<h3>지점별매출현황</h3>
		
		<table border="1">
			<tr>
				<td>지점 코드</td>
				<td>지점명</td>
				<td>총매출액</td>
			</tr>
		<%
			try {
				String sql="select s.scode, sname, to_char(sum(amount*cost), 'L999,999,999') as total from tbl_shop_02 s, tbl_salelist_02 ts, tbl_pizza_02 p where s.scode=ts.scode and p.pcode=ts.pcode group by s.scode, sname order by s.scode";
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
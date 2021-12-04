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
		<h3>통합매출조회</h3>
		
		<table border="1">
			<tr>
				<td>매출전표번호</td>
				<td>지점</td>
				<td>판매일자</td>
				<td>피자코드</td>
				<td>피자명</td>
				<td>판매수량</td>
				<td>매출액</td>
			</tr>
		<%
			try {
				String sql="select saleno, s.scode||'-'||sname as s, to_char(saledate, 'yyyy-mm-dd') as dt, ts.pcode, pname, amount, to_char((amount*cost), 'L999,999,999') total from tbl_salelist_02 ts, tbl_shop_02 s, tbl_pizza_02 p where ts.scode=s.scode and ts.pcode=p.pcode order by saleno";
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
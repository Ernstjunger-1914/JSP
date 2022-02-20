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
		<h3>판매 조회</h3>
		
		<table border="1">
			<tr>
				<td>판매번호</td>
				<td>상품코드</td>
				<td>상품이름</td>
				<td>점포코드</td>
				<td>점포이름</td>
				<td>판매날짜</td>
				<td>가격</td>
				<td>수량</td>
				<td>원가</td>
				<td>할인 적용</td>
			</tr>
		<%
			try {
				String sql="select substr(orderno, 1, 4)||'-'||substr(orderno, 5, 6) as orderno, p.pcode, pname, o.shopno, shopname, substr(orderdate, 1, 4)||'-'||substr(orderdate, 5, 2)||'-'||substr(orderdate, 7, 2) as dt, cost, amount, to_char(cost*amount, '999,999') as total, to_char(decode(s.shopno, 'S001', cost*amount*0.9, 'S002', cost*amount*0.85, 'S003', cost*amount*0.9, 'S004', cost*amount*0.85), '999,999') as dc from tbl_shop_202101 s inner join tbl_order_202101 o on s.shopno=o.shopno inner join tbl_product_202101 p on p.pcode=o.pcode order by orderno";
				
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
				<td><%=rs.getString(8) %></td>
				<td><%=rs.getString(9) %></td>
				<td><%=rs.getString(10) %></td>
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
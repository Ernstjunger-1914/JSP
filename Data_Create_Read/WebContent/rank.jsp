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
		<h3>랭킹</h3>
		<%
			try {
				String sql="select rank() over(order by sum(goods_price*sale_cnt) desc) , store_nm, to_char(sum(goods_price*sale_cnt), '999,999,999')||'원' from store_tbl_003 st, sale_tbl_003 sa, goods_tbl_003 go where go.goods_cd=sa.goods_cd and st.store_cd=sa.store_cd and sale_fg=1 group by sa.store_cd, store_nm";
				PreparedStatement pstmt=con.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
		%>
		<table border="1">
			<tr>
				<td>순위</td>
				<td>점포명</td>
				<td>총매출</td>
			</tr>
		<%
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
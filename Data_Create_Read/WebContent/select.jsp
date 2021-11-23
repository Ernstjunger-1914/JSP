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
		<h3>조회</h3>
		<%
			try {
				String sql="select sale_no, to_char(sale_ymd, 'yyyy-mm-dd') as sale_date, decode(sale_fg, '1', '판매', '2', '판매취소'), sa.store_cd, go.goods_cd, goods_nm, store_nm, sale_cnt, decode(pay_type, '01', '현금', '02', '카드') from sale_tbl_003 sa inner join store_tbl_003 st on sa.store_cd=st.store_cd inner join goods_tbl_003 go on sa.goods_cd=go.goods_cd";
				PreparedStatement pstmt=con.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
		%>
		<table border="1">
			<tr>
				<td>판매번호</td>
				<td>판매날짜</td>
				<td>판매구분</td>
				<td>점포코드</td>
				<td>상품번호</td>
				<td>상품명</td>
				<td>지점명</td>
				<td>판매수량</td>
				<td>수취구분</td>
			</tr>
		<%
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
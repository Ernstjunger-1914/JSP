<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String namev = request.getParameter("name_v");
	String saledate = request.getParameter("saledate");
	String salenov = request.getParameter("saleno_v");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>판매현황</h3>
		
		<input type="button" class="search" value="검색" onclick="search()">
		<table border="1">
			<tr>
				<td>비번호</td>
				<td>상품코드</td>
				<td>판매날짜</td>
				<td>매장코드</td>
				<td>상품명</td>
				<td>판매수량</td>
				<td>총판매액</td>
			</tr>
		<%
			try {
				String sql="select saleno, tp.pcode, TO_CHAR(saledate, 'YYYY-MM-DD'), name, ts.scode, amount, TO_CHAR((amount*cost), '999,999,999') from tbl_product_01 tp INNER JOIN tbl_salelist_01 tsl ON tp.pcode=tsl.pcode INNER JOIN tbl_shop_01 ts ON ts.scode=tsl.scode ";
				
				if(namev!=null) {
					sql+="where name like '%"+namev+"%' ";
				}
				
				if(saledate!=null) {
					String str[]=saledate.trim().split(":");
					
					sql+="where saledate>=to_date('"+str[0]+"', 'yyyy-mm-dd') ";
					sql+="and saledate<=to_date('"+str[1]+"', 'yyyy-mm-dd') ";
				}
				
				if(salenov!=null) {
					sql+="where tsl.saleno="+salenov+" ";
				}
				
				sql+="order by saleno";
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
		<script type="text/javascript">
			function search() {
				window.open("popup.jsp", "검색", "width=150px;height=100px;");
			}
		</script>
	</body>
</html>
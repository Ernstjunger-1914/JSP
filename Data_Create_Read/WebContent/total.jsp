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
		<h3>점포별 매출현황</h3>
		<%
			try {
				String sql="SELECT st.store_cd, store_nm, SUM(goods_price*sale_cnt), pay_type FROM goods_tbl_003 gt INNER JOIN sale_tbl_003 st ON gt.goods_cd=st.goods_cd INNER JOIN store_tbl_003 stt ON st.store_cd=stt.store_cd GROUP BY st.store_cd, store_nm, pay_type ORDER BY st.store_cd";
				String sql2="SELECT count(*) FROM ("+sql+")";
				PreparedStatement pstmt=con.prepareStatement(sql);
				PreparedStatement pstmt2=con.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery(sql);
				ResultSet rs2=pstmt2.executeQuery(sql2);
				
				rs2.next();
				int cnt=rs2.getInt(1);
				rs2.close();
		%>
		
		<table border="1">
			<tr>
				<td>점포명</td>
				<td>현금매출</td>
				<td>카드매출</td>
				<td>총매출</td>
			</tr>
		<%
				int i=1, money=0, card=0; 
				
				while(rs.next()) {
					String pre=rs.getString(1);
					String next=null;
					int price=rs.getInt(3);
					String ch=rs.getString(4);
					
					if(ch.equals("01")) {
						money+=price;
						
						if(i<cnt) {
							rs.next();
							next=rs.getString(1);
							
							if(pre.equals(next)) {
								price=rs.getInt(3);
								card+=price;
								// 커서 이동 시 행수 추가
								i++;
								} else {
									rs.previous();
								}
							}
						} else {
							card+=price;
					}
		%>
			<tr>
				<td><%=rs.getString(2) %></td>
				<td><%=money %></td>
				<td><%=card %></td>
				<td><%=money+card %></td>
			</tr>
		<%
					money=0;
					card=0;
					i++;
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		%>
		</table>
	</body>
</html>
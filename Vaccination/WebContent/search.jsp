<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String num=request.getParameter("num");
	
	if(num==null) {
		num="";
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>예약번호: <%=num %>의 접종예약조회</h3>
		
		<table border="1">
			<tr>
				<td>이름</td>
				<td>주민번호</td>
				<td>성별</td>
				<td>전화번호</td>
				<td>예약일자</td>
				<td>예약시간</td>
				<td>병원명</td>
				<td>대표전화</td>
				<td>병원주소</td>
				<td>백신종류</td>
			</tr>
		<%
			try {
				String sql="";
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
		%>
		</table>
		<%
			} catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("search1.jsp");
			}
		%>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String num=request.getParameter("num");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>예약번호: <%=num %>의 접종예약조회</h3>
		<%
			try {
				String sql="select pname, j.jumin, decode(substr(j.jumin, 8, 1), '1', '남', '2', '여') as gender, tel, substr(resvdate, 1, '4')||'년'||substr(resvdate, 5, 2)||'월'||substr(resvdate, 7, 2)||'일' as resvdate, substr(resvtime, 1, 2)||':'||substr(resvtime, 3, 2) as resvtime, decode(h.hospcode, 'H001', '가-병원', 'H002', '나-병원', 'H003', '다-병원', 'H004', '라-병원') as hosp, hosptel, hospaddr, decode(vcode, 'V001', 'A백신', 'V002', 'B백신', 'V003', 'C백신') as vname from tbl_vaccresv_201808 v inner join tbl_hosp_201808 h on v.hospcode=h.hospcode inner join tbl_jumin_201808 j on j.jumin=v.jumin and resvno='"+num+"'";
				PreparedStatement pstmt=con.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
				
				if(!rs.next()) {
					response.sendRedirect("error.jsp");
				}
		%>
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
		</table>
		<%
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(con!=null) {
					con.close();
				}
			}
		%>
		<input type="button" value="돌아가기" onclick="goback()">
		
		<script type="text/javascript">
			function goback() {
				location.href="index.jsp?section=select";
			}
		</script>
	</body>
</html>
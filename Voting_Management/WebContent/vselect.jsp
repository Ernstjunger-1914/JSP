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
		<h3>투표검수조회</h3>
		
		<table border="1">
			<tr>
				<td>성명</td>
				<td>생년월일</td>
				<td>나이</td>
				<td>성별</td>
				<td>후보번호</td>
				<td>투표시간</td>
				<td>유권자확인</td>
			</tr>
		<%
			try {
				String sql="select v_name name, 19||substr(v_jumin, 1, 2)||'년'||substr(v_jumin, 3, 2)||'월'||substr(v_jumin, 5, 2)||'일' birth, substr(v_jumin, 1, 2) birth2, substr(v_jumin, 7, 1) jumin, m_no vote, substr(v_time, 1, 2)||':'||substr(v_time, 3, 2) time, decode(v_confirm, 'Y', '확인', 'N', '미확인') from tbl_vote_202005";
				PreparedStatement pstmt=con.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
				
				while(rs.next()) {
					int birth=rs.getInt(3);
					int jumin=rs.getInt(4);
					int year=2021;
					int age=0;
					
					if(jumin<3) {
						birth+=1900;
						age=year-birth;
					} else if(jumin<5) {
						birth+=2000;
						age=year-birth;
					}
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%="만 "+age+"세" %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getInt(5) %></td>
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
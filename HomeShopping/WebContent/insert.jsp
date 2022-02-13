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
		<h3>홈쇼핑 회원 등록</h3>
		
		<%
			String sql="select max(custno) from member_tbl_02";
		
			PreparedStatement pstmt=con.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			
			int custno=100001;
			
			if(rs.next()) {
				custno=rs.getInt(1)+1;
			}
		%>
		
		<form action="insert_post.jsp" name="form1" method="post">
			<table border="1">
				<tr>
					<td>회원번호(자동생성)</td>
					<td><input type="text" name="costno" value="<%=custno %>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="cname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급[A: VIP, B: 일반, C: 직원]</td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="subm()"> 
						<input type="button" value="조회" onclick="go()">
					</td>
				</tr>
			</table>
		</form>
		
		<script type="text/javascript">
			function subm() {
				if(form1.cname.value=="") {
					alert("회원성명이 입력되지 않았습니다.");
					form1.cname.focus();
					
					return false;
				} else if(form1.phone.value=="") {
					alert("회원전화번호가 입력되지 않았습니다.");
					form1.phone.focus();
					
					return false;
				} else if(form1.address.value==""){
					alert("회원주소가 입력되지 않았습니다.");
					form1.address.focus();
					
					return false;
				} else if(form1.joindate.value=="") {
					alert("가입일자가 입력되지 않았습니다.");
					form1.joindate.focus();
					
					return false;
				} else if(form1.grade.value=="") {
					alert("고객등급이 입력되지 않았습니다.");
					form1.grade.focus();
					
					return false;
				} else if(form1.city.value=="") {
					alert("도시코드가 입력되지 않았습니다.");
					form1.city.focus();
					
					return false;
				}
				alert("회원 등록이 완료되었습니다.");
				document.form1.submit();
			}
			
			function go() {
				location.href="index.jsp?section=supdate";
			}
		</script>
	</body>
</html>
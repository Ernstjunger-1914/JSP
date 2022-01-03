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
		<h3>오디션 등록</h3>
		
		<table border="1">
			<tr>
				<td>참가번호</td>
				<td><input type="text" name="anum"></td>
			</tr>
			<tr>
				<td>참가자명</td>
				<td><input type="text" name="aname"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="birthy">년<input type="text" name="birthm">월<input type="text" name="birthd">일</td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="M">남성<input type="radio" name="gender" value="F">여성</td>
			</tr>
			<tr>
				<td>특기</td>
				<td>
					<select>
						<option value="">특기선책</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>소속사</td>
				<td><input type="text" name="agen"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="오디션 등록" onclick="subm()"> <input type="button" value="다시쓰기" onclick="rest()"></td>
			</tr>
		</table>
		
		<script type="text/javascript">
			function subm() {
				
			}
			
			function rest() {
				
			}
		</script>
	</body>
</html>
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
		<h3>판매정보 등록</h3>
		
		<form action="insert_post.jsp" name="form1" method="post">
			<table border="1">
				<tr>
					<td>판매번호(자동발생)</td>
					<td></td>
				</tr>
				<tr>
					<td>상품코드</td>
					<td></td>
				</tr>
				<tr>
					<td>판매날짜</td>
					<td></td>
				</tr>
				<tr>
					<td>점포코드</td>
					<td></td>
				</tr>
				<tr>
					<td>수량</td>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="subm()"> 
						<input type="button" value="다시쓰기" onclick="rest()">
					</td>
				</tr>
			</table>
		</form>
		
		<script type="text/javascript">
			function subm() {
				
			}
			
			function rest() {
				alert("정보를 지우고 다시 씁니다.");
				document.form1.reset();
			}
		</script>
	</body>
</html>
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
		<h3>판매등록</h3>
		<form action="insert_post.jsp" method="post" name="form1">
			<table border="1">
				<tr>
					<td>비번호</td>
					<td><input type="text" name="saleno"></td>
				</tr>
				<tr>
					<td>상품코드</td>
					<td><input type="text" name="pcode"></td>
				</tr>
				<tr>
					<td>판매날짜</td>
					<td><input type="text" name="saledate"></td>
				</tr>
				<tr>
					<td>매장코드</td>
					<td><input type="text" name="scode"></td>
				</tr>
				<tr>
					<td>판매수량</td>
					<td><input type="number" name="amount"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="등록" onclick="subm()"> <input type="button" value="다시쓰기" onclick="rest()"></td>
				</tr>
			</table>
		</form>
		<script type="text/javascript">
			function subm() {
				if(form1.saleno.value=='') {
					alert("비번호가 입력되지 않았습니다!");
					
					return false;
				} else if(form1.pcode.value=='') {
					alert("상품코드가 입력되지 않았습니다!");
					
					return false;
				} else if(form1.saledate.value=='') {
					alert("판매날짜가 입력되지 않았습니다!");
					
					return false;
				} else if(form1.scode.value=='') {
					alert("매장코드가 선택되지 않았습니다!");
					
					return false;
				} else if(form1.amount.value=='') {
					alert("판매수량이 입력되지 않았습니다.");
					
					return false;
				}
				alert("판매정보가 정상적으로 등록되었습니다!");
				document.form1.submit();
			}
			
			function rest() {
				document.form1.reset();
			}
		</script>
	</body>
</html>
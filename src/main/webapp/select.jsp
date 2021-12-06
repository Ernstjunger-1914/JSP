<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String search=request.getParameter("search");
	
	if(search==null) {
		search="";
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>접종예약조회</h3>
		
		<form action="search.jsp" method="get" name="form1">
			<table border="1">
				<tr>
					<td>예약번호를 입력 하시오.</td>
					<td><input type="text" name="num"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="예약조회" onclick="gosearch()"> <input type="button" value="홈으로" onclick="gohome()"></td>
				</tr>
			</table>
		</form>
		
		<script type="text/javascript">
			function gosearch() {
				if(form1.num.value==""||form1.num.value==" ") {
					alert("예약번호가 입력되지 않았습니다.");
					form1.num.focus();
					
					return false;
				}
				document.form1.submit();
			}
			
			function gohome() {
				location.href="index.jsp?";
			}
		</script>

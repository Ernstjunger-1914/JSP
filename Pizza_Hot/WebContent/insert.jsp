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
		<h3>매출전표등록</h3>
		<form action="insert_post.jsp" method="post" name="form1">
			<table border="1">
				<tr>
					<td>매출전표번호</td>
					<td><input type="text" name="pcode"></td>
				</tr>
				<tr>
					<td>지점코드</td>
					<td><input type="text" name="scode"></td>
				</tr>
				<tr>
					<td>판매일자</td>
					<td><input type="text" name="sdate"></td>
				</tr>
				<tr>
					<td>피자코드</td>
					<td>
						<select name="pname">
							<option value="">피자선택</option>
							<option value="AA01">[AA01] 고르곤졸라피자</option>
							<option value="AA02">[AA02] 치즈피자</option>
							<option value="AA03">[AA03] 페페로니피자</option>
							<option value="AA04">[AA04] 콤비네이션피자</option>
							<option value="AA05">[AA05] 고구마피자</option>
							<option value="AA06">[AA06] 포테이토피자</option>
							<option value="AA07">[AA07] 불고기피자</option>
							<option value="AA08">[AA08] 나폴리피자</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>판매수량</td>
					<td><input type="number" name="amount"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="전표등록" onclick="subm()"> <input type="button" value="다시쓰기" onclick="rest()"></td>
				</tr>
			</table>
		</form>
		
		<script type="text/javascript">
			function subm() {
				if(form1.pcode.value=="") {
					alert("매출전표번호가 입력되지 않았습니다.");
					form1.pcode.focus();
					
					return false;
				} else if(form1.scode.value=="") {
					alert("지점코드가 입력되지 않았습니다.");
					form1.scode.focus();
					
					return false;
				} else if(form1.sdate.value=="") {
					alert("판매일자가 입력되지 않았습니다.");
					form1.sdate.focus();
					
					return false;
				} else if(form1.pname.selectedIndex<1) {
					alert("피자코드가 선택되지 않았습니다.");
					form1.pname.focus();
					
					return false;
				} else if(form1.amount.value=="") {
					alert("판매수량이 입력되지 않았습니다.");
					form1.amount.focus();
					
					return false;
				}
				alert("매출전표가 정상적으로 등록되었습니다!");
				document.form1.submit();
			}
			
			function rest() {
				alert("정보를 지우고 처음부터 다시 입력 합ㄴ니다!");
				document.form1.reset();
			}
		</script>
	</body>
</html>
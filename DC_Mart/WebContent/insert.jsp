<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<td>판매번호</td>
					<td><input type="text" name="ono"></td>
				</tr>
				<tr>
					<td>상품코드</td>
					<td><input type="text" name="pcode"></td>
				</tr>
				<tr>
					<td>판매날짜</td>
					<td><input type="text" name="pdate"></td>
				</tr>
				<tr>
					<td>점포코드</td>
					<td><input type="text" name="scode"></td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type="text" name="amount"></td>
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
				if(form1.ono.value=="") {
					alert("판매번호가 입력되지 않았습니다.");
					form1.ono.focus();
					
					return false;
				} else if(form1.pcode.value=="") {
					alert("상품코드가 입력되지 않았습니다.");
					form1.pcode.focus();
					
					return false;
				} else if(form1.pdate.value=="") {
					alert("판매날짜가 입력되지 않았습니다.");
					form1.pdate.focus();
					
					return false;
				} else if(form1.scode.value=="") {
					alert("점포코드가 입력되지 않았습니다.");
					form1.scode.focus();
					
					return false;
				} else if(form1.amount.value=="") {
					alert("수량이 입력되지 않았습니다.");
					form1.amount.focus();
					
					return false;
				}
				alert("판매 정보가 정상적으로 등록되었습니다.");
				document.form1.submit();
			}
			
			function rest() {
				alert("정보를 지우고 다시 씁니다.");
				document.form1.reset();
			}
		</script>
	</body>
</html>
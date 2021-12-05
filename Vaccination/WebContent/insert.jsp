<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h3>백신접종예약</h3>
		
		<form action="insert_post.jsp" method="post" name="form1">
			<table border="1">
				<tr>
					<td>접종예약번호</td>
					<td><input type="text" name="resvno">예) 20210001</td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="jumin">예) 710101-1000001</td>
				</tr>
				<tr>
					<td>백신코드</td>
					<td><input type="text" name="vcode">예) V001 ~ V003</td>
				</tr>
				<tr>
					<td>병원코드</td>
					<td><input type="text" name="hcode">예) H001</td>
				</tr>
				<tr>
					<td>예약일자</td>
					<td><input type="text" name="vdate">예) 20211231</td>
				</tr>
				<tr>
					<td>예약시간</td>
					<td><input type="text" name="vtime">예) 1230</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="등록" onclick="goinsert()"> <input type="button" value="다시쓰기" onclick="rest()"></td>
				</tr>
			</table>
		</form>
		
		<script type="text/javascript">
			function goinsert() {
				if(form1.resvno.value=="") {
					alert("접종예약번호가 입력되지 않았습니다.");
					form1.resvno.focus();
					
					return false;
				} else if(form1.jumin.value=="") {
					alert("주민번호가 입력되지 않았습니다.");
					form1.jumin.focus();
					
					return false;
				} else if(form1.vcode.value=="") {
					alert("백신코드가 입력되지 않았습니다.");
					form1.vcode.focus();
					
					return false;
				} else if(form1.hcode.value=="") {
					alert("병원코드가 입력되지 않았습니다.");
					form1.hcode.focus();
					
					return false;
				} else if(form1.vdate.value=="") {
					alert("예약 일자가 입력되지 않았습니다.");
					form1.vdate.focus();
					
					return false;
				} else if(form1.vtime.value=="") {
					alert("예약시간이 입력되지 않았습니다.");
					form1.vtime.focus();
					
					return false;
				}
				alert("접종예약정보가 등록 되었습니다!");
				document.form1.submit();
			}
			
			function rest() {
				alert("정보를 지우고 처음부터 다시 입력합니다!");
				document.form1.reset();
			}
		</script>
	</body>
</html>
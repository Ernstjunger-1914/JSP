
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>접종예약정보가 존재하지 않습니다!</h1>
		
		<input type="button" value="돌아가기" onclick="goback()">
		
		<script type="text/javascript">
			function goback() {
				location.href="index.jsp?section=select";
			}
		</script>
	</body>
</html>
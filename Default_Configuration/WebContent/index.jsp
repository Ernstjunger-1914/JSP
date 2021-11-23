<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String section=request.getParameter("section");
	
	if(section==null) {
		section="";
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Index</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp" />
		
		<section>
			<%
				switch(section) {
				case "select":
			%>
				<jsp:include page="select.jsp" />
			<%
					break;
				case "insert":
			%>
				<jsp:include page="insert.jsp" />
			<%
					break;
				case "rank":
			%>
				<jsp:include page="rank.jsp" />
			<%
					break;
				default:
			%>
				<jsp:include page="_index.jsp" />
			<%
				}
			%>
		</section>
		
		<jsp:include page="footer.jsp" />
	</body>
</html>
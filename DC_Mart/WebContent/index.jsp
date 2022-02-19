<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String section=request.getParameter("section");

	if(section==null) {
		section="";
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp" />
		
		<section>
		<%
			switch(section) {
			case "insert":
		%>
			<jsp:include page="insert.jsp" />
		<%
				break;
			case "select":
		%>
			<jsp:include page="select.jsp" />
		<%
				break;
			case "sselect":
		%>
			<jsp:include page="sselect.jsp" />
		<%
				break;
			case "dselect":
		%>
			<jsp:include page="dselect.jsp" />
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
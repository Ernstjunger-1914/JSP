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
		<title>Insert title here</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="nav.jsp"/>
		
		<section>
		<%
			switch(section) {
			case "insert":
		%>
			<jsp:include page="insert.jsp" />
		<%
				break;
			case "total":
		%>
			<jsp:include page="total.jsp" />
		<%
				break;
			case "sselect":
		%>
			<jsp:include page="sselect.jsp" />
		<%
				break;
			case "pselect":
		%>
			<jsp:include page="pselect.jsp" />
		<%
				break;
			default:
		%>
			<jsp:include page="_index.jsp" />
		<%
				break;
			}
		%>
		</section>
		
		<jsp:include page="footer.jsp" />
	</body>
</html>
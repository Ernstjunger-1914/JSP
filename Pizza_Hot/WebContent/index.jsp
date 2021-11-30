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
			}
		%>
		</section>
		
		<jsp:include page="footer.jsp" />
	</body>
</html>
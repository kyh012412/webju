<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
<%
	request.setAttribute("stringObj","문자열" );
	//key : stringObj value : 문자열
%>
<jsp:forward page="ObjectResult.jsp">
	<jsp:param name="firstNum" value="10"/>
</jsp:forward>
</body>
</html>
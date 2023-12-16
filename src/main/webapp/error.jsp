<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	에러페이지
	오류명 : <%=exception.getClass().getName() %><br>
	오류 메시지 : <%=exception.getMessage() %>
</body>
</html>
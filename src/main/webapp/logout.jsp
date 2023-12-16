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
			session.removeAttribute("userId");
			session.invalidate(); //모든 속성 한꺼번에 삭제
			response.sendRedirect("loginForm.jsp");		
		%>
	</body>
</html>
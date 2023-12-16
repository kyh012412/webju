<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>web.xml에서 맵핑 후 jsp에서 출력하기</h2>
<strong><%=request.getAttribute("message") %></strong> <br>
		<!-- ./현재폴더경로 -->
<a href="./HelloServlet.do">바로가기</a> <br>
<a href="./Annotation.do">바로가기</a>
</body>
</html>
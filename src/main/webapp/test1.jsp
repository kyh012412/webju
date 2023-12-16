<!-- 지시어 주석처리하는 방법
	 지시어 JSP 페이지를 자바 서블릿 코드로 변환하는데 필욯나 정보를 jsp 엔진에 알려주는 역할
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 스크립트 요소(선언부) -->
<%!
	String str="java code로 만든 문자열";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	test1.jsp<br>
	<!-- 스크립트 요소(표현식) -->
<%=str %>
	
</body>
</html>
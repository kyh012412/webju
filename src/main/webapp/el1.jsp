<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	el1.jsp <br>
	expression1.jsp
<!-- 
	el의 내장객체
	
	pageScope : page 영역
	RequestScope : request,response 영역
	sessionScope : session 영역
	applicationScope : application 영역
 -->
<%
 	pageContext.setAttribute("scopeValue", "page");
 	request.setAttribute("scopeValue", "request");
 	session.setAttribute("scopeValue", "session");
 	application.setAttribute("scopeValue", "application");
 	//공부하는 입장이라서 잠깐 이렇게 코딩
%>

<h2> scope 테스트 </h2>
<h3> 각 영역에 저장된 속성 읽기</h3>
<ul>
	<li>페이지 영역 : ${pageScope.scopeValue }</li>
	<li>리퀘스트 영역 : ${requestScope.scopeValue }</li>
	<li>세션 영역 : ${sessionScope.scopeValue }</li>
	<li>어플리케이션 영역 : ${applicationScope.scopeValue }</li>
	<li>디폴트 : ${scopeValue }</li>
</ul>
디폴트 : ${scopeValue }
	
	
</body>
</html>
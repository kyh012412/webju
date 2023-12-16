<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
강제오류발생
<%
		int calc = 10/0;
	
	
	//데이터베이스 커넥션 = connection(아이디,비밀번호,서버,서버포트);
	//이쪽에는 서버코드는 최대 한 넣지 않는 것을 지향
%>
<%=calc %>

</body>
</html>
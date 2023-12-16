<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 
			내장 객체 : jsp페이지가 실행될 때 컨테이너가 자동으로 생성해줌
					 별도로 선언하지 않고도 즉시 사용 가능
		 -->
		 <!-- 블랙리스트 -> 아이피 bot(crawler) 차단 -->
		 테이터 전송 방식 : <%=request.getMethod() %> <br>
		 URL : <%=request.getRequestURL() %> <br>
		 URI : <%=request.getRequestURI() %> <br>
		 프로토콜 : <%=request.getProtocol() %> <br>
		 서버명 : <%=request.getServerName() %> <br>
		 클라이언트 ip 주소 : <%=request.getRemoteAddr() %> <br>
		 쿼리스트링식 : <%=request.getQueryString() %> <br>
		 전송된 값 : <%=request.getParameter("test") %> <br>
		 <a href="http://192.168.1.101:8090/lecture/test5.jsp?test=hi">선생님아이피</a>
	</body>
</html>
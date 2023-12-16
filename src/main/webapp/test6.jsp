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
			 쿠키란 무엇인가? 쿠키는 클라이언트의 상태 정보를 유지하기 위한 기술
			 사용자가 방문한 웹페이지 정볼르 사용자의 컴퓨터에 저장
			 
			 쿠키의 사용목적 3가지
			 1.세션관리 : 서버에 저장해야 할 로그인,사용자 정보등 관리
			 2.개인화 : 테마 셋팅
			 3.트래킹 : 사용자 행동을 기록하고 분석하는 용도
			 
			 
			 쿠키와 세션의 차이 면접에서 많이물어봄
			 https://developer.mozilla.org/ko/docs/Web/HTTP/Cookies
		 -->
		 <%
		 Cookie cookie = new Cookie("mycookie","ok");//쿠키생성
		 cookie.setPath(request.getContextPath());//경로를 컨텍스트 루트로 지정
		 cookie.setMaxAge(3600);//유지기간 1시간
		 response.addCookie(cookie);//응답헤더에 쿠키 추가
 
		 %>
		 
		  <%
			 Cookie[] cookies = request.getCookies();//쿠키가져옴
			 if(cookies!=null){
				 for(Cookie c: cookies){
					 out.println(c.getName()+" / "+c.getValue()+"<br>");
					 out.println(c.getName()+" / "+c.getPath()+"<br>");
				 }
			 }
			 /*
			 JSESSIONID / 6882EBC64016387A02642DC01B6FADB8
			 mycookie / ok
			 */
		 
		 %>
	</body>
</html>
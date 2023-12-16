<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		/mvc1/WriteProcess.jsp
	<%@include file="../IsLoggedIn.jsp" %>
	<%
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setId(session.getAttribute("UserId").toString());
		
		//DAO객체 통해 DB에 DTO저장
		BoardDAO dao = new BoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		if(result ==1){
			response.sendRedirect("List.jsp");
		}else{
			JSFunction.alertBack("글쓰기 실패했습니다.", out);
		}
	%>
		
	</body>
</html>
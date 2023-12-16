<%@page import="utils.JSFunction"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
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
			String num = request.getParameter("num");
			BoardDAO dao = new BoardDAO();
			BoardDTO dto = new BoardDTO();
			dto = dao.selectView(num);
			
			String sessionId= session.getAttribute("UserId").toString();
			int delResult = 0;
			
			if(sessionId.equals(dto.getId())){
				dto.setNum(num);
				delResult = dao.deletePost(dto);
				dao.close();
				
				if(delResult==1){
					//1이면 정상
					JSFunction.alertLocation("게시글 정상 삭제됨", "List.jsp", out);
				}else{
					JSFunction.alertBack("게시글 삭제 실패", out);
				}
			}else{
				//작성자가 본인이 아닌 경우
				JSFunction.alertBack("게시글 삭제 실패(게시글 작성자가 아님 작성자만 삭제 가능)", out);
				return;
			}
		%>
	</body>
</html>
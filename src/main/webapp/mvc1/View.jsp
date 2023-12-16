<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function deletePost(){
				let confirmed = confirm('정말로 삭제하시겠습니까?');
				if(confirmed){
					var form = document.writeFrm;
					form.method = "post";
					form.action = "DeleteProcess.jsp";
					form.submit();//전송
				}
				
			}
		</script>
	</head>
	<body>
	mvc/View.jsp
		<%
			String num = request.getParameter("num"); //일련번호 받기
			
			BoardDAO dao = new BoardDAO();
			dao.updateVisitCount(num); // 조회수 증가
			BoardDTO dto = dao.selectView(num); // 게시물 가져오기
			dao.close();
		%>
		<jsp:include page="../common/Link.jsp"/>
		<h2>회원제 게시판 - 상세보기</h2>
		<form name="writeFrm">
			<input type="hidden" name="num" value="<%=num %>"/>
			<table border="1" width="90%" align="center">
				<tr>
					<td>번호</td>
					<td><%=dto.getNum() %></td>
					<td>작성자</td>
					<td><%=dto.getName() %></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td><%=dto.getPostdate() %></td>
					<td>조회수</td>
					<td><%=dto.getVisitcount() %></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3" height="100%">
						<%=dto.getTitle() %>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3" height="100%">
						<%=dto.getContent().replace("\r\n","<br>") %>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<button type="button" onclick="location.href='List.jsp';">
							목록보기
						</button>
						<%
							if(session.getAttribute("UserId")!=null 
							&& session.getAttribute("UserId").toString().equals(dto.getId())){
						%>
							<button type="button" onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">
							수정하기
							</button>
							<button type="button" onclick="deletePost();">
								삭제하기
							</button>
						<%	
							}
						%>
						
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
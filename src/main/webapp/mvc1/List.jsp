<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	List.jsp
	<%
//db connection
BoardDAO dao = new BoardDAO();
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
int totalNum2 = dao.selectCount(param);
List<BoardDTO> boardLists = dao.selectList(param);
dao.close();//db close
%>
	<jsp:include page="../common/Link.jsp" />
	<!-- 공통링크 호출 -->
	<h2 style="text-align: center">목록 보기</h2>
	<!-- 검색폼 -->
	<form method="get">
		<table border="1" width="90%" align="center">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchWord" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>

	<!-- 게시물 목록 -->
	<table border="1" width="90%" align="center">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<%
		if (boardLists.isEmpty()) {
		%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>
		<%
		} else {
		//게시물이 있을경우
		int virtualNum = 0; //화면상에서의 게시물 번호
		for (BoardDTO dto : boardLists) {
			virtualNum = totalNum2--; //전체게시물 수에서 시작해 1씩 감소
		%>
		<tr align="center">
			<td><%=virtualNum%></td>
			<!-- 게시물 번호 -->
			<td align="left"><a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle()%></a></td>
			<td align="center"><%=dto.getId()%></td>
			<td align="center"><%=dto.getVisitcount()%></td>
			<td align="center"><%=dto.getPostdate()%></td>
		</tr>
		<%
			}
		}
		%>
	</table>
	<!-- 목록 하단의 글쓰기 버튼  -->
	<table border="1" width="90%" align="center">
		<tr align="right">
			<td>
				<button type="button" onclick="location.href='Write.jsp';">글쓰기
				</button>
			</td>
		</tr>
	</table>

</body>
</html>
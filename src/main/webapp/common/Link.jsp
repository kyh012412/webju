<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
webapp/common/Link.jsp<br>
<!-- 로그인 여부에 따른 메뉴 변화 -->
<table border="1" width="90%" align="center">
	<tr>	
		<td align="center">
			<!-- scriptlet(스크립틀릿) -->
			<%
				if(session.getAttribute("UserId")==null){
			%>
				<a href="../loginForm.jsp">로그인</a>
			<%
				}else{
			%>
				<a href="../logout.jsp">로그아웃</a>
			<%
				}
			%>
			<a href="../mvc1/List.jsp">게시판</a>
		</td>
	</tr>
</table>

</body>
</html>
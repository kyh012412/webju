<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl.jsp</title>
</head>
<body>
<!-- 
	JSTL은 JSP Standard Tag Library의 약자로 JSP 표준 라이브러리
	JSP에서 자주 사용하는 기능(반복문,조건문,데이터 표현 등)을 미리 구현해 놓은 커스텀 태그 라이브러리 모음
-->


<table border="1" align="center">
<%for(int i=1;i<10;i++){%>
	<tr>
		<%for(int num=2;num<10;num++){%>
			<td style="text-align: center; padding: 10px;">
			<%=num%> * <%=i%> = <%=num*i %></td>
		<%}%>
	</tr>
<%}%>
</table>

<br>
<br>

<table border="1" align="center">
	<c:forEach begin="1" end="9" var="su">
		<tr>
			<c:forEach begin="2" end="9" var="dan">
				<td style="text-align: center; padding: 10px;">
					${dan} * ${su} = ${dan*su}
				</td>
			</c:forEach>
		</tr>
	</c:forEach>
</table>



</body>
</html>
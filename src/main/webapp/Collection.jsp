<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<h2>List컬렉션</h2>
<%
	List<Object> aList = new ArrayList<Object>();
	aList.add("청해진");
	aList.add(new Person("장보고",23));
	pageContext.setAttribute("Ocean", aList);
%>
<ul>
	<li>0번째 요소 :${Ocean[0]}</li>
	<li>1번째 요소 :${Ocean[1].name}</li>
	<li>1번째 요소 :${Ocean[1].age}</li>
	<li>2번째 요소 :${Ocean[2]}</li>
</ul>

</body>
</html>
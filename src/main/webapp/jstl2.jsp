<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl2</title>
</head>
<body>
<!-- 
	C:SEt 태그의 속성
	var : 변수명 설정
	value : 변수 할당 값
	scope : 영역
-->
<c:set var="directVar" value="100"/>
<c:set var="elVar" value="${directVar mod 3}"/>
<c:set var="expVar" value="<%=new Date() %>"/>
<c:set var="betweenVar">변수값 설정</c:set>

<h4>el을 이용해 변수 출력</h4>
directVar : ${pageScope.directVar} <br>
elVar : ${elVar} <br>
expVar : ${expVar} <br>
betweenVar : ${betweenVar} <br>
 
</body>
</html>
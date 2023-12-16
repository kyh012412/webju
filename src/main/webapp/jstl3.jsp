<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<c:set var="number" value="10"/>
	<c:set var="number2" value="3"/>
	<c:set var="string" value="JSP"/>
	
	<c:if test="${string eq 'java'}" var="result2">
		문자열은 java입니다. <br/><br/>
	</c:if>
	<c:if test="${not result2}">
		문자열은 java가 아닙니다. <br/><br/>
	</c:if>
	
	<c:if test="${number mod 2 eq 0}" var="result">
		${number}는 짝수<br/>
	</c:if>
		${result}는 결과값<br/><br/>
		
	<c:if test="${not (number2 mod 2 eq 0)}" var="result3">
		${number2}는 홀수<br/>
	</c:if>
		${result3}는 결과값<br/><br/>
		
	<c:if test="${not (number mod 2 eq 0)}" var="result">
		${number}는 짝수<br/>
	</c:if>
		${result}는 결과값<br/><br/>
		
	<c:if test="${not (not (number2 mod 2 eq 0))}" var="result3">
		${number2}는 홀수<br/>
	</c:if>
		${result3}는 결과값<br/><br/>	
</body>
</html>
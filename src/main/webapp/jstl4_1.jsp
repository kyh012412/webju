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
	<!--  method="post" -->
	<form>
		국어 : <input type="number" value="${param.kor}" name="kor" required="required"/><br/>
		영어 : <input type="text" value="${param.eng}" name="eng" required="required"/><br/>
		수학 : <input type="text" value="${param.math}" name="math" /><br/>
		<input type="submit" value="학점구하기"/>
	</form>
	
	<c:if test="${not (empty param.kor or empty param.eng or empty param.math)}">
		<c:set var="avg" value="${(param.kor+param.eng+param.math)/3}" />
		평균 점수는 ${avg} <br/>
		<c:choose>
			<c:when test="${avg >=90}">A학점</c:when>
			
			<c:when test="${avg >=80}">B학점</c:when>
			
			<c:when test="${avg >=70}">C학점</c:when>
			
			<c:when test="${avg >=60}">D학점</c:when>
			
			<c:otherwise>F학점</c:otherwise>
		</c:choose>
	</c:if>
	
	<!-- method="post" -->
	<form >
		<input type="number" value="${param.val}" name="val" max="10" min="1" step="0.01">
		
		<input type="submit" value="계산">
	</form>
	
	<c:if test="${not empty param.val}">
		<c:choose>
			<c:when test="${param.val%2==0}">
				입력한 값은 짝수입니다.
			</c:when>
			
			<c:otherwise>
				입력한 값은 홀수입니다.
			</c:otherwise>
		</c:choose>
	</c:if>
</body>
</html>
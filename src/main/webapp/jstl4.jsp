<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		function func1(){
			let id = document.getElementById('input_id');
			let value = Number(id.value.trim());
			let ans_id = document.getElementById('ans');
			
			console.log(value);
			if(value%2==0){
				ans_id.innerHTML='짝수입니다.';
			}else if(value%2==1){
				ans_id.innerHTML='홀수입니다.';
			}else{
				ans_id.innerHTML='문자열입니다.';
			}
		}
	</script>
</head>

<body>
	<c:set var="number" value="100"/>
	
	<h4>choose 태그로 홀짝 판단하기</h4>
	
	<c:choose>
	
		<c:when test="${number mod 2 eq 0}">
			${number}는 짝수
		</c:when>
		
		<c:when test=""/>
		
		<c:otherwise>
			${number}는 홀수
		</c:otherwise>
	</c:choose>
	
	<input type="text" id="input_id" oninput="func1()">
	<div id="ans"></div>
	<input type="button" value="수동으로 연산요청하기" onclick="func1()">
</body>

</html>
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
	int num1=5;
	pageContext.setAttribute("num2", 2);
	pageContext.setAttribute("num3", 3);
	pageContext.setAttribute("num4", 4);
%>
	<h3>변수 선언 및 할당</h3>
	스크립틀릿에서 선언한 변수 : ${num1} <br>
	page영역에 선언한 변수 : ${num2} <br>
	변수 할당 및 즉시 출력 : ${num1=7} <br>
	변수 할당 및 별도 출력 : ${num2 = 8; '' } => ${num2 }<br>
	
	<h3>산술연산자</h3>
	num1+num2 : ${num1+num2}<br>
	num1-num2 : ${num1-num2}<br>
	num1*num2 : ${num1*num2}<br><br>
	
	num1/num2 : ${num1/num2}<br>
	num1 div num2 : ${num1 div num2}<br><br>
	
	num1%num2 : ${num1 % num2}<br>
	num1 mod num2 : ${num1 mod num2}<br>
	
	<h3>비교 연산자(num1 : 7, num2 : 8)</h3>
	num1 > num2 : ${num1 gt num2} <br>
	num1 < num2 : ${num1 lt num2} <br>
	num1 >= num2 : ${num1 ge num2} <br>
	num1 <= num2 : ${num1 le num2} <br>
	num1 == num2 : ${num1 eq num2} <br>
	num1 != num2 : ${num1 ne num2} <br>
	
</body>
</html>
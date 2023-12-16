<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function validateForm(form){
				if(!form.user_id.value){
					alert('아이디 입력');
					return false;
				}
				
				if(!form.user_pwd.value){
					alert('비밀번호 입력');
					return false;
				}
				//false가 뜨면 서브밋x
			}
		</script>
		
	</head>
	<body>
	
		<h2>로그인 페이지</h2>
	<!-- 세션이 없는경우에만 이페이지를 보여줘야함 -->
	<%
		if(session.getAttribute("UserId")==null){
	%>
		<form action="loginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
			<!-- form을 한번 체크하고 보냄 -->
			 아이디 : <input type="text" name="user_id">
			 패스워드 : <input type="password" name="user_pwd">
			 <input type="submit" value="login">
			 <!-- 타입이 submit인 버튼이 눌릴때 -->
		</form>
		
	<%
		}else{
			
	%>
		<%=session.getAttribute("UserId") %> 회원님, 로그인 완료<br>
		<a href="logout.jsp">로그아웃</a>
	<%	
		} 
	%>
		
		
		
	</body>
</html>
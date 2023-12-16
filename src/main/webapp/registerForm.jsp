<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>로그인 메뉴 화면</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
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
	<!-- 세션이 없는경우에만 이페이지를 보여줘야함 -->
	<%
		if(session.getAttribute("UserId")==null){
	%>
	<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form  action="registerProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);" class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-13">
						회원가입
					</span>
<!-- 
					<a href="#" class="btn-face m-b-20">
						<i class="fa fa-facebook-official"></i>
						bookFace
					</a>

					<a href="#" class="btn-google m-b-20">
						<img src="images/icons/icon-google.png" alt="GOOGLE">
						gleGoo
					</a>
-->
					<!-- 1 -->

					<div class="p-t-31 p-b-9">
						<span class="txt1">
							유저명
						</span>

						<a href="#" class="txt2 bo1 m-l-5">
							아이디 찾기
						</a>
					</div>
					
					<!-- 유저명넣는곳 -->
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<input class="input100" type="text" name="user_id" >
						<span class="focus-input100"></span>
					</div>
					
					<!-- 1 -->
					<!-- 2 -->
					
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							비밀번호
						</span>

						<a href="#" class="txt2 bo1 m-l-5">
							비밀번호 찾기
						</a>
					</div>
					
					<!-- 유저 비밀번호 넣는곳 -->
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="user_pwd" >
						<span class="focus-input100"></span>
					</div>
					
					<!-- 2 -->
					
					<!-- 3 -->
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							비밀번호 확인
						</span>

						<a href="#" class="txt2 bo1 m-l-5">
							<!-- 비밀번호 찾기 -->
							<!-- 여기에 알림창같은거 -->
						</a>
					</div>
					
					<!-- 유저 비밀번호 확인 넣는곳 -->
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="user_pwd_check" >
						<span class="focus-input100"></span>
					</div>
					
					<!-- 3 -->
					
					<!-- 4 -->
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							이메일
						</span>

						<a href="#" class="txt2 bo1 m-l-5">
							<!-- 비밀번호 찾기 -->
							<!-- 여기에 알림창같은거 -->
						</a>
					</div>
					
					<!-- 유저 이메일 넣는곳 -->
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="text" name="user_email" >
						<span class="focus-input100"></span>
					</div>					
					<!-- 4 -->
					
					
					

					<div class="container-login100-form-btn m-t-17 p-t-10">
						<button class="login100-form-btn">
							회원가입~
						</button>
					</div>

					<div class="w-full text-center p-t-55">
						<span class="txt2">
							당장 회원가입 해야겠죠?
						</span>

						<a href="loginForm.jsp" class="txt2 bo1">
							&nbsp;로그인
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}else{
	%>
		<%=session.getAttribute("UserId") %> 회원님, 로그인 완료<br>
		<a href="logout.jsp">로그아웃</a>
	<%	
		} 
	%>

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
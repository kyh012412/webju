<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBCConnect"%>
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
		String userId = request.getParameter("user_id");
		String userPass = request.getParameter("user_pwd");
		
		//db연결
		JDBCConnect jdbc = new JDBCConnect();
		
		//쿼리문 생성
		String sql = "select * from web.member where id=? and pass=?";
		
		try{
			PreparedStatement pstmt = jdbc.conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			pstmt.setString(2, userPass);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				session.setAttribute("UserId", rs.getString(1));//세션생성
			}		
			jdbc.close();
			response.sendRedirect("loginForm.jsp");
			
		}catch(Exception e){
			response.sendRedirect("loginForm.jsp");
		}
		
	%>
	<!-- jsp 디버깅 서버스탑하고 -->
	</body>
</html>
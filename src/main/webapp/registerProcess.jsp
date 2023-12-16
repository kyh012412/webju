<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="common.JDBCConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%
			/*
			CREATE TABLE member(
				id varchar(100) NOT NULL,
				pass varchar(100) NOT NULL,
				name varchar(100) NOT NULL,
				regdate DATE DEFAULT sysdate NOT null,
				PRIMARY key(id)
			)
			*/
		
			//db에 연결
			JDBCConnect jdbc = new JDBCConnect();
			String id = request.getParameter("user_id");
			String pass = request.getParameter("user_pwd");
			String passcheck = request.getParameter("user_pwd_check");
			String email = request.getParameter("user_email");
			if(!pass.equals(passcheck)){
				response.sendRedirect("loginForm.jsp");
			}
			
			//쿼리문 생성
			String sql = "insert into web.member values(?,?,?,sysdate)";
			PreparedStatement pstmt = jdbc.conn.prepareStatement(sql);			

			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, email);
			
			//쿼리 수행
			int result = pstmt.executeUpdate();
			out.println(result+" 행이 입력됨");
			response.sendRedirect("loginForm.jsp");
			jdbc.close();
		%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		
	</body>
</html>
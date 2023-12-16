<%@page import="javax.swing.JButton"%>
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
			String id = "test2";
			String pass = "1234";
			String name = "테스트1회원";
			
			//쿼리문 생성
			String sql = "insert into web.member values(?,?,?,sysdate)";
			PreparedStatement pstmt = jdbc.conn.prepareStatement(sql);			

			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			
			//쿼리 수행
			int result = pstmt.executeUpdate();
			out.println(result+" 행이 입력됨");
			jdbc.close();
		%>
	</body>
</html>
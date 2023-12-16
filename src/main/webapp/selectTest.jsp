<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBCConnect"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	<%
		//db에 연결
		JDBCConnect jdbc = new JDBCConnect();
		
		//쿼리문 생성
		String sql = "select id,pass,name,regdate from web.member";
		Statement stmt = jdbc.conn.createStatement();
		
		//쿼리수행
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String id = rs.getString(1);
			String pass = rs.getString(2);
			String name = rs.getString(3);
			Date date  = rs.getDate(4);
			out.println(String.format("%s %s %s %s",id,pass,name,date)+"<br>");
		}
		jdbc.close();
	
		/*
		jdbc 프로그래밍
		1.JDBC 드라이버 로드
		2.데이터베이스 연결
		3.쿼리문 작성
		4.쿼리문 객체 생성
		5.쿼리 실행
		6.실행 결과 처리
		7.연결 해제
		*/
	%>
	</body>
</html>

<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%!
			public Connection con;
			//state ment import할때 sql쪽으로
			public Statement stmt;
			public PreparedStatement psmt;
			public ResultSet rs;
		%>
		<%
			//1.ojdbc 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
		
			//2.db연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "system";
			String pass = "1111";
			try{
				con = DriverManager.getConnection(url,id,pass);
				out.println("connection 성공");
			}catch(Exception e){
				out.println(e.getMessage());
			}finally{
				//close하지 않으면 메모리가 꽉차서 memory leak 현상 발생 (메모리 누수라는 뜻)
				if(rs!=null){
					rs.close();
				}
				if(stmt!=null){
					stmt.close();
				}
				if(psmt!=null){
					psmt.close();
				}
				if(con!=null){
					con.close();
				}
			}
		%>
		
		
	</body>
</html>
package common;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCConnect {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	//기본 생성자
	public JDBCConnect() {
		try {
			//1.jdbc 드라이버 로드
			//Class.forName("oracle.jdbc.OracleDriver");
			Class.forName("org.postgresql.Driver");
	
			//2.db연결

			//postgresql 셋팅
			String url = "jdbc:postgresql://20.196.201.69:15432/testdb"; 
			String id = "testuser";
			String pass= "testuser";
			
			//기존 oracle 세팅
//			String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
//			String id = "system";
//			String pass= "1111";
			
			conn = DriverManager.getConnection(url,id,pass);
			System.out.println("connection success");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	//재활용을 위해서 메서드화
	public void close() {
		try {
			if(rs!=null){
				rs.close();
			}
			if(stmt!=null){
				stmt.close();
			}
			if(pstmt!=null){
				pstmt.close();
			}
			if(conn!=null){
				conn.close();
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
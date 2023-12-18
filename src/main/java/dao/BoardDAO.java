package dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBCConnect;
import dto.BoardDTO;

public class BoardDAO extends JDBCConnect{
	public BoardDAO() {
		super();
	}

	// 게시물 목록 가져오기
	public List<BoardDTO> selectList(Map<String, Object> map){
		//결과리턴
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		//게시물의 목록 반환
//		String query = "select * from web.board";
		String query = "select * from testdb.public.board";
		if(map.get("searchWord")!=null) {
			query+=" where "+map.get("searchField")+" "+"Like '%"+
					map.get("searchWord")+"%'";
		}
		query+=" order by num desc";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				//date transfer object
				BoardDTO dto =  new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				bbs.add(dto);
			}
		}catch(Exception e) {
			System.out.println("!게시물 조회중 에러 발생");
			e.printStackTrace();
			System.out.println("게시물 조회중 에러 발생!");
		}finally {
			
		}
		
		return bbs;
	}
	
	// 검색 조건에 맞는 게시물의 개수를 반환.(숙제)
	public int selectCount(Map<String, Object> map) {
		int totalCount =0;
		//게시물 개수 반환
		//게시물의 목록 반환
//		String query = "select count(*) totalcount from web.board";
		String query = "select count(*) totalcount from testdb.public.board";
		if(map.get("searchWord")!=null) {
			query+=" where "+map.get("searchField")+" "+"Like '%"+
					map.get("searchWord")+"%'";
		}
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				totalCount = Integer.parseInt(rs.getString("totalcount"));						;
			}		
		}catch(Exception e) {
			System.out.println("!게시물 조회중 에러 발생");
			e.printStackTrace();
			System.out.println("게시물 조회중 에러 발생!");
		}finally {
			
		}
		//System.out.println("예상되는 totalcount:"+totalCount);
		return totalCount;
	}
	
	//게시글 데이터를 받아 dB에 추가(글쓰기)
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		try {
//			String query = "insert into web.board("
			String query = "insert into testdb.public.board("
					+ "num,title,content,id,visitcount,postdate) "
					+ " values ( "
					+ "web.seq_board_num.nextval,?,?,?,0,sysdate)";
			//시퀀스에도 스키마.이 필요
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//상세보기에 조회수 증가
	public void updateVisitCount(String num) {
//		String query = "update web.board set "
		String query = "update testdb.public.board set "
				+ " visitcount = visitcount+1 "
				+ " where num=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, num);
//			pstmt.setInt(1, Integer.parseInt(num));
			int res = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
		
		
	}
	
	//상세보기
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		String query = "select b.*,m.name "
				//public.member가 없음 필요
				+ " from testdb.public.member m inner join testdb.public.board b "
				+ " on m.id = b.id "
				+ " where num=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println("상세보기 데이터 db조회중 문제가 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//지정한 게시물 삭제
	public int deletePost(BoardDTO dto) {
		int result =0;
		try {
			String query = "delete from testdb.public.board where num=?";
//			String query = "delete from web.board where num=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getNum());
			result=pstmt.executeUpdate();
					
		}catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}

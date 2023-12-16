package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBCConnect2;

public class MVCBoardDAO2 extends JDBCConnect2 {
    public MVCBoardDAO2() {
        super();
    }

    // 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) cnt FROM public.mvcboard";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        }
        catch (Exception e) {
            System.out.println("게시물 카운트 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount;
    }

    // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
    public List<MVCBoardDTO> selectListPage(Map<String,Object> map) {
        List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
        String query = "SELECT * FROM ( "
                + "    SELECT Tb.*, ROW_NUMBER() OVER () AS rNum FROM ( "
                + "        SELECT * FROM public.mvcboard ";

        if (map.get("searchWord") != null) {
        	query += " WHERE " + map.get("searchField")
	              + " LIKE '%" + map.get("searchWord") + "%' ";
        }
	
		  query += "        ORDER BY idx DESC "
				  + "    ) Tb "
				  + ") "
				  + "WHERE rNum BETWEEN ? AND ?";
		  
        try {
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, map.get("start").toString());
            pstmt.setString(2, map.get("end").toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MVCBoardDTO dto = new MVCBoardDTO();

                dto.setIdx(rs.getString(1));
                dto.setName(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setContent(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setOfile(rs.getString(6));
                dto.setSfile(rs.getString(7));
                dto.setDowncount(rs.getInt(8));
                dto.setPass(rs.getString(9));
                dto.setVisitcount(rs.getInt(10));

                board.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return board;
    }
    
    public int insertWrite(MVCBoardDTO dto) {
    	int result = 0;
    	try {
    		String query = "INSERT INTO web.mvcboard (idx, name, title, content, ofile, sfile, pass) "
    	             + "VALUES (DEFAULT, ?, ?, ?, ?, ?, ?)";
    		pstmt = conn.prepareStatement(query);
    		pstmt.setString(1, dto.getName());
    		pstmt.setString(2, dto.getTitle());
    		pstmt.setString(3, dto.getContent());
    		pstmt.setString(4, dto.getOfile());
    		pstmt.setString(5, dto.getSfile());
    		pstmt.setString(6, dto.getPass());
//    		rs = pstmt.executeQuery();
//    		while(rs.next()) {
//    			result=1;
//    		}
    		result = pstmt.executeUpdate();
    	}catch(Exception e) {
    		System.out.println("게시물 입력 중 예외 발생");
    		e.printStackTrace();
    	}
    	
    	return result;
    }

}
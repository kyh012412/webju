package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;

//서블릿 -> mvc2 컨트롤러
//서블릿 url 맵핑? web.xml
public class ListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MVCBoardDAO2 dao = new MVCBoardDAO2();
		
		//뷰(jsp)에 전달할 매개변수 저장용 맵 생성
		HashMap<String, Object> map = new HashMap<String, Object>();

		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		int totalCount = dao.selectCount(map); //게시물 개수
		
		/*페이징 처리 start*/
		ServletContext application = getServletContext();
		
		//한 페이지에 몇 개의 글이 나오는가
//		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int pageSize = 10;
		
		// 한 화면에 보여질 페이지 리스트 개수
//		int blockPage = Integer.parseInt(application.getInitParameter("POSTS_PER_BLOCK"));
		int blockPage = 3;
		
		//현재 페이지 확인
		int pageNum=1; //기본값
		String pageTemp = req.getParameter("pageNum");
		if(pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		//목록에 출력할 게시물 범위 계산
		int start = (pageNum -1)*pageSize+1; //첫 게시물 번호
		int end = pageNum*pageSize;//마지막 게시물 번호
		map.put("start", start);
		map.put("end", end);
		/* 페이징 처리 end */
		
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);		
		dao.close();
		
		//뷰에 전달할 매개변수 추가
		String pagingImg = BoardPage.pagingStr(totalCount,pageSize,blockPage,pageNum,"../mvcboard/list.do");
		
		//바로가기 영역 HTML 문자열
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		//전달할 데이터를 request영역에 저장 후 List.jsp 포워드
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("../mvc2/List.jsp").forward(req, resp);
	}
}

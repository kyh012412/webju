package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

public class WrtieController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/mvc2/Write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//포스트방식으로 오면
		//1.파일 업로드 처리
		//업로드 디렉토리의 물리적 경로 확인
		String saveDirectroy = req.getServletContext().getRealPath("/Uploads");
		
		// 파일 업로드
		String originalFileName="";
		try {
			originalFileName = FileUtil.uploadFile(req,saveDirectroy);
		}catch(Exception e) {
			JSFunction.alertLocation(resp, "파일 업로드 오류", "../mvcboard/write.do");
		}
		
		// 2.파일 업로드 외 처리
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(req.getParameter("name"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setPass(req.getParameter("pass"));
		
		//원본 파일명과 저장된 파일 이름 설정
		if(originalFileName != "") {
			String savedFileName = FileUtil.renameFile(saveDirectroy, originalFileName);
			dto.setOfile(originalFileName);
			dto.setSfile(savedFileName);
		}
		
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		if(result >0) {
			resp.sendRedirect("../mvcboard/list.do");
		}else {
			JSFunction.alertLocation(resp, "글쓰기에  실패했씁니다.", "../mvcboard/write.do");
		}
		
	}
}

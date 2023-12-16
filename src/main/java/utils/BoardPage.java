package utils;

//페이지바로가기 영역 HTML 문자열 출력
public class BoardPage {
	public static String pagingStr(int totalCount, int pageSize,int blockPage,int pageNum,String regUrl) {
		String pagingStr = "";
		
		//전체 페이지수 계산;
		int totalPages  = (int)(Math.ceil(((double)totalCount/pageSize)));
		
		//이전 페이지 블록 바로가기
		int pageTemp =(pageNum-1)/blockPage *blockPage +1;
		if(pageTemp!= 1) {
			pagingStr+="<a href='" + regUrl+ "?pageNum=1'>[첫 페이지]</a>";
			pagingStr+="&nbsp";
			pagingStr+="<a href='" + regUrl+ "?pageNum="+(pageTemp-1)+"'>[이전 블록]</a>";
			
		}
		//각 페이지 번호 출력
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <=totalPages) {
			if(pageTemp ==pageNum) {
				pagingStr += "&nbsp;"+pageTemp+"&nbsp;";
			}else {
				pagingStr += "&nbsp;<a href='"+regUrl+"?pageNum="+pageTemp+"'>"+pageTemp+"</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		
		//다음 페이지 블록 바로가기 출력
		if(pageTemp<=totalPages) {
			pagingStr+="<a href='" + regUrl+ "?pageNum="+(pageTemp)+"'>[다음 블록]</a>";
			pagingStr+="&nbsp";
			pagingStr+="<a href='" + regUrl+ "?pageNum="+totalPages+"'>[마지막 페이지]</a>";
		}
		
		return pagingStr;
	}

}
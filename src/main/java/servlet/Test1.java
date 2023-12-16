package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * 서블릿이란 클라이언트의 요청에 대해 동적으로 작동하는 웹 어플리케이션 컴포넌트
 * MVC모델에서 컨트롤러 역할
 * 모든 메서드는 스레드로 동작
 * 
 */
//서블릿이 되기위해서는 HttpServlet을 extends해줘야 함

//서블릿의 기본형태
public class Test1 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
}

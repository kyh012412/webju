<%@page import="utils.JSFunction"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	////String fullPath = request.getServletContext().getRealPath("/");
	//System.out.println(fullPath);
	//로그인 여부 확인.
	//로그인 정보가 없을 때 로그인 페이지로 이동시킴.
	if(session.getAttribute("UserId") ==null){
		JSFunction.alertLocation("로그인 후 이용해 주십시오", "../loginForm.jsp", out);
		return;
	}
%>
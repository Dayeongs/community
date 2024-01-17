<%@page import="vo.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	/*
		요청 URL
			localhost/comm/checkId.jsp?id=xxx
		요청 파라미터
			id=xxx
	*/
	
	String id = request.getParameter("id");
	
	UserDao userDao = new UserDao();
	User savedUser = userDao.getUserById(id);
	
	if (savedUser != null) {
		out.write("exist");
	} else {
		out.write("none");
	}
%>
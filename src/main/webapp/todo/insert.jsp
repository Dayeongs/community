<%@page import="dao.TodoDao"%>
<%@page import="vo.User"%>
<%@page import="vo.Todo"%>
<%@page import="vo.TodoCategory"%>
<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
	if (loginUser == null) {
		response.sendRedirect("../loginform.jsp?error=deny");
		return;
	}

	int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
	String title = request.getParameter("title");
	String expectedDate = request.getParameter("expectedDate");
	String content = request.getParameter("content");
	
	Todo todo = new Todo();
	todo.setTitle(title);
	todo.setExpectedDate(expectedDate);
	todo.setContent(content);
	
	TodoCategory todoCategory = new TodoCategory();
	todoCategory.setNo(categoryNo);
	todo.setCategory(todoCategory);
	
	User user = new User();
	user.setNo(loginUser.getNo());
	todo.setUser(user);
	
	TodoDao todoDao = new TodoDao();
	todoDao.insertTodo(todo);
	
	response.sendRedirect("list.jsp");
	
%>













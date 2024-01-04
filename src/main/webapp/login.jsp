<%@page import="dto.LoginUser"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="vo.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		요청 URL
			localhost/comm/login.jsp
		요청 파라미터
			요청메세지의 바디부
			id=xxx&password=xxx
	*/
	
	// 1. 요청파라미터값을 조회한다.
	String id = request.getParameter("id");
	String rawPassword = request.getParameter("password");
	
	// 2. COMM_USERS 테이블에 대한 CRUD 기능이 구현된 UserDao객체를 생성한다.
	UserDao userDao = new UserDao();
	
	// 3. UserDao 객체의 getUserById(String id)를 실행해서 아이디에 해당하는 사용자정보를 조회한다.
	User savedUser = userDao.getUserById(id);
	
	// 4. 아이디에 해당하는 사용자정보가 존재하는지 체크한다.
	if (savedUser == null) {	// 사용자 정보가 존재하지 않는다.
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	// 5. 탈퇴한 사용자인지 체크한다.
	if ("Y".equals(savedUser.getDeleted())) {	// 탈퇴한 사용자다.
		response.sendRedirect("loginform.jsp?error=deleted");
		return;
	}
	
	// 6. 비밀번호가 일치하는지 체크한다.
	String shaPassword = DigestUtils.sha256Hex(rawPassword);
	if (!savedUser.getPassword().equals(shaPassword)) {	// 비밀번호가 일치하지 않는다.
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	// 7. 사용자 인증작업이 완료된 사용자정보를 세션객체에 속성으로 저장한다.
	LoginUser loginUser = new LoginUser();
	loginUser.setNo(savedUser.getNo());
	loginUser.setId(savedUser.getId());
	loginUser.setName(savedUser.getName());
	
	session.setAttribute("LOGIN_USER", loginUser);
	
	// 8. index.jsp를 재요청하는 응답을 보낸다.
	response.sendRedirect("index.jsp");
%>


























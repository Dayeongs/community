<%@page import="dto.LoginUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
		요청 URL
			localhost/comm/include/navbar.jsp?menu=xxx
		요청 파라미터
			menu=xxx
		
		* navbar.jsp를 include하는 모든 JSP 페이지는
		  navbar.jsp를 include할 때 menu를 요청파라미터값으로 전달한다.
	*/
	
	// 요청파라미터 조회하기
	String menu = request.getParameter("menu");	

	// 내비게이션바에서 로그인여부에 따라서 표시되는 메뉴를 다르게 표시하기
	/*
		1. HttpSession객체에 "LOGIN_USER"라는 이름으로 저장된 속성값을 조회한다.
			+ 속성값이 조회되면 인증이 완료된 사용자의 요청이다.
			  * login.jsp에서 인증요청(로그인요청)을 받아서 인증이 완료된 사용자는
			    HttpSession 객체에 "LOGIN_USER"라는 속성명으로 
			    				 LoginUser객체를 속성값으로 저장한다.
			+ 속성값이 null이면 인증을 받지 않은 사용자의 요청이다.
			
	*/
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");
%>    
    
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="/community/index.jsp">샘플 커뮤니티</a>
		<ul class="navbar-nav me-auto">
			<li class="nav-item">
				<a class="nav-link <%="home".equals(menu) ? "active" : "" %>" href="/community/index.jsp">홈</a>
			</li>
			<li class="nav-item">
				<a class="nav-link <%="board".equals(menu) ? "active" : "" %>" href="/community/board/list.jsp">게시판</a>
			</li>
			<li class="nav-item">
				<a class="nav-link <%="todo".equals(menu) ? "active" : "" %>" href="/community/todo/list.jsp">일정관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link <%="file".equals(menu) ? "active" : "" %>" href="/community/file/list.jsp">파일게시판</a>
			</li>
		</ul>
<%
	if (loginUser != null) {
%>		
		<span class="navbar-text me-3 small"><strong  class="text-white"><%=loginUser.getName() %></strong>님 환영합니다.</span>
<%
	}
%>		
		<ul class="navbar-nav">
<%
	if (loginUser == null) {
%>
			<li class="nav-item">
				<a class="nav-link <%="login".equals(menu) ? "active" : "" %>" href="/community/loginform.jsp">로그인</a>
			</li>
			<li class="nav-item">
				<a class="nav-link <%="register".equals(menu) ? "active" : "" %>" href="/community/registerform.jsp">회원가입</a>
			</li>
<%
	} else {
%>		
			<li class="nav-item">
				<a class="nav-link" href="/community/logout.jsp">로그아웃</a>
			</li>
			<li class="nav-item">
				<a class="nav-link <%="user".equals(menu) ? "active" : "" %>" href="/community/user/info.jsp">마이 페이지</a>
			</li>
<%
	}
%>
		</ul>
	</div>
</nav>

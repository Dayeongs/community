<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		요청 URL
			localhost/community/board/modify.jsp
		요청 파라미터
			no=xxx&page=xxx&title=xxx&content=xxx
			* 요청메세지의 바디부에 포함되어 전달된다.
	*/
	
	// 1. 요청파라미터 조회하기
	int no = Integer.valueOf(request.getParameter("no"));
	int currentPage = Integer.valueOf(request.getParameter("page"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 2. BoardDao 객체 생성
	BoardDao boardDao = new BoardDao();
	
	// 3. 게시글 상세정보 조회
	Board savedBoard = boardDao.getBoardByNo(no);
	
	// 4. 수정폼에서 요청파라미터로 전달해준 값으로 게시글 정보를 수정한다.
	savedBoard.setTitle(title);
	savedBoard.setContent(content);
	
	// 5. 변경된 내용이 포함된 Board객체를 전달해서 데이터베이스에 반영시킨다.
	boardDao.updateBoard(savedBoard);
	
	// 6. 수정된 게시글을 확인할 수 있는 detail.jsp를 재요청하는 응답을 보낸다.
	response.sendRedirect("detail.jsp?no=" + no + "&page=" + currentPage);
%>
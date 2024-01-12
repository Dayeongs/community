<%@page import="dto.LoginUser"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>커뮤니티</title>
</head>
<body>
<%--
	<jsp:include page="포함시킬 JSP 경로" />
		+ JSP 액션태그다.
		+ 지정된 JSP 페이지를 이 JSP에 포함시킨다.
		+ <jsp:param />태그를 포함할 수 있다.
 --%>
<jsp:include page="include/navbar.jsp">
	<jsp:param value="home" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-9 bg-light p-5">
			<h1>샘플 커뮤니티</h1>
			<p>회원가입, 로그인/로그아웃, 게시판/댓글, 검색, 첨부파일 업로드/다운로드</p>
		</div>
		<div class="col-3">
<%
	Set<LoginUser> set = (Set<LoginUser>) application.getAttribute("LOGIN_USERS");
%>
			<div class="card">
				<div class="card-header">현재 접속한 사용자</div>
				<div class="card-body">
<%
	if (set == null || set.isEmpty()) {
%>					
					<p class="card-text">로그인된 사용자가 없습니다.</p>
<%
	} else {
%>					
					<ul class="list-group">
<%
	for (LoginUser loginUser : set) {
%>
						<li class="list-group-item"><%=loginUser.getName() %></li>
<%
	}
%>
					</ul>
<%
	}
%>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@page import="utils.DateUtils"%>
<%@page import="java.util.List"%>
<%@page import="vo.Todo"%>
<%@page import="dto.LoginUser"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Pagination"%>
<%@page import="dao.TodoDao"%>
<%@page import="utils.NumberUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>커뮤니티::일정 목록</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="todo" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>일정 목록</h1>
<%
	LoginUser loginUser = (LoginUser) session.getAttribute("LOGIN_USER");	

	int currentPage = NumberUtils.toInt(request.getParameter("page"), 1);
	
	TodoDao todoDao = new TodoDao();
	int totalRows = todoDao.getTotalRows();
	
	Pagination pagination = new Pagination(currentPage, totalRows);
	Map<String, Object> param = new HashMap<>();
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());

	List<Todo> todoList = todoDao.getTodos(param);
%>	
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="*">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th>처리예정일</th>
						<th>제목</th>
						<th>처리상태</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
<%
	if (todoList.isEmpty()) {
%>
					<tr>
						<td colspan="5" class="text-center">등록된 일정이 없습니다.</td>
					</tr>
<%
	} else {
		for (Todo todo : todoList) {
%>
					<tr>
						<td><%=todo.getCategory().getName() %></td>
						<td><%=todo.getExpectedDate() %></td>
						<td><%=todo.getTitle() %></td>
						<td><%=todo.getStatus() %></td>
						<td><%=DateUtils.toText(todo.getCreatedDate()) %></td>
					</tr>				
<%
		}
	}
%>			
				</tbody>
			</table>
<%
	int beginPage = pagination.getBeginPage();
	int endPage = pagination.getEndPage();
	
	boolean isFirst = pagination.isFirst();
	boolean isLast = pagination.isLast();
%>		
			<nav>
				<ul class="pagination justify-content-center">
<%
	if (isFirst) {
%>
					<li class="page-item">
						<a class="page-link disabled">이전</a>
					</li>
<%
	} else {
%>
					<li class="page-item">
						<a class="page-link" href="list.jsp?page=<%=currentPage - 1 %>">이전</a>
					</li>		
<%
	}
%>
<%
	for (int num = beginPage; num <= endPage; num++) {
%>
					<li class="page-item <%=currentPage == num ? "active" : "" %>">
						<a class="page-link" href="list.jsp?page=<%=num %>"><%=num %></a>
					</li>
<%
	}
%>
<%
	if (isLast) {
%>
					<li class="page-item">
						<a class="page-link disabled">
							다음
						</a>
					</li>
<%
	} else {
%>	
					<li class="page-item">
						<a class="page-link" href="list.jsp?page=<%=currentPage + 1 %>">
							다음
						</a>
					</li>
<%		
	}
%>			
				</ul>
			</nav>
<%
	if (loginUser != null) {
%>	
			<div class="text-end">
				<a class="btn btn-outline-primary" href="form.jsp">새 일정</a>
			</div>
<%
	} else {
%>
			<div class="text-end">
				<a class="btn btn-outline-primary disabled" aria-disabled="true" >새 일정</a>
			</div>
<%
	}
%>
		</div>
	</div>
</div>
</body>
</html>
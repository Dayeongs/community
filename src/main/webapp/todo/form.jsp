<%@page import="vo.TodoCategory"%>
<%@page import="java.util.List"%>
<%@page import="dao.TodoCategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>커뮤니티::일정폼</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="todo" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>새 일정 등록폼</h1>
<%
	/*
		일정카테고리 표시하기
			1. 모든 일정카테고리를 조회한다.
			2. 조회된 일정카테고리로 아래의 옵션태그를 생성한다.
	*/
	TodoCategoryDao todoCategoryDao = new TodoCategoryDao();
	List<TodoCategory> todoCategoryList = todoCategoryDao.getAllCategories();
%>			
			<form class="border bg-light p-3" method="post" action="insert.jsp">
				<div class="form-group mb-3">
					<label class="form-label">구분</label>
					<select class="form-select" name="categoryNo">
<%
	for (TodoCategory todoCategory : todoCategoryList) {
%>
						<option value="<%=todoCategory.getNo() %>"> <%=todoCategory.getName() %></option>
<%
	}
%>
					</select>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="title" />
				</div>
				<div class="form-group mb-3">
					<label class="form-label">예정일자</label>
					<input type="date" class="form-control" name="expectedDate" />
				</div>
				<div class="form-group mb-3">
					<label class="form-label">내용</label>
					<textarea rows="10" class="form-control" name="content"></textarea>
				</div>
				<div class="text-end">
					<a class="btn btn-secondary" href="list.jsp">취소</a>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
















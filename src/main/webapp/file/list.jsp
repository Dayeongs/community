<%@page import="utils.DateUtils"%>
<%@page import="vo.FileBoard"%>
<%@page import="java.util.List"%>
<%@page import="dao.FileBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>커뮤니티::파일게시판</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>파일 게시판</h1>
			
<%
	FileBoardDao fileBoardDao = new FileBoardDao();
	// 모든 파일게시글 정보를 조회한다.
	List<FileBoard>	fileBoardList = fileBoardDao.getFileBoards();
%>
			
			<table class="table">
			<colgroup>
				<col width="15%">
				<col width="*">
				<col width="15%">
				<col width="15%">
				<col width="25%">
			</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
<%
	for (FileBoard fb : fileBoardList) {
%>
				<tr>
					<td><%=fb.getNo() %></td>
					<td><%=fb.getTitle() %></td>
					<td><%=fb.getUser().getName() %></td>
					<td><%=DateUtils.toText(fb.getCreatedDate()) %></td>
					<td>
						<a href="download?no=<%=fb.getNo() %>"><%=fb.getRealFileName() %></a>
					</td>
				</tr>
<%
	}
%>
				</tbody>
			</table>
			
			<div class="text-end">
				<a href="form.jsp" class="btn btn-primary">새 파일 등록</a>
			</div>
			
		</div>
	</div>
</div>
</body>
</html>
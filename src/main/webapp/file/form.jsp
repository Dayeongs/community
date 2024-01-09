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
<title>커뮤니티::파일등록폼</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>파일 게시판 등록폼</h1>
			
			<form class="border bg-light p-3" method="post" action="insert" enctype="multipart/form-data">
				<div class="form-group mb-3">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="title">
				</div>
				<div class="form-group mb-3">
					<label class="form-label">설명</label>
					<textarea rows="5" class="form-control" name="description"></textarea>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">첨부파일</label>
					<input type="file" class="form-control" name="upfile">
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
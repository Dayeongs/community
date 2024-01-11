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
<title>커뮤니티::에러 페이지</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="home" name="menu"/>
</jsp:include>	
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="alert alert-danger">
				<h1>에러 페이지</h1>
				<p>유효한 주소가 아닙니다.</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>커뮤니티:: 회원가입 완료</title>
</head>
<body>
<jsp:include page="include/navbar.jsp">
	<jsp:param value="register" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="border p3 pg-light">
				<h1>회원가입 완료</h1>
				<p>회원가입이 완료되었습니다.</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>
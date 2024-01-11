<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"%>
<%--
	<%@ page isErrorPage="true"%>
		이 jsp에서 Throwable 타입의 exception 내장객체를 사용할 수 있게 한다.
		주로, 에러페이지에서 오류 정보를 출력하기 위해 예외객체가 필요하다.
		위의 설정을 추가하면 JSP에서 발생한 오류객체를 exception 내장객체로 제공받을 수 있다.
 --%>
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
				<h1>서버 오류</h1>
				<p>요청을 처리하는 도중 서버에 오류가 발생하였습니다.</p>
				<p>잠시 기다린 후 다시 시도해보시기 바랍니다.</p>
				<p>오류가 계속 발생하면 고객센터로 문의하기시 바랍니다.</p>
				<p>오류 메세지: <%=exception.getMessage() %></p>
			</div>
		</div>
	</div>
</div>	
</body>
</html>
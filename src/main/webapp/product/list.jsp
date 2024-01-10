<%@page import="utils.DateUtils"%>
<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<title>커뮤니티::상품</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="product" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>상품 목록</h1>
<%
	ProductDao productDao = new ProductDao();
	
	// 전체 상품목록 조회하기
	List<Product> productList = productDao.getAllProducts();
%>			
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>제조사</th>
						<th>가격</th>
						<th>상태</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
<%
	for (Product product : productList) {
%>
					<tr>
						<td><%=product.getNo() %></td>
						<td><a href="detail.jsp?no=<%=product.getNo() %>"><%=product.getName() %></a></td>
						<td><%=product.getCompany().getName() %></td>
						<td><%=product.getPrice() %> 원</td>
						<td><%=product.getStatus().getName() %></td>
						<td><%=DateUtils.toText(product.getCreatedDate()) %></td>
					</tr>
<%
	}
%>
				</tbody>
			</table>
			
			<div class="text-end">
				<a href="form.jsp" class="btn btn-primary">새 상품 등록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<%@page import="vo.Event"%>
<%@page import="java.util.List"%>
<%@page import="utils.DateUtils"%>
<%@page import="vo.Product"%>
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
<title>커뮤니티::상품상세</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="product" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>상품 상세</h1>
<%
	/*
		요청 URL
			localhost/community/product.detail.jsp?no=xxx
		요청 파라미터
			no=xxx 상품번호
	*/
	
	// 요청파라미터 조회
	int no = Integer.valueOf(request.getParameter("no"));

	ProductDao productDao = new ProductDao();
	
	// 상품상제정보 조회
	// Product -> no=상품번호, name=상품이름, price=상품가격, discountPrice=할인가격,
	// 			  description=상품설명, stock=재고수량]
	//			  cat=ProductCategory[no=0, name=카테고리명]
	//			  company=Company[no=0, name=회사명, tel=null, city=null]
	//			  status=Products[no=0, name=상태명]
	Product product = productDao.getProductByNo(no);
	
	// 이 상품과 관련된 이벤트목록조회
	List<Event> eventList = productDao.getEventByProductNo(no);
%>			
			<table class="table">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr>
						<th>상품번호</th>
						<td><%=product.getNo()%></td>
						<th>카테고리</th>
						<td><%=product.getCat().getName() %></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><%=product.getName() %></td>
						<th>제조회사</th>
						<td><%=product.getCompany().getName() %></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><%=product.getPrice() %> 원</td>
						<th>할인가격</th>
						<td><%=product.getDiscountPrice() %> 원</td>
					</tr>
					<tr>
						<th>재고수량</th>
						<td><%=product.getStock() %> 개</td>
						<th>상태</th>
						<td><%=product.getStatus().getName() %></td>
					</tr>
					<tr>
						<th>등록일자</th>
						<td><%=DateUtils.toText(product.getCreatedDate()) %></td>
						<th>수정일자</th>
						<td><%=DateUtils.toText(product.getUpdatedDate()) %></td>
					</tr>
					<tr>
						<th>이벤트내용</th>
						<td colspan="3">
<%
	for (Event event : eventList) {
%>
							<span class="badge text-bg-secondary me-3"><%=event.getTitle() %></span>
<%
	}
%>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div>
				<a href="modifyform.jsp?no=<%=no %>" class="btn btn-warning">수정</a>
				<a href="delete.jsp?no=<%=no %>" class="btn btn-danger">삭제</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>
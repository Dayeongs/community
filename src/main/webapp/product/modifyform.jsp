<%@page import="vo.Product"%>
<%@page import="vo.Event"%>
<%@page import="vo.ProductStatus"%>
<%@page import="vo.Company"%>
<%@page import="vo.ProductCategory"%>
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
<title>커뮤니티::상품게시판</title>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="product" name="menu"/>
</jsp:include>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h1>상품정보 수정화면</h1>

<%
	ProductDao productDao = new ProductDao();
	// 상품카테고리 정보 조회
	List<ProductCategory> catList = productDao.getAllProductCategories();
	// 제조회사 정보 조회
	List<Company> compList = productDao.getAllCompanies();
	// 상품상태 정보 조회
	List<ProductStatus> statusList = productDao.getAllProductStatus();
	// 이벤트 정보 조회
	List<Event> eventList = productDao.getAllEvents();
	
	int no = Integer.valueOf(request.getParameter("no"));
	
	// 상품상제정보 조회
	// Product -> no=상품번호, name=상품이름, price=상품가격, discountPrice=할인가격,
	// 			  description=상품설명, stock=재고수량]
	//			  cat=ProductCategory[no=0, name=카테고리명]
	//			  company=Company[no=0, name=회사명, tel=null, city=null]
	//			  status=Products[no=0, name=상태명]
	Product product = productDao.getProductByNo(no);
	List<Event> productEventList = productDao.getEventByProductNo(no);
	
	product.setEvents(productEventList);
%>	
			<form class="border bg-light p-3" 
				method="post" 
				action="modify.jsp">
				
				<input type="hidden" name="no" value="<%=product.getNo() %>" />
				
				<div class="form-group mb-3">
					<label class="form-label">카테고리</label>
					<select class="form-select" name="catNo">
<%
	for (ProductCategory cat : catList) {
%>
						<option value="<%=cat.getNo() %>" <%=cat.getNo() == product.getCat().getNo() ? "selected" : "" %>><%=cat.getName() %></option>
<%
	}
%>
					</select>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">제조회사</label>
					<select class="form-select" name="comNo">
<%
	for (Company comp : compList) {
%>
						<option value="<%=comp.getNo() %>" <%=comp.getNo() == product.getCompany().getNo() ? "selected" : "" %>><%=comp.getName() %></option>
<%
	}
%>
					</select>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">상품상태</label>
					<div>
<%
	for (ProductStatus status : statusList) { 
%>
						<div class="form-check form-check-inline">
  							<input class="form-check-input" type="radio" name="statusNo" value="<%=status.getNo() %>"
  								<%=status.getNo() == product.getStatus().getNo() ? "checked" : "" %>>
  							<label class="form-check-label" ><%=status.getName() %></label>
						</div>
<%
	}
%>					
					</div>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">상품이름</label>
					<input type="text" class="form-control" name="name" value="<%=product.getName() %>"/>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">상품가격</label>
					<input type="text" class="form-control" name="price" value="<%=product.getPrice() %>"/>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">상품할인가격</label>
					<input type="text" class="form-control" name="discountPrice" value="<%=product.getDiscountPrice() %>" />
				</div>
				<div class="form-group mb-3">
					<label class="form-label">상품설명</label>
					<textarea rows="3" class="form-control" name="description"><%=product.getDescription() %></textarea>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">이벤트</label>
					<div>
<%
	for (Event event : eventList) {
%>
						<div class="form-check form-check-inline">
  							<input class="form-check-input" type="checkbox" name="eventNo" value="<%=event.getNo() %>"
  								<%=product.hasEvent(event.getNo()) ? "checked" : "" %>>
  							<label class="form-check-label" ><%=event.getTitle() %></label>
						</div>
<%
	}
%>
					</div>
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>
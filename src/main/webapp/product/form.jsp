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
			<h1>상품정보 입력폼</h1>
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
%>			
			<form class="border bg-light p-3" 
				method="post" 
				action="insert.jsp"
				onsubmit="return checkForm();">
				<div class="form-group mb-3">
					<label class="form-label">카테고리</label>
					<select class="form-select" name="catNo">
						<option value=""> 카테고리를 선택하세요.</option>
<%
	for (ProductCategory cat : catList) {
%>
						<option value="<%=cat.getNo() %>"><%=cat.getName() %></option>
<%
	}
%>
					</select>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">제조회사</label>
					<select class="form-select" name="comNo">
						<option value=""> 제조회사를 선택하세요.</option>
<%
	for (Company company : compList) {
%>
						<option value="<%=company.getNo() %>"> <%=company.getName() %></option>
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
  							<input class="form-check-input" type="radio" name="statusNo" value="<%=status.getNo() %>">
  							<label class="form-check-label" ><%=status.getName() %></label>
						</div>
<%
	}
%>
					</div>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">상품이름</label>
					<input type="text" class="form-control" name="name" />
				</div>
				<div class="form-group mb-3">
					<label class="form-label">상품가격</label>
					<input type="number" class="form-control" name="price" value="0" />
				</div>
				<div class="form-group mb-3">
					<label class="form-label">상품할인가격</label>
					<input type="number" class="form-control" name="discountPrice" value="0" />
				</div>
				<div class="form-group mb-3">
					<label class="form-label">상품설명</label>
					<textarea rows="3" class="form-control" name="description"></textarea>
				</div>
				<div class="form-group mb-3">
					<label class="form-label">이벤트</label>
					<div>
<%
	for (Event event : eventList) {
%>
						<div class="form-check form-check-inline">
  							<input class="form-check-input" type="checkbox" name="eventNo" value="<%=event.getNo() %>">
  							<label class="form-check-label" ><%=event.getTitle() %></label>
						</div>
<%
	}
%>
					</div>
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	function checkForm() {
		let catSelect = document.querySelector("select[name=catNo]");
		let companySelect = document.querySelector("select[name=comNo]");
		let checkedStatusCheckbox = document.querySelector("input[name=statusNo]:checked");
		let nameInput = document.querySelector("input[name=name]");
		let priceInput = document.querySelector("input[name=price]");
		let discountPriceInput = document.querySelector("input[name=discountPrice]");
		let descriptionInput = document.querySelector("textarea[name=description]");
		let checkedEventCheckboxes = document.querySelectorAll("input[name=eventNo]:checked");
		
		// 카테고리 선택체크
		let catNo = catSelect.value;
		if (!catNo) {
			alert("상품 카테고리를 선택하세요");
			catSelect.focus();
			return false;
		}
		
		// 제조회사 선택체크
		let comNo = companySelect.value;
		if (!comNo) {
			alert("제조회사를 선택하세요");
			companySelect.focus();
			return false;
		}
		
		// 상품상태 라디오 체크여부 조사
		// if(!checkedStatusCheckbox)
		if(checkedStatusCheckbox === null) {
			alert("상품의 상태를 체크하세요");
			return false;
		}
		
		// 상품이름 입력체크
		let name = nameInput.value;
		if (name === "") {
			alert("상품이름은 필수입력값입니다.");
			nameInput.focus();
			return false;
		}
		
		// 상품가격, 상품할인가격 체크
		let price = priceInput.value;
		let discountPrice = discountPriceInput.value;
		
		if (price === "") {
			alert("상품 가격을 입력하세요");
			priceInput.focus();
			return false;
		}
		if (discountPrice === "") {
			alert("상품 할인가격을 입력하세요");
			discountPriceInput.focus();
			return false;
		}
		
		price = parseInt(price);
		discountPrice = parseInt(discountPrice);
		if (price < discountPrice) {
			alert("할인가격은 가격보다 작거나 같은 값으로 입력하세요.");
			discountPriceInput.focus();
			return false;
		}
		
		let description = descriptionInput.value;
		if (description === "") {
			alert("설명은 필수입력값입니다.");
			descriptionInput.focus();
			return false;
		}
		
		// 이벤트 체크박스의 체크된 갯수를 조사
		// checkedEventCheckboxes -> [checkbox엘리먼트, checkbox엘리먼트, ...]
		let checkedEventCount = checkedEventCheckboxes.length;
		if (checkedEventCount === 0){
			alert("이벤트는 하나이상 체크해야 합니다.");
			return false;
		}
		
		return true;
	}

</script>
</body>
</html>
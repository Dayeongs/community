<%@page import="vo.ProductEvent"%>
<%@page import="vo.Event"%>
<%@page import="dao.ProductDao"%>
<%@page import="vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		요청 URL
			localhost/community/product/modify.jsp
		요청 파라미터
			no=xxx
			&catNo=xxx
			&comNo=xxx
			&statusNo=xxx
			&name=xxx
			&price=xxx
			&discountPrice=xxx
			&description=xxx
			&eventNo=xxx&eventNo=xxx
	*/
	
	// 요청파라미터를 조회한다.
	int no = Integer.parseInt(request.getParameter("no"));
	int catNo = Integer.parseInt(request.getParameter("catNo"));
	int comNo = Integer.parseInt(request.getParameter("comNo"));
	int statusNo = Integer.parseInt(request.getParameter("statusNo"));
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));
	String description = request.getParameter("description");
	String[] eventNoArr = request.getParameterValues("eventNo");
	
	ProductDao productDao = new ProductDao();
	
	// 데이터베이스에서 수정된 상품정보를 조회한다.
	Product product = productDao.getProductByNo(no);
	// 요청파라미터로 전달받은 수정된 정보를 Product 객체에 담는다.
	product.getCat().setNo(catNo);
	product.getCompany().setNo(comNo);
	product.getStatus().setNo(statusNo);
	product.setName(name);
	product.setPrice(price);
	product.setDiscountPrice(discountPrice);
	product.setDescription(description);
	
	// 수정폼에서 변경한 정보가 포함된 상품객체를 전달해서 데이터베이스에 반영시킨다.
	productDao.updateProduct(product);
	
	// 해당상품과 관련되어 저장된 기존 이벤트 정보를 전부 삭제한다.
	productDao.deleteProductEventsByProductNo(no);
	
	// 수정폼에서 다시 체크한 이벤트번호를 새로 추가한다.
	for (String value : eventNoArr) {
		int evnetNo = Integer.parseInt(value);
		Event event = new Event();
		event.setNo(evnetNo);
		
		ProductEvent productEvent = new ProductEvent();
		productEvent.setProduct(product);
		productEvent.setEvent(event);
		
		productDao.insertProductEvent(productEvent);
	}
	
	// 상품 상세화면을 요청하는 URL을 재요청하게 하는 응답을 보낸다.
	response.sendRedirect("detail.jsp?no=" + no);
%>
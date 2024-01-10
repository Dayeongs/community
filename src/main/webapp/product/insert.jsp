<%@page import="vo.ProductEvent"%>
<%@page import="vo.Event"%>
<%@page import="dao.ProductDao"%>
<%@page import="vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		요청 URL
			localhost/community/product/insert.jsp
		요청 파라미터
			catNo=xxx
			&comNo=xxx
			&statusNo=xxx
			&name=xxx
			&price=xxx
			&discountPrice=xxx
			&description=xxx
			&eventNo=xxx&eventNo=xxx&eventNo=xxx
			
		String 		getParameter(String name)
						지정된 요청파라미터 이름으로 값 하나를 조회해서 반환한다.
		String[] 	getparameterValues(String name)
						지정된 요청파라미터 이름으로 조회되는 모든 값을 배열에 순서대로 담아서 반환한다.
	*/
	
	int catNo = Integer.valueOf(request.getParameter("catNo"));
	int comNo = Integer.valueOf(request.getParameter("comNo"));
	int statusNo = Integer.valueOf(request.getParameter("statusNo"));
	String name = request.getParameter("name");
	int price = Integer.valueOf(request.getParameter("price"));
	int discountPrice = Integer.valueOf(request.getParameter("discountPrice"));
	String description = request.getParameter("description");
	
	// 복수개 선택가능한 체크박스로 제출되는 값은 최종적으로 그 값을 배열로 획득할 수 있다.
	// eventNoArr -> {"7001", "7002", "7004"}
	String[] eventNoArr = request.getParameterValues("eventNo");
	
	// Product클래스의 정적 메소드 createProduct(값, 값, 값, ...)을
	// 실행해서 요청파라미터 값이 채워진 Product객체 생성하기
	// 카테고리, 제조사, 상태, 이름, 가격, 할인가격, 설명 정보가 담겨있다.
	Product product = Product.createProduct(catNo, comNo, statusNo, name, price, discountPrice, description);
	
	ProductDao productDao = new ProductDao();
	
	// 상품번호용 일련번호를 조회해서 반환받는다.
	int no = productDao.getProductNo();
	// 상품번호, 카테고리, 제조사, 상태, 이름, 가격, 할인가격, 설명 정보가 담겨있다.
	product.setNo(no);	
	
	// 신규상품정보를 저장한다.
	productDao.insertProduct(product);
	
	// 체크된 이벤트 정보를 상품정보와 함께 저장한다.
	for(String value : eventNoArr) {
		int eventNo = Integer.valueOf(value);
		
		Event event = new Event(); // 이벤트정보(이벤트번호, 이벤트제목, 설명)
		event.setNo(eventNo);
		
		ProductEvent productEvent = new ProductEvent(); // 해당 상품의 이벤트 정보
		productEvent.setProduct(product);
		productEvent.setEvent(event);
		// ProductEvent는 상품정보(no=상품번호, cat=카테고리정보, company=제조사정보, ...)
		//				 이벤트정보(no=이벤트번호, title=null, description=null)
		// 가 담겨있다.
		
		productDao.insertProductEvent(productEvent);
	}
	
	// 상품목록을 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("list.jsp");
%>

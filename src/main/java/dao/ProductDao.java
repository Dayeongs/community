package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.Company;
import vo.Event;
import vo.Product;
import vo.ProductCategory;
import vo.ProductEvent;
import vo.ProductStatus;

public class ProductDao {
	
	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();
	
	@SuppressWarnings("unchecked")
	public List<ProductCategory> getAllProductCategories() throws SQLException {
		return (List<ProductCategory>) ibatis.queryForList("products.getAllProductCategories");
	}
	
	@SuppressWarnings("unchecked")
	public List<Company> getAllCompanies() throws SQLException {
		return (List<Company>) ibatis.queryForList("products.getAllCompanies");
	}
	
	@SuppressWarnings("unchecked")
	public List<ProductStatus> getAllProductStatus() throws SQLException {
		return (List<ProductStatus>) ibatis.queryForList("products.getAllProductStatus");
		
	}

	@SuppressWarnings("unchecked")
	public List<Event> getAllEvents() throws SQLException {
		return (List<Event>) ibatis.queryForList("products.getAllEvents");
	}
	
	/**
	 * 새 상품의 상품번호로 사용할 시퀀스 번호를 조회해서 반환한다.
	 * @return 새 상품번호
	 * @throws SQLException
	 */
	public int getProductNo() throws SQLException {
		return (Integer) ibatis.queryForObject("products.getProductNo");
	}
	
	/**
	 * 새 상품정보를 전달받아서 데이터베이스에 저장시킨다.
	 * @param product 새 상품정보(번호, 이름, 카테고리, 제조사, 상태, 가격, 할인가격, 설명)
	 * @throws SQLException
	 */
	public void insertProduct(Product product) throws SQLException {
		ibatis.insert("products.insertProduct", product);
	}
	
	/**
	 * 새 상품과 관련된 이벤트 정보를 전달받아서 데이터베이스에 저장시킨다.
	 * @param productEvent 새 상품이벤트 정보(상품번호, 이벤트번호)
	 * @throws SQLException
	 */
	public void insertProductEvent(ProductEvent productEvent) throws SQLException {
		ibatis.insert("products.insertProductEvent", productEvent);
	}
	
	/**
	 * 모든 상품정보를 반환한다.
	 * @return 상품정보가 포함된 목록
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Product> getAllProducts() throws SQLException {
		return (List<Product>) ibatis.queryForList("products.getAllProducts");
	}
	
	/**
	 * 지정된 상품번호의 상세 상품정보를 조회해서 반환한다.
	 * @param no 조회할 상품번호
	 * @return 상품정보
	 * @throws SQLException
	 */
	public Product getProductByNo(int no) throws SQLException {
		return (Product) ibatis.queryForObject("products.getProductByNo", no);
	}
	
	/**
	 * 지정된 상품번호의 상품과 관련된 모든 이벤트를 조회해서 반환한다.
	 * @param ProductNo 상품번호
	 * @return 해당 상품과 관련된 이벤트 목록
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Event> getEventByProductNo(int ProductNo) throws SQLException {
		return (List<Event>) ibatis.queryForList("products.getEventByProductNo", ProductNo);
	}
	
}

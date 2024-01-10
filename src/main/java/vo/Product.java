package vo;

import java.util.Date;
import java.util.List;

public class Product {
	
	private int no;
	private String name;
	private ProductCategory cat;
	private Company company;
	private int price;
	private int discountPrice;
	private String description;
	private ProductStatus status;
	private int stock;
	private Date updatedDate;
	private Date createdDate;
	
	private List<Event> events;

	public Product() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ProductCategory getCat() {
		return cat;
	}

	public void setCat(ProductCategory cat) {
		this.cat = cat;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ProductStatus getStatus() {
		return status;
	}

	public void setStatus(ProductStatus status) {
		this.status = status;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	public List<Event> getEvents() {
		return events;
	}
	
	public void setEvents(List<Event> events) {
		this.events = events;
	}
	
	public boolean hasEvent(int eventNo) {
		for (Event event : events) {
			if(event.getNo() == eventNo) {
				return true;
			}
		}
		return false;
	}
	
	public static Product createProduct(int catNo, int comNo, int statusNo,
		String name, int price, int discountPrice, String description) {
		
		ProductCategory cat = new ProductCategory();
		cat.setNo(catNo);
		
		Company company = new Company();
		company.setNo(comNo);
		
		ProductStatus status = new ProductStatus();
		status.setNo(statusNo);
		
		Product product = new Product();
		product.setCat(cat);
		product.setCompany(company);
		product.setStatus(status);
		product.setName(name);
		product.setPrice(price);
		product.setDiscountPrice(discountPrice);
		product.setDescription(description);
		
		return product;	
	}

	@Override
	public String toString() {
		return "Product [no=" + no + ", name=" + name + ", cat=" + cat + ", company=" + company + ", price=" + price
				+ ", discountPrice=" + discountPrice + ", description=" + description + ", status=" + status
				+ ", stock=" + stock + ", updatedDate=" + updatedDate + ", createdDate=" + createdDate + "]";
	}
	
}

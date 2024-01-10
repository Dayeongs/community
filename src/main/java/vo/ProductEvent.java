package vo;

public class ProductEvent {
	
	private Product product;
	private Event event;
	
	public ProductEvent() {}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	@Override
	public String toString() {
		return "ProductEvent [product=" + product + ", event=" + event + "]";
	}

}

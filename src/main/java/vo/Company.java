package vo;

public class Company {
	
	private int no;
	private String name;
	private String tel;
	private String city;
	
	public Company() {}

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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Company [no=" + no + ", name=" + name + ", tel=" + tel + ", city=" + city + "]";
	}

}

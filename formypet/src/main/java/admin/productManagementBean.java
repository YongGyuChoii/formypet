package admin;

public class productManagementBean {
	
	private String productName;
	private int productOrderCount;
	private int productPrice;
	private String delYn;
	
	
	public String getProductName() {
		return productName;
	}
	public int getProductOrderCount() {
		return productOrderCount;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public String getDelYn() {
		return delYn;
	}
	
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public void setProductOrderCount(int productOrderCount) {
		this.productOrderCount = productOrderCount;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	
	
	
}
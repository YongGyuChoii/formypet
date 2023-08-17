package admin;

public class ExpendsManagementBean {
		
	private int ordersKey; // orders db
	private int memOrderKey; //주문번호 키 mem_order db
	private int nonMemOrderKey; //non_mem_order db
	private int productKey; //상품 번호 product db
	private int categoryKey; //카테고리 키 <- product db 에서 가져옴 
	private int oPrice; //orders db 최종 금액
	private String productName; //상품 이름 product db 별칭 쓰자
	
	
	
	
	
	public int getOrdersKey() {
		return ordersKey;
	}
	public int getMemOrderKey() {
		return memOrderKey;
	}
	public int getNonMemOrderKey() {
		return nonMemOrderKey;
	}
	public int getProductKey() {
		return productKey;
	}
	public int getCategoryKey() {
		return categoryKey;
	}
	public int getoPrice() {
		return oPrice;
	}
	public String getProductName() {
		return productName;
	}
	public void setOrdersKey(int ordersKey) {
		this.ordersKey = ordersKey;
	}
	public void setMemOrderKey(int memOrderKey) {
		this.memOrderKey = memOrderKey;
	}
	public void setNonMemOrderKey(int nonMemOrderKey) {
		this.nonMemOrderKey = nonMemOrderKey;
	}
	public void setProductKey(int productKey) {
		this.productKey = productKey;
	}
	public void setCategoryKey(int categoryKey) {
		this.categoryKey = categoryKey;
	}
	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	

	}

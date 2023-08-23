package admin;

public class ExpendsManagementBean {
		
	private int ordersKey; // orders db
	private String memOrderKey; //주문번호 키 mem_order db
	private String nonMemOrderKey; //non_mem_order db
	private int productKey; //상품 번호 product db
	private int categoryKey; //카테고리 키 <- product db 에서 가져옴 
	private int oPrice; //orders db 최종 금액
	private String productName; //상품 이름 product db 별칭 쓰자
	private int memKey;
	private String pDate;
	
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public int getMemKey() {
		return memKey;
	}
	public void setMemKey(int memKey) {
		this.memKey = memKey;
	}
	public int getOrdersKey() {
		return ordersKey;
	}
	public String getMemOrderKey() {
		return memOrderKey;
	}
	public String getNonMemOrderKey() {
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
	public void setMemOrderKey(String memOrderKey) {
		this.memOrderKey = memOrderKey;
	}
	public void setNonMemOrderKey(String nonMemOrderKey) {
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

package admin;

public class ExpendsManagementBean {
	
	private int expendsKey; //매출 번호
	private int memKey; //회원 번호
	private int productKey; //상품 번호 product db
	private int categoryKey; //카테고리 키 <- product db 에서 가져옴 
	private int memOrderKey; //주문번호 키 mem_order db
	private String productName; //상품 이름 product db
	//private int oCount; //주문 수량
	private int productPrice; //상품 가격 mem_order db
	private String pDate; //주문 날짜 mem_order db
	
	public int getExpendsKey() {
		return expendsKey;
	}
	public int getMemKey() {
		return memKey;
	}
	public int getProductKey() {
		return productKey;
	}
	public int getCategoryKey() {
		return categoryKey;
	}
	public int getMemOrderKey() {
		return memOrderKey;
	}
	public String getProductName() {
		return productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public String getpDate() {
		return pDate;
	}
	public void setExpendsKey(int expendsKey) {
		this.expendsKey = expendsKey;
	}
	public void setMemKey(int memKey) {
		this.memKey = memKey;
	}
	public void setProductKey(int productKey) {
		this.productKey = productKey;
	}
	public void setCategoryKey(int categoryKey) {
		this.categoryKey = categoryKey;
	}
	public void setMemOrderKey(int memOrderKey) {
		this.memOrderKey = memOrderKey;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	

	}

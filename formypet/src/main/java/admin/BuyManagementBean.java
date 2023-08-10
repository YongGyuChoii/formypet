package admin;

public class BuyManagementBean {
	
	private int brKey; 
	private int memKey;
	private int productKey;
	private String memOrderKey;
	private String nonMemOrderKey;
	private int ordersKey;
	private String rYn; //환불 승인 거절
	private String subject; //환불 이유 나중에 바꿀 예정
	private int num;//나중에 추가 할 예정
	
	
	private String productName;
	public int getBrKey() {
		return brKey;
	}
	public int getMemKey() {
		return memKey;
	}
	public int getProductKey() {
		return productKey;
	}
	public String getMemOrderKey() {
		return memOrderKey;
	}
	public String getNonMemOrderKey() {
		return nonMemOrderKey;
	}
	public int getOrdersKey() {
		return ordersKey;
	}
	public String getrYn() {
		return rYn;
	}
	public String getSubject() {
		return subject;
	}
	public int getNum() {
		return num;
	}
	public String getProductName() {
		return productName;
	}
	public void setBrKey(int brKey) {
		this.brKey = brKey;
	}
	public void setMemKey(int memKey) {
		this.memKey = memKey;
	}
	public void setProductKey(int productKey) {
		this.productKey = productKey;
	}
	public void setMemOrderKey(String memOrderKey) {
		this.memOrderKey = memOrderKey;
	}
	public void setNonMemOrderKey(String nonMemOrderKey) {
		this.nonMemOrderKey = nonMemOrderKey;
	}
	public void setOrdersKey(int ordersKey) {
		this.ordersKey = ordersKey;
	}
	public void setrYn(String rYn) {
		this.rYn = rYn;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	


}
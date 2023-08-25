package order;




public class NoMemOrderBean {
	
    private int ordersKey;
 
   
    private int productKey;
    private int oCount;
    private int oPrice;
    private String oStatus;
    private int oPoint;
    private String reviewYn;
    private String optionValue;
	 
   

	public int getOrdersKey() {
		return ordersKey;
	}
	public void setOrdersKey(int ordersKey) {
		this.ordersKey = ordersKey;
	}

	public int getProductKey() {
		return productKey;
	}
	public void setProductKey(int productKey) {
		this.productKey = productKey;
	}
	public int getoCount() {
		return oCount;
	}
	public void setoCount(int oCount) {
		this.oCount = oCount;
	}
	public int getoPrice() {
		return oPrice;
	}
	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}
	public String getoStatus() {
		return oStatus;
	}
	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}
	public int getoPoint() {
		return oPoint;
	}
	public void setoPoint(int oPoint) {
		this.oPoint = oPoint;
	}
	public String getReviewYn() {
		return reviewYn;
	}
	public void setReviewYn(String reviewYn) {
		this.reviewYn = reviewYn;
	}
	public String getOptionValue() {
		return optionValue;
	}
	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}
	
	//NoMemOrder
	
	
	private String nonMemOrderKey;
	private String oName;
	private String oPhone;
	private String oEmail;
	private String orderPassword;
	private String rName;
	private String address;
	private String rPhone;
	private String request;
	private String pDate;
	private int productPrice;
	private String deliveryFreeYn;



	public String getNonMemOrderKey() {
		return nonMemOrderKey;
	}
	public void setNonMemOrderKey(String nonMemOrderKey) {
		this.nonMemOrderKey = nonMemOrderKey;
	}
	public String getoName() {
		return oName;
	}
	public void setoName(String oName) {
		this.oName = oName;
	}
	public String getoPhone() {
		return oPhone;
	}
	
	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}
	public String getoEmail() {
		return oEmail;
	}
	public void setoEmail(String oEmail) {
		this.oEmail = oEmail;
	}
	public String getOrderPassword() {
		return orderPassword;
	}
	public void setOrderPassword(String orderPassword) {
		this.orderPassword = orderPassword;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getrPhone() {
		return rPhone;
	}
	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getDeliveryFreeYn() {
		return deliveryFreeYn;
	}
	public void setDeliveryFreeYn(String deliveryFreeYn) {
		this.deliveryFreeYn = deliveryFreeYn;
	}
	
	private String productName;
	 
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	private String productImg;
	
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	
	private String productInfo;
	private String productDetail;
	private String productCaution;
	
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	public String getProductCaution() {
		return productCaution;
	}
	public void setProductCaution(String productCaution) {
		this.productCaution = productCaution;
	}
}
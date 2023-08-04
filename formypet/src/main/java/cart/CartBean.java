package cart;

public class CartBean {
	
	private int cartKey;
	private int productKey;
	private int cartCount;
	private int memKey;
	private String productName;
	private int productPrice;
	private int productSalePrice;
	private String productImg;
	private String optionValue;
	private int categoryKey;
	
	public int getCategoryKey() {
		return categoryKey;
	}
	public void setCategoryKey(int categoryKey) {
		this.categoryKey = categoryKey;
	}
	public String getOptionValue() {
		return optionValue;
	}
	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductSalePrice() {
		return productSalePrice;
	}
	public void setProductSalePrice(int productSalePrice) {
		this.productSalePrice = productSalePrice;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getCartKey() {
		return cartKey;
	}
	public void setCartKey(int cartKey) {
		this.cartKey = cartKey;
	}
	public int getProductKey() {
		return productKey;
	}
	public void setProductKey(int productKey) {
		this.productKey = productKey;
	}
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	public int getMemKey() {
		return memKey;
	}
	public void setMemKey(int memKey) {
		this.memKey = memKey;
	}
	
	
	
}
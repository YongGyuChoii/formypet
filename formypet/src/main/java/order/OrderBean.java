package order;




public class OrderBean {
	
    private int ordersKey;
    private String memOrderkey;
    private String nonmemOrderKey;
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
	public String getNonmemOrderKey() {
		return nonmemOrderKey;
	}
	public void setNonmemOrderKey(String nonmemOrderKey) {
		this.nonmemOrderKey = nonmemOrderKey;
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
   
    
	
	//Memorder
		private String memOrderKey;
		private String rName;
		private String rAddress; 
	    private String rPhone;
		private String request; 
	    private String pDate;
	    private int pointPrice;
	    private int productPrice;
		private int memKey;
		
		
		public String getMemOrderKey() {
			return memOrderKey;
		}
		public void setMemOrderKey(String memOrderKey) {
			this.memOrderKey = memOrderKey;
		}
		public String getrName() {
			return rName;
		}
		public void setrName(String rName) {
			this.rName = rName;
		}
		public String getrAddress() {
			return rAddress;
		}
		public void setrAddress(String rAddress) {
			this.rAddress = rAddress;
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
		public int getPointPrice() {
			return pointPrice;
		}
		public void setPointPrice(int pointPrice) {
			this.pointPrice = pointPrice;
		}
		public int getProductPrice() {
			return productPrice;
		}
		public void setProductPrice(int productPrice) {
			this.productPrice = productPrice;
		}
		public int getMemKey() {
			return memKey;
		}
		public void setMemKey(int memKey) {
			this.memKey = memKey;
		}
	 
		
		
}
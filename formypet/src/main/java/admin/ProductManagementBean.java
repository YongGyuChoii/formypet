package admin;

public class ProductManagementBean {
	
	private String productName;
	private String productComment;
	private String productInfo;
	private String productDetail;
	private String productCaution;
	private int productPrice;
	private int productSalePrice;
	private int productCount;
	private String productKind;
	private String productImg;
	private int categoryKey;
	private String delYn;
	private String fileOriginalName;
	private String fileSaveName;
	private int size;//파일 사이즈 product_file db 
	private int productKey;
	private int fileKey;
	private String filename;//db x product용 변수
	private String filesize;//db x product용 변수
	private int ref; //부모 글 변수
	private int ocKey; //option_code db
	private String oc1; //option_code db
	private String oc2;//option_code db
	private String oc3;//option_code db
	private String oc4;//option_code db
	private String oc5;//option_code db
	
	
	
	public String getProductName() {
		return productName;
	}
	public String getProductComment() {
		return productComment;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public String getProductDetail() {
		return productDetail;
	}
	public String getProductCaution() {
		return productCaution;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public int getProductSalePrice() {
		return productSalePrice;
	}
	public int getProductCount() {
		return productCount;
	}
	public String getProductKind() {
		return productKind;
	}
	public String getProductImg() {
		return productImg;
	}
	public int getCategoryKey() {
		return categoryKey;
	}
	public String getDelYn() {
		return delYn;
	}
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	public String getFileSaveName() {
		return fileSaveName;
	}
	public int getSize() {
		return size;
	}
	public int getProductKey() {
		return productKey;
	}
	public int getFileKey() {
		return fileKey;
	}
	public String getFilename() {
		return filename;
	}
	public String getFilesize() {
		return filesize;
	}
	public int getRef() {
		return ref;
	}
	public int getOcKey() {
		return ocKey;
	}
	public String getOc1() {
		return oc1;
	}
	public String getOc2() {
		return oc2;
	}
	public String getOc3() {
		return oc3;
	}
	public String getOc4() {
		return oc4;
	}
	public String getOc5() {
		return oc5;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public void setProductComment(String productComment) {
		this.productComment = productComment;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}
	public void setProductCaution(String productCaution) {
		this.productCaution = productCaution;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public void setProductSalePrice(int productSalePrice) {
		this.productSalePrice = productSalePrice;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public void setProductKind(String productKind) {
		this.productKind = productKind;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public void setCategoryKey(int categoryKey) {
		this.categoryKey = categoryKey;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}
	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public void setProductKey(int productKey) {
		this.productKey = productKey;
	}
	public void setFileKey(int fileKey) {
		this.fileKey = fileKey;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public void setOcKey(int ocKey) {
		this.ocKey = ocKey;
	}
	public void setOc1(String oc1) {
		this.oc1 = oc1;
	}
	public void setOc2(String oc2) {
		this.oc2 = oc2;
	}
	public void setOc3(String oc3) {
		this.oc3 = oc3;
	}
	public void setOc4(String oc4) {
		this.oc4 = oc4;
	}
	public void setOc5(String oc5) {
		this.oc5 = oc5;
	}

}

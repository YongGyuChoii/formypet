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
	private String ip; //파일 등록시 작성자의 
	private int pos; //파일 등록시 게시물의 상대적인 위치값 변수
	private int ref; //부모 글 변수
	private int depth; //리스트 깊이 변수
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
	public String getIp() {
		return ip;
	}
	public int getPos() {
		return pos;
	}
	public int getRef() {
		return ref;
	}
	public int getDepth() {
		return depth;
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
	public void setIp(String ip) {
		this.ip = ip;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
	
	

}

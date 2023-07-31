package admin;

public class ExpendsManagementBean {
	
	private String expendsDate; //매출 날짜
	private String expendsSection; //매출 구분
	private String expendsContents; //매출 내용
	private int expendsValue; //매출 금액
	private int Mexpends; //월별 매출 합계
	private int Yexpends; //년도별 매출 합계
	private int expendsKey; //매출 번호
	private int memKey; //회원 번호
	
	
	public String getExpendsDate() {
		return expendsDate;
	}
	public String getExpendsSection() {
		return expendsSection;
	}
	public String getExpendsContents() {
		return expendsContents;
	}
	public int getExpendsValue() {
		return expendsValue;
	}
	public int getMexpends() {
		return Mexpends;
	}
	public int getYexpends() {
		return Yexpends;
	}
	public int getExpendsKey() {
		return expendsKey;
	}
	public int getMemKey() {
		return memKey;
	}
	
	
	public void setExpendsDate(String expendsDate) {
		this.expendsDate = expendsDate;
	}
	public void setExpendsSection(String expendsSection) {
		this.expendsSection = expendsSection;
	}
	public void setExpendsContents(String expendsContents) {
		this.expendsContents = expendsContents;
	}
	public void setExpendsValue(int expendsValue) {
		this.expendsValue = expendsValue;
	}
	public void setMexpends(int mexpends) {
		Mexpends = mexpends;
	}
	public void setYexpends(int yexpends) {
		Yexpends = yexpends;
	}
	public void setExpendsKey(int expendsKey) {
		this.expendsKey = expendsKey;
	}
	public void setMemKey(int memKey) {
		this.memKey = memKey;
	}

	
	
}
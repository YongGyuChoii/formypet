package admin;

public class ReviewManagementBean {
	private int rvKey;
	private String rvTitle;
	private String rvContents;
	private String rvPhoto;
	private int rvScore;
	private int memKey;
	private String optionValue;
	
	
	public int getRvKey() {
		return rvKey;
	}
	public String getRvTitle() {
		return rvTitle;
	}
	public String getRvContents() {
		return rvContents;
	}
	public String getRvPhoto() {
		return rvPhoto;
	}
	public int getRvScore() {
		return rvScore;
	}
	public int getMemKey() {
		return memKey;
	}
	public String getOptionValue() {
		return optionValue;
	}
	
	
	public void setRvKey(int rvKey) {
		this.rvKey = rvKey;
	}
	public void setRvTitle(String rvTitle) {
		this.rvTitle = rvTitle;
	}
	public void setRvContents(String rvContents) {
		this.rvContents = rvContents;
	}
	public void setRvPhoto(String rvPhoto) {
		this.rvPhoto = rvPhoto;
	}
	public void setRvScore(int rvScore) {
		this.rvScore = rvScore;
	}
	public void setMemKey(int memKey) {
		this.memKey = memKey;
	}
	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}
}

package review;

public class ReviewBean {

    private String rvTitle; // 제목
    private String rvContents; // 내용
    private Integer rvScore; // 점수
    private Integer memKey;


    public String getRvTitle() {
        return rvTitle;
    }

    public void setRvTitle(String rvTitle) {
        this.rvTitle = rvTitle;
    }

    
    public String getRvContents() {
        return rvContents;
    }

    public void setRvContents(String rvContents) {
        this.rvContents = rvContents;
    }

    
    public Integer getRvScore() {
        return rvScore;
    }

    public void setRvScore(Integer rvScore) {
        this.rvScore = rvScore;
    }

    
    public Integer getMemKey() {
        return memKey;
    }

    public void setMemKey(Integer memKey) {
        this.memKey = memKey;
    }

    
}

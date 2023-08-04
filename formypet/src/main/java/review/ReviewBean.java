package review;

import java.math.BigDecimal;


public class ReviewBean {

    private String rvTitle; // 제목
    private String rvContents; // 내용
    private String rvPhoto; // 사진
    private Integer rvScore; // 점수
    private String optionValue; // 옵션
    private BigDecimal memKey;
    private BigDecimal productKey;
    

//제목
    public String getRvTitle() {
        return rvTitle;
    }

    public void setRvTitle(String rvTitle) {
        this.rvTitle = rvTitle;
    }

  //내용  
    public String getRvContents() {
        return rvContents;
    }

    public void setRvContents(String rvContents) {
        this.rvContents = rvContents;
    }

    //사진
    public String getRvPhoto() {
        return rvPhoto;
    }

    public void setRvPhoto(String rvPhoto) {
        this.rvPhoto = rvPhoto;
    }
    
    
    
    //점수
    public Integer getRvScore() {
        return rvScore;
    }

    public void setRvScore(Integer rvScore) {
        this.rvScore = rvScore;
    }

    
    //옵션
    public String getOptionValue() {
        return optionValue;
    }

    public void setOptionValue(String optionValue) {
        this.optionValue = optionValue;
    }
    
    //제품
    public BigDecimal getProductKey() {
        return productKey;
    }

    public void setProductKey(BigDecimal productKey) {
        this.productKey = productKey;
    }

    //회원
    public BigDecimal getMemKey() {
        return memKey;
    }

    public void setMemKey(BigDecimal memKey) {
        this.memKey = memKey;
    }
    @Override
    public String toString() {
        return "ReviewBean{" +
                "rvTitle='" + rvTitle + '\'' +
                ", rvContents='" + rvContents + '\'' +
                ", rvPhoto='" + rvPhoto + '\'' +
               ", optionValue='" + optionValue + '\'' +
                ", rvScore=" + rvScore +
                ", memKey=" + memKey +
                ", productKey=" + productKey +
                '}';
}
}
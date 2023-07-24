package review;

import java.awt.Image;

public class ReviewBean {
    private String title;
    private String contents;
    private Image photo;
    private double score;

    public ReviewBean(String title, String content, Image photo, double score) {
        this.title = title;
        this.contents = content;
        this.photo = photo;
        this.score = score;
    }

  // 리뷰속성(제목,내용,사진,점수)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return contents;
    }

    public void setContent(String content) {
        this.contents = content;
    }

    public Image getPhoto() {
        return photo;
    }

    public void setPhoto(Image photo) {
        this.photo = photo;
    }

    public double getRating() {
        return score;
    }

    public void setRating(double score) {
        this.score = score;
    }

    
}

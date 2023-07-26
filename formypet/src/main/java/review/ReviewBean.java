package review;

import java.awt.Image;

public class ReviewBean {
    private String title;
    private String contents;
    private String photo;
    private int score;

    public ReviewBean(String title, String content, String photo, int score) {
        this.title = title;
        this.contents = contents;
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

    public String getContents() {
        return contents;
    }

    public void setContent(String contents) {
        this.contents = contents;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public double getRating() {
        return score;
    }

    public void setRating(int score) {
        this.score = score;
    }

    
}

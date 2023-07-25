package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReviewMgr {
    private Connection connection;

    public ReviewMgr(String url, String user, String password) throws SQLException {
        connection = DriverManager.getConnection(url, user, password);
    }

    public void addReview(String title, String contents, int score, String photo) throws SQLException {
        String sql = "INSERT INTO reviews (title, contents, score, photo) VALUES (?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, title);
            statement.setString(2, contents);
            statement.setInt(3, score);
            statement.setString(4, photo);
            statement.executeUpdate();
        }
    }

    public void close() throws SQLException {
        connection.close();
    }

    public static void main(String[] args) {
    	String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://127.0.0.1:3306/formypet?useUnicode=true&characterEncoding=UTF-8"; // 데이터베이스 URL
        String user = "root"; // 본인의 MySQL 사용자 이름
        String password = "0000"; // 본인의 MySQL 비밀번호

        try {
        	ReviewMgr ReviewMgr = new ReviewMgr(url, user, password);
        	

            // 리뷰 정보 추가 예시
        	ReviewMgr.addReview("맛있는 음식!", "정말 맛있어요!", 5, "photo1.jpg");
        	ReviewMgr.addReview("친절한 서비스", "직원들이 친절하고 좋았습니다.", 4, "photo2.jpg");

            // 연결 종료
        	ReviewMgr.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

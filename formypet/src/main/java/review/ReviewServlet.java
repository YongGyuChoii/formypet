package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReviewServlet {
    private Connection connection;

    public ReviewServlet(String url, String user, String password) throws SQLException {
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
        	ReviewServlet ReviewMain = new ReviewServlet(url, user, password);
        	

            // 리뷰 정보 추가 예시
        	ReviewMain.addReview("제로 워터리스 샴푸!", "써보니까 확실히 인기 있는 이유룰 알겠어요.", 5, "photo1.jpg");
        	ReviewMain.addReview("제로 워터리스 샴푸!", "써보니까 확실히 인기 있는 이유룰 알겠어요.", 5, "photo2.jpg");

            // 연결 종료
        	ReviewMain.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

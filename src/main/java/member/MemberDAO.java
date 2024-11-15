// MemberDAO.java
package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private final String dbUser = "webproject_db";
    private final String dbPwd = "1234";

    // 데이터베이스 연결
    public MemberDAO() {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection(url, dbUser, dbPwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 회원 정보 삽입 메서드
    public boolean insertMember(MemberDTO member) {
        String sql = "INSERT INTO member (user_id, user_pwd, user_name, phone_num, email, gender) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getUserId()); // user_id를 문자열로 처리
            pstmt.setString(2, member.getUserPwd());
            pstmt.setString(3, member.getUserName());
            pstmt.setString(4, member.getPhoneNum());
            pstmt.setString(5, member.getEmail());
            pstmt.setString(6, member.getGender());

            int result = pstmt.executeUpdate();
            return result > 0; // 삽입 성공 시 true 반환
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            closeResources();
        }
    }

    // 자원 해제 메서드
    private void closeResources() {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

package member;

import java.sql.*;

public class MemberDAO {
    // 데이터베이스 연결 메서드
    private Connection getConnection() throws SQLException {
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String username = "webproject_db";
        String password = "1234";
        return DriverManager.getConnection(url, username, password);
    }

    // 사용자 정보 삽입 (회원 가입)
    public boolean insertMember(MemberDTO member) {
        String sql = "INSERT INTO member (user_id, user_pwd, user_name, phone_num, email, gender, manager_id) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        boolean result = false;

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, member.getUserId());
            stmt.setString(2, member.getUserPwd());
            stmt.setString(3, member.getUserName());
            stmt.setString(4, member.getPhoneNum());
            stmt.setString(5, member.getEmail());
            stmt.setString(6, member.getGender());
            stmt.setInt(7, member.getManagerId()); // 관리자 ID (옵션 필드)

            int rowsInserted = stmt.executeUpdate();
            result = rowsInserted > 0; // 삽입 성공 여부 확인

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // 특정 사용자 ID로 사용자 정보 가져오기
    public MemberDTO getMemberById(String userId) {
        MemberDTO member = null;
        String sql = "SELECT * FROM member WHERE user_id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, userId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    member = new MemberDTO(
                            rs.getString("user_id"),
                            rs.getString("user_pwd"),
                            rs.getString("user_name"),
                            rs.getString("phone_num"),
                            rs.getString("email"),
                            rs.getString("gender"),
                            rs.getInt("manager_id")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return member;
    }
}

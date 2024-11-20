package member;

public class MemberDTO {
    private String userId; // 사용자 ID
    private String userPwd; // 비밀번호
    private String userName; // 사용자 이름
    private String phoneNum; // 전화번호
    private String email; // 이메일
    private String gender; // 성별
    private int managerId; // 매니저 ID (nullable)

    // 기본 생성자
    public MemberDTO() {}

    // 모든 필드를 초기화하는 생성자
    public MemberDTO(String userId, String userPwd, String userName, String phoneNum, String email, String gender, int managerId) {
        this.userId = userId;
        this.userPwd = userPwd;
        this.userName = userName;
        this.phoneNum = phoneNum;
        this.email = email;
        this.gender = gender;
        this.managerId = managerId;
    }

    // Getter와 Setter
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    @Override
    public String toString() {
        return "MemberDTO{" +
                "userId='" + userId + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userName='" + userName + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", managerId=" + managerId +
                '}';
    }
}

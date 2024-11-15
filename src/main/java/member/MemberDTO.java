// MemberDTO.java
package member;

public class MemberDTO {
    private int userId;
    private String userPwd;
    private String userName;
    private String phoneNum;
    private String email;
    private String gender;

    // 기본 생성자
    public MemberDTO() {}

    // 매개변수 있는 생성자
    public MemberDTO(int userId, String userPwd, String userName, String phoneNum, String email, String gender) {
        this.userId = userId;
        this.userPwd = userPwd;
        this.userName = userName;
        this.phoneNum = phoneNum;
        this.email = email;
        this.gender = gender;
    }

    // getter 및 setter 메서드
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getUserPwd() { return userPwd; }
    public void setUserPwd(String userPwd) { this.userPwd = userPwd; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getPhoneNum() { return phoneNum; }
    public void setPhoneNum(String phoneNum) { this.phoneNum = phoneNum; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
}

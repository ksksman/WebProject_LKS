package member;

public class MemberDTO {
	private String userId;
	private String userPwd;
	private String userName;
	private String phoneNum;
	private String email;
	private String gender;
	private int managerId;
	private String address; // 주소 필드 추가
	private String birthDate; // 생일 필드 추가

	// 기본 생성자
	public MemberDTO() {
	}

	// 모든 필드를 받는 생성자
	public MemberDTO(String userId, String userPwd, String userName, String phoneNum, String email, String gender,
			int managerId, String address, String birthDate) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phoneNum = phoneNum;
		this.email = email;
		this.gender = gender;
		this.managerId = managerId;
		this.address = address;
		this.birthDate = birthDate;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
}

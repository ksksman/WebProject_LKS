package common;						
						
import java.sql.Connection;						
import java.sql.DriverManager;						
import java.sql.PreparedStatement;						
import java.sql.ResultSet;						
import java.sql.Statement;						
						
import jakarta.servlet.ServletContext;						
						
public class JDBConnect {						
public Connection con;						
public Statement stmt;						
public PreparedStatement psmt;						
public ResultSet rs;						
						
// 기본 생성자						
public JDBConnect() {						
try {						
Class.forName("oracle.jdbc.OracleDriver");						
String url = "jdbc:oracle:thin:@localhost:1521:xe";						
String id = "webproject_db";						
String pwd = "1234";						
con = DriverManager.getConnection(url, id, pwd);						
System.out.println("DB 연결 성공(기본 생성자)");						
} catch (Exception e) {						
e.printStackTrace();						
}						
}						
						
public JDBConnect(String driver, String url, String id, String pwd) {						
try {						
Class.forName(driver);						
con = DriverManager.getConnection(url, id, pwd);						
System.out.println("DB 연결 성공(인수 생성자 1)");						
} catch (Exception e) {						
e.printStackTrace();						
}						
}						
						
//인자생성자2: application 내장객체의 원본 타입을 매개변수로 선언						
public JDBConnect(ServletContext application) {						
try {						
	/*					
	내장 객체를 매개변수를 통해 전달받았으므로 Java클래스 내에서 web.xml을 접근할 수 있다.					
	그러면 JSP에서 DB연결을 위해					
	반복적으로 사용했던 코드를 줄일수 있다.					
	*/					
String driver = application.getInitParameter("OracleDriver");						
						
//얻어온 값들을 통해 드라이버 로드와 DB연결을 진행한다.						
Class.forName(driver);						
						
// 초기화 파라미터에서 DB 연결 정보 가져오기						
String url = application.getInitParameter("OracleURL");						
String id = application.getInitParameter("OracleId");						
String pwd = application.getInitParameter("OraclePwd");						
						
// DB 연결 설정						
con = DriverManager.getConnection(url, id, pwd);						
System.out.println("DB 연결 성공(인수 생성자 2)");						
						
} catch (Exception e) {						
e.printStackTrace();						
}						
}						
						
						
// 자원 해제 메서드						
public void close() {						
try {						
if (rs != null) rs.close();						
if (stmt != null) stmt.close();						
if (psmt != null) psmt.close();						
if (con != null) con.close();						
System.out.println("JDBC 자원 해제");						
} catch (Exception e) {						
e.printStackTrace();						
}						
}						
						
						
						
}						
						
						
						
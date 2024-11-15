package common;						
						
import java.sql.Statement;						
import java.sql.Connection;						
import java.sql.PreparedStatement;						
import java.sql.ResultSet;						
						
import javax.naming.Context;						
import javax.naming.InitialContext;						
import javax.sql.DataSource;						
								
						
public class DBConnPool {						
	//멤버변수					
public Connection con;						
public Statement stmt;						
public PreparedStatement psmt;						
public ResultSet rs;						
						
// 기본 생성자: DB 커넥션 풀을 통해 연결 설정						
public DBConnPool() {						
try {						
	//1.tomcat 인스턴스를 생성한다 .Tomcat웹서버라 생각하면 된다.					
Context initCtx = new InitialContext();						
/*						
1. 앞에서 생성한 인스턴스를 통해 JNDI서비스 구조의 초기 Root 디렉토리를						
얻어온다. 해당 디렉토리의 이름은 아래와 같이 이미 지정되어 있으므로						
그대로 사용하면 된다.						
*/						
Context ctx = (Context) initCtx.lookup("java:comp/env");						
/*						
3. server.xml에 등록한 네이밍을 Lookup하여 DataSources를 얻어온다.						
즉, DB연결을 위한 정보를 가지고 있다.						
*/						
DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");						
//4. 커넥션풀에 생성해 둔 객체를 가져다가 사용한다.						
con = source.getConnection();						
System.out.println("DB 커넥션 풀 연결 성공");						
} catch (Exception e) {						
System.out.println("DB 커넥션 풀 연결 실패");						
e.printStackTrace();						
}						
}						
						
						
						
// 자원 반납 메서드						
public void close() {						
try {						
if (rs != null) rs.close();						
if (stmt != null) stmt.close();						
if (psmt != null) psmt.close();						
if (con != null) con.close();						
System.out.println("DB 커넥션 풀 자원 반납");						
} catch (Exception e) {						
e.printStackTrace();						
}						
}						
						
}						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
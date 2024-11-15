<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Member Login</title>
  <link rel="shortcut icon" type="image/png" href="../assets/images/logos/seodashlogo.png" />
  <link rel="stylesheet" href="../assets/css/styles.min.css" />
</head>

<body>
  <%
    // 데이터베이스 연결 설정
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "webproject_db";
    String dbPwd = "1234";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // 폼 제출 시 로그인 처리
    if (request.getParameter("login") != null) {
        String userId = request.getParameter("user_id");
        String userPwd = request.getParameter("user_pwd");
        boolean loginSuccess = false;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection(url, dbUser, dbPwd);

            String sql = "SELECT * FROM member WHERE user_id = ? AND user_pwd = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPwd);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                loginSuccess = true;
                // 로그인 성공 시 세션에 userId 설정
                session.setAttribute("userId", userId); // 세션에 user_id 저장
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (loginSuccess) {
            // 로그인 성공 시 메인 페이지로 이동
            out.println("<script>alert('로그인에 성공하셨습니다!'); location.href='index.jsp';</script>");
        } else {
            // 로그인 실패 시 에러 메시지 및 로그인 페이지로 돌아가기
            out.println("<script>alert('아이디 및 패스워드가 일치하지 않습니다. 다시 시도해주세요'); history.back();</script>");
        }
    }
  %>

  <!-- Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <a href="./index.jsp" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="../assets/images/logos/logo-light.svg" alt="">
                </a>
                <p class="text-center">Login to Your Account</p>
                <form method="post" action="">
                  <div class="mb-3">
                    <label for="user_id" class="form-label">User ID</label>
                    <input type="text" class="form-control" id="user_id" name="user_id" required>
                  </div>
                  <div class="mb-3">
                    <label for="user_pwd" class="form-label">Password</label>
                    <input type="password" class="form-control" id="user_pwd" name="user_pwd" required>
                  </div>
                  <button type="submit" name="login" class="btn btn-primary w-100 py-8 fs-4 mb-4">Login</button>
                  <div class="d-flex align-items-center justify-content-center">
                    <p class="fs-4 mb-0 fw-bold">혹시 계정이 없으신가요?</p>
                    <a class="text-primary fw-bold ms-2" href="./authentication-register.jsp">회원가입</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Member Registration</title>
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

    // 폼 제출 시 데이터베이스에 값 저장
    if (request.getParameter("submit") != null) {
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection(url, dbUser, dbPwd);

            String sql = "INSERT INTO member (user_id, user_pwd, user_name, phone_num, email, gender) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(request.getParameter("user_id")));
            pstmt.setString(2, request.getParameter("user_pwd"));
            pstmt.setString(3, request.getParameter("user_name"));
            pstmt.setString(4, request.getParameter("phone_num"));
            pstmt.setString(5, request.getParameter("email"));
            pstmt.setString(6, request.getParameter("gender"));

            int result = pstmt.executeUpdate();
            if (result > 0) {
                out.println("<script>alert('Registration successful!');</script>");
            } else {
                out.println("<script>alert('Registration failed. Please try again.');</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
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
                <p class="text-center">Register New Member</p>
                <form method="post" action="">
                  <div class="mb-3">
                    <label for="user_id" class="form-label">User ID</label>
                    <input type="number" class="form-control" id="user_id" name="user_id" required>
                  </div>
                  <div class="mb-3">
                    <label for="user_pwd" class="form-label">Password</label>
                    <input type="password" class="form-control" id="user_pwd" name="user_pwd" required>
                  </div>
                  <div class="mb-3">
                    <label for="user_name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="user_name" name="user_name" required>
                  </div>
                  <div class="mb-3">
                    <label for="phone_num" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="phone_num" name="phone_num" required>
                  </div>
                  <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                  </div>
                  <div class="mb-3">
                    <label for="gender" class="form-label">Gender</label>
                    <select class="form-control" id="gender" name="gender" required>
                      <option value="M">Male</option>
                      <option value="F">Female</option>
                    </select>
                  </div>
                  <button type="submit" name="submit" class="btn btn-primary w-100 py-8 fs-4 mb-4">Register</button>
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

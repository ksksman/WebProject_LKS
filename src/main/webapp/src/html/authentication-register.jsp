<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .registration-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            text-align: center;
            margin-bottom: 30px;
            color: #007bff;
            font-weight: bold;
        }

        .btn-primary {
            width: 100%;
            font-size: 16px;
            font-weight: bold;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
        }

        .form-footer a {
            color: #007bff;
            text-decoration: none;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="registration-container">
            <h2 class="form-title">회원가입</h2>
            <form method="post" action="processRegistration.jsp">
                <!-- User ID -->
                <div class="mb-3">
                    <label for="user_id" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 입력하세요" required>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label for="user_pwd" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="user_pwd" name="user_pwd" placeholder="비밀번호를 입력하세요" required>
                </div>

                <!-- Confirm Password -->
                <div class="mb-3">
                    <label for="confirm_pwd" class="form-label">비밀번호 확인</label>
                    <input type="password" class="form-control" id="confirm_pwd" placeholder="비밀번호를 다시 입력하세요" required>
                </div>

                <!-- Name -->
                <div class="mb-3">
                    <label for="user_name" class="form-label">이름</label>
                    <input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름을 입력하세요" required>
                </div>

                <!-- Phone Number -->
                <div class="mb-3">
                    <label for="phone_num" class="form-label">전화번호</label>
                    <input type="text" class="form-control" id="phone_num" name="phone_num" placeholder="010-1234-5678" maxlength="13" required>
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요" required>
                </div>

                <!-- Gender -->
                <div class="mb-3">
                    <label for="gender" class="form-label">성별</label>
                    <select class="form-control" id="gender" name="gender" required>
                        <option value="M">남성</option>
                        <option value="F">여성</option>
                        <option value="O">기타</option>
                    </select>
                </div>

                <!-- Birth Date -->
                <div class="mb-3">
                    <label for="birth_date" class="form-label">생년월일</label>
                    <input type="date" class="form-control" id="birth_date" name="birth_date" required>
                </div>

                <!-- Address -->
                <div class="mb-3">
                    <label for="address" class="form-label">주소</label>
                    <textarea class="form-control" id="address" name="address" placeholder="주소를 입력하세요" rows="3" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary">회원가입</button>
                <div class="form-footer">
                    <p>이미 계정이 있으신가요? <a href="./authentication-login.jsp">로그인</a></p>
                </div>
            </form>
        </div>
    </div>

    <script>
        // 비밀번호 확인 유효성 검사
        document.querySelector("form").addEventListener("submit", function (event) {
            const password = document.getElementById("user_pwd").value;
            const confirmPwd = document.getElementById("confirm_pwd").value;

            if (password !== confirmPwd) {
                alert("비밀번호가 일치하지 않습니다.");
                event.preventDefault();
            }
        });

        // 전화번호 자동 하이픈 추가
        const phoneInput = document.getElementById("phone_num");
        phoneInput.addEventListener("input", function (event) {
            let value = event.target.value.replace(/[^0-9]/g, "");
            if (value.length > 3 && value.length <= 7) {
                value = value.slice(0, 3) + "-" + value.slice(3);
            } else if (value.length > 7) {
                value = value.slice(0, 3) + "-" + value.slice(3, 7) + "-" + value.slice(7);
            }
            event.target.value = value;
        });
    </script>
</body>
</html>

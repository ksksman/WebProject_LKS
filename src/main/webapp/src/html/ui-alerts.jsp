<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border: none;
            border-radius: 10px;
        }

        .card-header {
            background-color: #007bff;
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-body {
            padding: 20px;
        }

        .info-label {
            font-weight: bold;
            color: #333;
        }

        .info-value {
            color: #555;
        }

        .btn-edit {
            background-color: #28a745;
            color: #fff;
            border-radius: 5px;
            font-size: 16px;
            padding: 10px 20px;
            text-align: center;
            display: inline-block;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .btn-edit:hover {
            background-color: #218838;
        }

        .btn-back {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #6c757d;
            color: #fff;
            border-radius: 50px;
            font-size: 16px;
            padding: 10px 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-back:hover {
            background-color: #5a6268;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header">
                My Page
            </div>
            <div class="card-body">
                <div class="row mb-3">
                    <div class="col-4 info-label">User ID:</div>
                    <div class="col-8 info-value">${member.userId}</div>
                </div>
                <div class="row mb-3">
                    <div class="col-4 info-label">Name:</div>
                    <div class="col-8 info-value">${member.userName}</div>
                </div>
                <div class="row mb-3">
                    <div class="col-4 info-label">Phone Number:</div>
                    <div class="col-8 info-value">${member.phoneNum}</div>
                </div>
                <div class="row mb-3">
                    <div class="col-4 info-label">Email:</div>
                    <div class="col-8 info-value">${member.email}</div>
                </div>
                <div class="row mb-3">
                    <div class="col-4 info-label">Gender:</div>
                    <div class="col-8 info-value">${member.gender}</div>
                </div>
                <div class="row mb-3">
                    <div class="col-4 info-label">Address:</div>
                    <div class="col-8 info-value">${member.address}</div>
                </div>
                <div class="row mb-3">
                    <div class="col-4 info-label">Birth Date:</div>
                    <div class="col-8 info-value">${member.birthDate}</div>
                </div>
                <a href="memberEdit.do" class="btn-edit">회원 정보 수정</a>
            </div>
        </div>
    </div>

    <!-- 뒤로가기 버튼 -->
    <a href="index.jsp" class="btn-back">뒤로가기</a>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

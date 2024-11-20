<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            margin: 20px 0;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .write-btn {
            display: block;
            width: 150px;
            margin: 20px auto;
            text-align: center;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .write-btn:hover {
            background-color: #0056b3;
        }

        .footer-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            padding: 15px 20px;
            border-radius: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            font-weight: bold;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .footer-btn:hover {
            background-color: #218838;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .message {
            text-align: center;
            margin: 10px auto;
            font-size: 14px;
            color: red;
        }
    </style>
</head>
<head>
    <title>게시글 목록</title>
    <style>
        /* 기존 CSS 유지 */
    </style>
    <script>
        // 경고창을 표시하는 함수
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <h1>게시글 목록</h1>

    <!-- 경고 메시지 처리 -->
    <c:if test="${param.error == 'not_authorized'}">
        <script>
            showAlert('다른 사용자의 게시물을 삭제할 수 없습니다.');
        </script>
    </c:if>
    <c:if test="${param.error == 'delete_failed'}">
        <script>
            showAlert('게시물을 삭제하는 중 오류가 발생했습니다.');
        </script>
    </c:if>
    <c:if test="${param.success == 'deleted'}">
        <script>
            showAlert('게시물이 성공적으로 삭제되었습니다.');
        </script>
    </c:if>

    <!-- 로그인 사용자 확인 -->
    <c:if test="${userId != null}">
        <p style="text-align: center;">로그인 사용자: <strong>${userId}</strong></p>
        <a href="boardWrite.do" class="write-btn">글쓰기</a>
    </c:if>
    <c:if test="${userId == null}">
        <p style="text-align: center; color: red;">로그인되지 않았습니다. 게시글 작성은 불가능합니다.</p>
    </c:if>

    <!-- 게시글 목록 테이블 -->
    <table>
        <tr>
            <th>ID</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${board.id}</td>
                <td><a href="boardDetail.do?id=${board.id}">${board.title}</a></td>
                <td>${board.username}</td>
                <td>${board.createdAt}</td>
            </tr>
        </c:forEach>
    </table>

    <!-- 귀로가기 버튼 -->
    <a href="../html/index.jsp" class="footer-btn">뒤로가기</a>
</body>
</html>

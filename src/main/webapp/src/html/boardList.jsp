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

        /* 페이징 스타일 */
        .pagination {
            text-align: center;
            margin: 20px 0;
        }

        .pagination a, .pagination strong {
            display: inline-block;
            margin: 0 5px;
            padding: 10px 15px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .pagination strong {
            background-color: #0056b3;
            font-weight: bold;
        }

        .pagination a:hover {
            background-color: #0056b3;
        }

        /* 뒤로가기 버튼 스타일 */
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
    </style>
</head>
<body>
    <h1>게시글 목록</h1>

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
        <thead>
            <tr>
                <th>ID</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardList}">
                <tr>
                    <td>${board.id}</td>
                    <td><a href="boardDetail.do?id=${board.id}">${board.title}</a></td>
                    <td>${board.userId}</td>
                    <td>${board.createdAt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 페이징 -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="boardList.do?page=${currentPage - 1}">이전</a>
        </c:if>
        <c:forEach begin="1" end="${totalPages}" var="pageNum">
            <c:if test="${pageNum == currentPage}">
                <strong>${pageNum}</strong>
            </c:if>
            <c:if test="${pageNum != currentPage}">
                <a href="boardList.do?page=${pageNum}">${pageNum}</a>
            </c:if>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="boardList.do?page=${currentPage + 1}">다음</a>
        </c:if>
    </div>

    <!-- 뒤로가기 버튼 -->
    <a href="index.jsp" class="footer-btn">뒤로가기</a>
</body>
</html>

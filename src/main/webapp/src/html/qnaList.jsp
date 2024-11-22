<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A 게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        table {
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            text-align: center;
            padding: 10px;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        .btn {
            margin-top: 10px;
        }

        .pagination {
            justify-content: center;
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
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Q&A 게시판</h1>
        <table class="table table-striped">
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
                        <td><a href="qnaBoard.do?action=detail&id=${board.id}">${board.title}</a></td>
                        <td>${board.username}</td> <!-- 작성자 이름 표시 -->
                        <td>${board.createdAt}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="text-center">
            <c:if test="${currentPage > 1}">
                <a href="qnaBoard.do?action=list&page=${currentPage - 1}" class="btn btn-primary">이전</a>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="pageNum">
                <c:choose>
                    <c:when test="${pageNum == currentPage}">
                        <strong>${pageNum}</strong>
                    </c:when>
                    <c:otherwise>
                        <a href="qnaBoard.do?action=list&page=${pageNum}" class="btn btn-secondary">${pageNum}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <a href="qnaBoard.do?action=list&page=${currentPage + 1}" class="btn btn-primary">다음</a>
            </c:if>
        </div>

        <a href="qnaWrite.jsp" class="btn btn-success">글쓰기</a>
    </div>

    <!-- 뒤로가기 버튼 -->
    <a href="index.jsp" class="footer-btn">뒤로가기</a>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List</title>
    <!-- css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.0/reset.css">
    <link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<body>
    <h1>Board</h1>
    <h2>List</h2>
    <table>
        <tr>
            <th>id</th>
            <th>title</th>
            <th>writer</th>
            <th>date</th>
            <th>hits</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td>
                    <a href="/board?id=${board.id}&page=${paging.page}">${board.boardTitle}</a>
                </td>
                <td>${board.boardWriter}</td>
                <td>${board.boardCreatedTime}</td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>

    <!-- 게시글 페이징 -->
    <div class="board-paging">
        <c:choose>
            <c:when test="${paging.page <= 1}">
                <a>이전</a>
            </c:when>
            <c:otherwise>
                <a href="/board/paging?page=${paging.page - 1}">이전</a>
            </c:otherwise>
        </c:choose>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.page}">
                    <span class="current-page">${i}</span>
                </c:when>
                <c:otherwise>
                    <a href="/board/paging?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${paging.page >= paging.maxPage}">
                <a>다음</a>
            </c:when>
            <c:otherwise>
                <a href="/board/paging?page=${paging.page + 1}">다음</a>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="btn-board-detail">
        <button onclick="writeFn()">글작성</button>
    </div>
</body>
<script>
    const writeFn = () => {
        location.href = "/board/write";
    }
</script>
</html>

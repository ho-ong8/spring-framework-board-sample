<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List</title>
</head>
<body>
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
    <div>
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
                    <span>${i}</span>
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
</body>
</html>

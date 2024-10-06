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
    <title>Index</title>
    <!-- css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.0/reset.css">
    <link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<body>
    <h1>Index</h1>
    <div class="container">
        <a href="/member/login">로그인</a>
        <a href="/member/join">회원가입</a>
        <a href="/member/">회원목록</a>
        <div class="btn-index">
            <button onclick="writeFn()">글작성</button>
            <button onclick="pagingFn()">글목록</button>
        </div>
    </div>
</body>
<script>
    const writeFn = () => {
        location.href = "/board/write";
    }

    const pagingFn = () => {
        location.href = "/board/paging";
    }
</script>
</html>

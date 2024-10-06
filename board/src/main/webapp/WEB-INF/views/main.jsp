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
    <title>Main</title>
    <!-- css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.0/reset.css">
    <link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<body>
    <h1>Main</h1>
    <div class="container">
    <h2>안녕하세요! <span>${sessionScope.member}</span>님</h2>
        <div class="btn-index">
            <button onclick="updateFn()">정보수정</button>
            <button onclick="logoutFn()">로그아웃</button>
        </div>
    </div>
</body>
<script>
    const updateFn = () => {
        location.href = "/member/update";
    }

    const logoutFn = () => {
        location.href = "/member/logout";
    }
</script>
</html>

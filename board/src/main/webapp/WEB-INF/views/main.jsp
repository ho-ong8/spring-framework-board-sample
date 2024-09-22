<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main</title>
</head>
<body>
    <h1>Main</h1>
    <h2>안녕하세요! <span>${sessionScope.member}</span>님</h2>
    <button onclick="updateFn()">정보수정</button>
    <button onclick="logoutFn()">로그아웃</button>
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

<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <form action="/member/login" method="post">
        email: <input type="text" name="memberEmail" placeholder="email" /><br>
        password: <input type="password" name="memberPassword" placeholder="password" /><br>
        <input type="submit" value="로그인" />
    </form>
</body>
</html>

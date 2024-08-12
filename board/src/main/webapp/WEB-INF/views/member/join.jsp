<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Join</title>
</head>
<body>
    <form action="/member/join" method="post">
        email: <input type="text" name="memberEmail" placeholder="email" /><br>
        password: <input type="password" name="memberPassword" placeholder="password" /><br>
        name: <input type="text" name="memberName" placeholder="name" /><br>
        age: <input type="text" name="memberAge" placeholder="age" /><br>
        mobile: <input type="text" name="memberMobile" placeholder="mobile" /><br>
        <input type="submit" value="회원가입" />
    </form>
</body>
</html>

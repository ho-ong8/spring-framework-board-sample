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
    <title>Join</title>
    <!-- css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.0/reset.css">
    <link rel="stylesheet" href="${path}/resources/css/style.css">
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
    <h1>Join</h1>
    <form action="/member/join" method="post">
        email: <input type="text" name="memberEmail" placeholder="email" id="memberEmail" onblur="checkEmail()" /><br>
        <p id="check-result"></p>
        password: <input type="password" name="memberPassword" placeholder="password" /><br>
        name: <input type="text" name="memberName" placeholder="name" /><br>
        age: <input type="text" name="memberAge" placeholder="age" /><br>
        mobile: <input type="text" name="memberMobile" placeholder="mobile" /><br>
        <input type="submit" value="회원가입" />
    </form>
</body>
<script>
    const checkEmail = () => {
        const email = document.getElementById("memberEmail").value;
        const checkResult = document.getElementById("check-result");

        $.ajax({
            type: "post",
            url: "/member/check-email",
            data: {
                "memberEmail": email
            },
            success: function(res) {
                console.log("요청성공", res);

                if (res == "ok") {
                    console.log("이메일 사용가능");
                    checkResult.style.margin = "10px 0 20px";
                    checkResult.style.color = "green";
                    checkResult.innerHTML = "이메일 사용가능";
                } else {
                    console.log("이메일 사용불가능");
                    checkResult.style.margin = "10px 0 20px";
                    checkResult.style.color = "red";
                    checkResult.innerHTML = "이메일 사용불가능";
                }
            },
            error: function(err) {
                console.log("에러발생", err);
            }
        });
    }
</script>
</html>

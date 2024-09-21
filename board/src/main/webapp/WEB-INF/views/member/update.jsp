<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update</title>
</head>
<body>
    <form action="/member/update" method="post" name="updateForm">
        id: <input type="text" name="id" value="${member.id}" readonly /><br>
        email: <input type="text" name="memberEmail" value="${member.memberEmail}" readonly /><br>
        password: <input type="password" name="memberPassword" id="memberPassword" /><br>
        name: <input type="text" name="memberName" value="${member.memberName}" /><br>
        age: <input type="text" name="memberAge" value="${member.memberAge}" /><br>
        mobile: <input type="text" name="memberMobile" value="${member.memberMobile}" /><br>
        <input type="button" value="정보수정" onclick="update()" />
    </form>
</body>
<script>
    const update = () => {
        const password = "${member.memberPassword}";
        const inputPassword = document.getElementById("memberPassword").value;

        if (password == inputPassword) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다.");
        }
    }
</script>
</html>

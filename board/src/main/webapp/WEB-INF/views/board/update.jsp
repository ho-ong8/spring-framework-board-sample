<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update</title>
</head>
<body>
    <form action="/board/update" method="post" name="updateForm">
        <input type="hidden" name="id" value="${board.id}" readonly /><br>
        writer: <input type="text" name="boardWriter" value="${board.boardWriter}" readonly /><br>
        password: <input type="password" name="boardPassword" id="boardPassword" /><br>
        title: <input type="text" name="boardTitle" value="${board.boardTitle}" /><br>
        contents: <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea><br>
        <input type="button" value="글수정" onclick="update()" />
    </form>
</body>
<script>
    const update = () => {
        const password = "${board.boardPassword}";
        const inputPassword = document.getElementById("boardPassword").value;

        if (password == inputPassword) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다.");
        }
    }
</script>
</html>

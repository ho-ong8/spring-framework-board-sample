<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Write</title>
</head>
<body>
    <form action="/board/write" method="post">
        writer: <input type="text" name="boardWriter" placeholder="writer" /><br>
        password: <input type="password" name="boardPassword" placeholder="password" /><br>
        title: <input type="text" name="boardTitle" placeholder="title" /><br>
        contents: <textarea name="boardContents" cols="30" rows="10" placeholder="contents"></textarea><br>
        <input type="submit" value="글작성" />
    </form>
</body>
</html>

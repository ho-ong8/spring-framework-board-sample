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
    <title>Write</title>
    <!-- css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.0/reset.css">
    <link rel="stylesheet" href="${path}/resources/css/style.css">
</head>
<body>
    <h1>Write</h1>
    <form action="/board/write" method="post">
        writer: <input type="text" name="boardWriter" placeholder="writer" /><br>
        password: <input type="password" name="boardPassword" placeholder="password" /><br>
        title: <input type="text" name="boardTitle" placeholder="title" /><br>
        contents: <textarea name="boardContents" cols="30" rows="10" placeholder="contents"></textarea><br>
        <input type="submit" value="글작성" />
    </form>
</body>
</html>

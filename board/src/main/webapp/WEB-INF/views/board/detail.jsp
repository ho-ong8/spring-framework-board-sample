<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Detail</title>
</head>
<body>
    <table>
        <tr>
            <th>id</th>
            <td>${board.id}</td>
        </tr>
        <tr>
            <th>writer</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>date</th>
            <td>${board.boardCreatedTime}</td>
        </tr>
        <tr>
            <th>hits</th>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <th>title</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>contents</th>
            <td>${board.boardContents}</td>
        </tr>
    </table>
    <button onclick="list()">목록</button>
    <button onclick="update()">수정</button>
    <button onclick="del()">삭제</button>
</body>
<script>
    const list = () => {
        location.href = "/board/";
    }

    const update = () => {
        const id = "${board.id}";
        location.href = "/board/update?id=" + id;
    }

    const del = () => {
        const id = "${board.id}";
        location.href = "/board/delete?id=" + id;
    }
</script>
</html>

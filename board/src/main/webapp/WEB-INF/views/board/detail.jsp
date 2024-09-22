<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Detail</title>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
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
    <button onclick="listFn()">글목록</button>
    <button onclick="updateFn()">글수정</button>
    <button onclick="deleteFn()">글삭제</button>

    <!-- 댓글 -->
    <div>
        <!-- 댓글 작성 -->
        writer: <input type="text" id="commentWriter" placeholder="writer" /><br>
        contents: <input type="text" id="commentContents" placeholder="contents" /><br>
        <button onclick="writeFn()">댓글작성</button>
        <!-- 댓글 목록 -->
        <div id="comment-list">
            <table>
                <tr>
                    <th>id</th>
                    <th>writer</th>
                    <th>contents</th>
                    <th>date</th>
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.id}</td>
                        <td>${comment.commentWriter}</td>
                        <td>${comment.commentContents}</td>
                        <td>${comment.commentCreatedTime}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
<script>
    const listFn = () => {
        const page = "${page}"
        location.href = "/board/paging?page=" + page;
    }

    const updateFn = () => {
        const id = "${board.id}";
        location.href = "/board/update?id=" + id;
    }

    const deleteFn = () => {
        const id = "${board.id}";
        location.href = "/board/delete?id=" + id;
    }

    const writeFn = () => {
        const id = "${board.id}";
        const writer = document.getElementById("commentWriter").value;
        const contents = document.getElementById("commentContents").value;

        $.ajax({
            type: "post",
            url: "/comment/write",
            data: {
                boardId: id,
                commentWriter: writer,
                commentContents: contents,
            },
            dataType: "json",
            success: function(commentList) {
                console.log("요청성공", commentList);

                let output = "<table>";
                output += "<tr><th>id</th>";
                output += "<th>writer</th>";
                output += "<th>contents</th>";
                output += "<th>date</th></tr>";

                for (let i in commentList) {
                    output += "<tr>";
                    output += "<td>" + commentList[i].id + "</td>";
                    output += "<td>" + commentList[i].commentWriter + "</td>";
                    output += "<td>" + commentList[i].commentContents + "</td>";
                    output += "<td>" + commentList[i].commentCreatedTime + "</td>";
                    output += "</tr>";
                }

                output += "</table>";
                document.getElementById("comment-list").innerHTML = output;
                document.getElementById("commentWriter").value = "";
                document.getElementById("commentContents").value = "";
            },
            error: function(err) {
                console.log("에러발생", err);
            }
        });
    }
</script>
</html>

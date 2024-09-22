<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List</title>
</head>
<body>
    <table>
        <tr>
            <th>id</th>
            <th>email</th>
            <th>password</th>
            <th>name</th>
            <th>age</th>
            <th>mobile</th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.id}</td>
                <td>
                    <a href="/member?id=${member.id}">${member.memberEmail}</a>
                </td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberAge}</td>
                <td>${member.memberMobile}</td>
                <td>
                    <a href="/member?id=${member.id}">회원조회</a>
                </td>
                <td>
                    <button onclick="deleteFn('${member.id}')">회원삭제</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
<script>
    const deleteFn = (id) => {
        location.href = "/member/delete?id=" + id;
    }
</script>
</html>

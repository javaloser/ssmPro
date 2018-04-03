<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
</head>
    <script type="text/javascript">

        function deleteUser(action) {
            $("#deleteForm").attr("action", action).submit();
            console.log("111111");
            return false;
        }
    </script>
<body>
<form id="deleteForm" action="" method="POST">
    <input type="hidden" name="_method" value="DELETE"/>
</form>
<c:if test="${empty requestScope.users}">
    没有员工信息
</c:if>
<c:if test="${!empty requestScope.users }">
    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Sex</th>
            <th colspan="2">options</th>

        </tr>

        <c:forEach items="${requestScope.users }" var="user">
            <tr>
                <td>${user.id }</td>
                <td>${user.userName }</td>
                <td>${user.age }</td>
                <td>${user.sex }</td>
                <td><a href="crud/${user.id}">Edit</a></td>
                <td><a class="delete" href="javascript:void(0)" onclick="deleteUser('${pageContext.request.contextPath}/user/crud/${user.id}')">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<a href="crud">add new user</a>
<br><br>
</body>
</html>
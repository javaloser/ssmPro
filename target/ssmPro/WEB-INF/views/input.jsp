<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: liuyunfei
  Date: 2018/3/23
  Time: 下午4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form:form action="${pageContext.request.contextPath}/user/crud" method="post" modelAttribute="user">
        <c:if test="${user.id != null}">
            <form:hidden path="id"></form:hidden>
            <input type="hidden" name="_method" value="PUT">
        </c:if>
       姓名：<form:input path="userName" ></form:input><br>
       年龄：<form:input path="age" ></form:input><br>
        <%
            Map<String,String> sexs = new HashMap<>();
            sexs.put("男","male");
            sexs.put("女","female");
            request.setAttribute("sexs",sexs);
        %>
        性别:<form:radiobuttons path="sex" items="${sexs}"></form:radiobuttons>
        <br>
        <input type="submit" value="提交" />
    </form:form>

</body>
</html>

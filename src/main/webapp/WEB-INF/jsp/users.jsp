<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><s:message code="label.users.title"/></title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
    <div class="wrapper">
        <%@include file="fragments/header.jsp" %>
        <div class="middle1">
            <div class="container1">
                <main class="content1">
                    <table class="table">
                        <h3><s:message code="label.users.title"/></h3>
                        <tr>
                            <thead class="thead-dark">
                                <th class="text-center">ID</th>
                                <th class="text-center">Email</th>
                                <th class="text-center"><s:message code="label.user.firstName"/></th>
                                <th class="text-center"><s:message code="label.user.lastName"/></th>
                                <th class="text-center"><s:message code="label.user.roles"/></th>
                                <th class="text-center"><s:message code="label.user.grade"/>,%</th>
                                <td><input type="button" class="btn btn-success" value="<s:message code="link.users.newUser"/>"
                                           onClick='location.href="${pageContext.request.contextPath}/user"'>
                                </td>
                            </thead>
                        </tr>
                        <c:forEach items="${allUsers}" var="user">
                            <tr>
                                <td class="td">${user.id}</td>
                                <td class="td">${user.email}</td>
                                <td class="td">${user.first_name}</td>
                                <td class="td">${user.last_name}</td>
                                <td class="td">
                                    <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
                                </td>
                                <td class="td" align="center">${user.grade}</td>
                                <td>
                                    <input type="button" class="btn btn-info" value="<s:message code="button.edit"/>"
                                           onClick='location.href="${pageContext.request.contextPath}/user/${user.id}"'>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/users" method="post">
                                        <input type="hidden" name="userId" value="${user.id}"/>
                                        <input type="hidden" name="action" value="delete"/>
                                        <button type="submit" class="btn btn-danger"><s:message code="button.delete"/>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </main>
            </div>
            <%@include file="fragments/menu.jsp" %>
        </div>
    </div>
    <%@include file="fragments/footer.jsp" %>
</body>
</html>

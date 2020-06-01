<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><s:message code="label.login.title"/></title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
    <sec:authorize access="isAuthenticated()">
        <% response.sendRedirect("/"); %>
    </sec:authorize>
    <div class="wrapper">
        <%@include file="fragments/header.jsp" %>
        <div class="middle1">
            <div class="container1">
                <main class="content1">
                    <h3><s:message code="label.login.login"/></h3>
                    <form class="formOne" method="post" action="/login">
                        <fieldset>
                            <label>
                                Email <input name="username" type="text" placeholder="Email" autofocus="true"/>
                            </label>
                            <label>
                                <s:message code="label.login.password"/> <input name="password" placeholder=
                                    <s:message code="label.login.password"/> type="password"/>
                            </label>
                            <br/>
                            <button type="submit" class="btn btn-primary">
                                <s:message code="button.login.logIn"/>
                            </button>
                        </fieldset>
                    </form>
                </main>
            </div>
        </div>
    </div>
    <%@include file="fragments/footer.jsp" %>
</body>
</html>

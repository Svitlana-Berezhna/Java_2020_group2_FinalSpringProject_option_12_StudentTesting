<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><s:message code="label.registration.title"/></title>
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
                    <h3><s:message code="label.registration.title"/></h3>
                    <form class="formOne" method="post" modelAttribute="userForm">
                        <fieldset>
                            <label>
                                Email <input name="email" type="text" path="email" placeholder="Email" autofocus="true" />
                                <form:errors path="email"></form:errors>
                            </label>
                            <label>
                                <s:message code="label.user.firstName"/> <input name="first_name" type="text"
                                    placeholder="<s:message code="label.user.firstName"/>" />
                            </label>
                            <label>
                                <s:message code="label.user.lastName"/> <input name="last_name" type="text"
                                    placeholder="<s:message code="label.user.lastName"/>" />
                            </label>
                            <label>
                                <s:message code="label.user.firstNameEn"/> <input name="first_name_en" type="text"
                                    placeholder="<s:message code="label.user.firstNameEn"/>" />
                            </label>
                            <label>
                                <s:message code="label.user.lastNameEn"/> <input name="last_name_en" type="text"
                                    placeholder="<s:message code="label.user.lastNameEn"/>" />
                            </label>
                            <label>
                                <s:message code="label.login.password"/> <input name="password" type="password"
                                    path="password" placeholder="<s:message code="label.login.password"/>" />
                            </label>
                            <label>
                                <s:message code="label.registration.passwordConfirm"/> <input name="passwordConfirm"
                                    path="passwordConfirm" placeholder="<s:message code="label.registration.passwordConfirm"/>"
                                    type="password" />
                                    <errors path="password"></errors>
                            </label>
                            <br/>
                            <button type="submit" class="btn btn-success"><s:message code="label.index.register"/></button>
                        </fieldset>
                    </form>
                </main>
            </div>
        </div>
    </div>
    <%@include file="fragments/footer.jsp" %>
</body>
</html>

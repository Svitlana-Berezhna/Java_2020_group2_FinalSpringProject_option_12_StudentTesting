<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${user.id == null}"><s:message code="link.users.newUser"/></c:when>
            <c:otherwise><s:message code="link.users.editUser"/></c:otherwise>
        </c:choose>
    </title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body>
    <div class="wrapper">
        <%@include file="fragments/header.jsp" %>
        <div class="middle1">
            <div class="container1">
                <main class="content1">
                    <c:choose>
                        <c:when test="${user.id == null}">
                            <h3><s:message code="link.users.newUser"/></h3>
                            <form class="formOne" action="${pageContext.request.contextPath}/user_save" method="post">
                        </c:when>
                        <c:otherwise>
                            <h3><s:message code="link.users.editUser"/></h3>
                            <form class="formOne" action="${pageContext.request.contextPath}/user" method="post">
                        </c:otherwise>
                    </c:choose>
                    <fieldset>
                        <input type="hidden" name="id" value="${user.id}"/>
                        <label>
                            Email <input type="text" id="email" name="email" placeholder="Email"
                            <c:choose>
                                <c:when test="${user.id != null}">
                                    value="<c:out value="${user.email}"/>"
                                </c:when>
                            </c:choose>
                            />
                        </label>
                        <label>
                            <s:message code="label.login.password"/> <input type="password" id="password"
                                name="password" placeholder="<s:message code="label.login.password"/>"
                            <c:choose>
                                <c:when test="${user.id != null}">
                                    value="<c:out value="${user.password}"/>"
                                </c:when>
                            </c:choose>
                            />
                        </label>
                        <label>
                            <s:message code="label.user.firstName"/> <input type="text" id="first_name"
                                name="first_name" placeholder="<s:message code="label.user.firstName"/>"
                            <c:choose>
                                <c:when test="${user.id != null}">
                                    value="<c:out value="${user.first_name}"/>"
                                </c:when>
                            </c:choose>
                            />
                        </label>
                        <label>
                            <s:message code="label.user.lastName"/> <input type="text" id="last_name"
                                name="last_name" placeholder="<s:message code="label.user.lastName"/>"
                            <c:choose>
                                <c:when test="${user.id != null}">
                                    value="<c:out value="${user.last_name}"/>"
                                </c:when>
                            </c:choose>
                            />
                        </label>
                        <label>
                            <s:message code="label.user.firstNameEn"/> <input type="text" id="first_name_en"
                                name="first_name_en" placeholder="<s:message code="label.user.firstNameEn"/>"
                            <c:choose>
                                <c:when test="${user.id != null}">
                                    value="<c:out value="${user.first_name_en}"/>"
                                </c:when>
                            </c:choose>
                            />
                        </label>
                        <label>
                            <s:message code="label.user.lastNameEn"/> <input type="text" id="last_name_en"
                                name="last_name_en" placeholder="<s:message code="label.user.lastNameEn"/>"
                            <c:choose>
                                <c:when test="${user.id != null}">
                                    value="<c:out value="${user.last_name_en}"/>"
                                </c:when>
                            </c:choose>
                            />
                        </label>
                        <label>
                            <s:message code="label.user.grade"/>,% <input type="text" id="grade" name="grade"
                                placeholder="<s:message code="label.user.grade"/>,%"
                            <c:choose>
                                <c:when test="${user.id != null}">
                                    value="<c:out value="${user.grade}"/>"
                                </c:when>
                            </c:choose>
                            />
                        </label>
                        <br/>
                        <input type="hidden" name="action" value="update"/>
                        <button type="submit" class="btn btn-success"><s:message code="label.user.submit"/></button>
                    </fieldset>
                            </form>
                </main>
            </div>
            <%@include file="fragments/menu.jsp" %>
        </div>
    </div>
    <%@include file="fragments/footer.jsp" %>
</body>
</html>

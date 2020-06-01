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
            <c:when test="${theme.id == null}"><s:message code="link.themes.newTheme"/></c:when>
            <c:otherwise><s:message code="link.themes.editTheme"/></c:otherwise>
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
                        <c:when test="${theme.id == null}">
                            <h3><s:message code="link.themes.newTheme"/></h3>
                            <form class="formOne" action="${pageContext.request.contextPath}/theme_save" method="post">
                        </c:when>
                        <c:otherwise>
                            <h3><s:message code="link.themes.editTheme"/></h3>
                            <form class="formOne" action="${pageContext.request.contextPath}/theme" method="post">
                        </c:otherwise>
                    </c:choose>
                    <fieldset>
                        <input type="hidden" name="id" value="${theme.id}"/>
                        <label>
                            <s:message code="label.theme.theme"/> <input type="text" id="theme" name="theme"
                                placeholder="<s:message code="label.theme.theme"/>"
                                <c:choose>
                                    <c:when test="${theme.id != null}">
                                        value="<c:out value="${theme.theme}"/>"
                                    </c:when>
                                </c:choose>
                                />
                        </label>
                        <label>
                            <s:message code="label.theme.description"/> <input type="text" id="description"
                                name="description" placeholder="<s:message code="label.theme.description"/>"
                                <c:choose>
                                    <c:when test="${theme.id != null}">
                                        value="<c:out value="${theme.description}"/>"
                                    </c:when>
                                </c:choose>
                                />
                        </label>
                        <label>
                            <s:message code="label.theme.themeEn"/> <input type="text" id="theme_en" name="theme_en"
                                placeholder="<s:message code="label.theme.themeEn"/>"
                                <c:choose>
                                    <c:when test="${theme.id != null}">
                                        value="<c:out value="${theme.theme_en}"/>"
                                    </c:when>
                                </c:choose>
                                />
                        </label>
                        <label>
                            <s:message code="label.theme.descriptionEn"/> <input type="text" id="description_en"
                                name="description_en" placeholder="<s:message code="label.theme.descriptionEn"/>"
                                <c:choose>
                                    <c:when test="${theme.id != null}">
                                        value="<c:out value="${theme.description_en}"/>"
                                    </c:when>
                                </c:choose>
                                />
                        </label>
                        <label>
                            <s:message code="label.theme.time"/> <input type="text" id="time" name="time"
                                placeholder="<s:message code="label.theme.time"/>"
                                <c:choose>
                                    <c:when test="${theme.id != null}">
                                        value="<c:out value="${theme.time}"/>"
                                    </c:when>
                                </c:choose>
                                />
                        </label>
                        <label>
                            <s:message code="label.theme.passingGrade"/>, % <input type="text" id="passing_grade"
                                name="passing_grade" placeholder="<s:message code="label.theme.passingGrade"/>, %"
                                <c:choose>
                                    <c:when test="${theme.id != null}">
                                        value="<c:out value="${theme.passing_grade}"/>"
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

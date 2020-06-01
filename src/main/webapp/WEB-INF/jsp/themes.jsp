<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><s:message code="label.themes.title"/></title>
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
                        <h3><s:message code="label.themes.title"/></h3>
                        <tr>
                            <thead class="thead-dark">
                                <th class="text-center">ID</th>
                                <th class="text-center"><s:message code="label.theme.theme"/></th>
                                <th class="text-center"><s:message code="label.theme.description"/></th>
                                <th class="text-center"><s:message code="label.theme.time"/></th>
                                <th class="text-center"><s:message code="label.theme.passingGrade"/>,%</th>
                                <td class="text-center"><input type="button" class="btn btn-success"
                                                               value="<s:message code="link.themes.newTheme"/>"
                                                               onClick='location.href="${pageContext.request.contextPath}/theme"'>
                                </td>
                            </thead>
                        </tr>
                        <c:forEach items="${allThemes}" var="theme">
                            <tr>
                                <td class="td">${theme.id}</td>
                                <td class="td">${theme.theme}</td>
                                <td class="td">${theme.description}</td>
                                <td class="td" align="center">${theme.time}</td>
                                <td class="td" align="center">${theme.passing_grade}</td>
                                <td><input type="button" class="btn btn-secondary" value="<s:message code="button.edit"/>"
                                        onClick='location.href="${pageContext.request.contextPath}/theme/${theme.id}"'>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/themes" method="post">
                                        <input type="hidden" name="themeId" value="${theme.id}"/>
                                        <input type="hidden" name="action" value="delete"/>
                                        <button type="submit" class="btn btn-danger"><s:message code="button.delete"/>
                                        </button>
                                    </form>
                                </td>
                                <td>
                                    <input type="button" class="btn btn-info" value="<s:message code="label.index.questions"/>"
                                        onClick='location.href="${pageContext.request.contextPath}/questions/${theme.id}"'>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/tests/${theme.id}" method="post">
                                        <input type="hidden" name="theme_id" value="${theme.id}"/>
                                        <input type="hidden" name="action" value="read"/>
                                        <button type="submit" class="btn btn-primary"><s:message code="button.startTest"/>
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

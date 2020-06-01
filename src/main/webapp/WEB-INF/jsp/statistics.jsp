<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <title><s:message code="label.questions.title"/></title>
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
                        <h3><s:message code="label.statistics.reportStudents"/></h3>
                        <tr>
                            <thead class="thead-dark">
                                <th class="text-center">Email</th>
                                <th class="text-center"><s:message code="label.user.firstName"/></th>
                                <th class="text-center"><s:message code="label.user.lastName"/></th>
                                <th class="text-center"><s:message code="label.statistics.totalGrade"/>,%</th>
                                <th class="text-center"><s:message code="label.statistics.test"/></th>
                                <th class="text-center"><s:message code="label.theme.passingGrade"/>,%</th>
                                <th class="text-center"><s:message code="label.results.correctAnswers"/></th>
                                <th class="text-center"><s:message code="label.user.grade"/>,%</th>
                            </thead>
                        </tr>
                        <c:forEach items="${statistics}" var="stat">
                            <tr>
                                <td class="td">${stat.email}</td>
                                <td class="td">${stat.first_name}</td>
                                <td class="td">${stat.last_name}</td>
                                <td class="td" align="center">${stat.total_grade}</td>
                                <td class="td">${stat.theme}</td>
                                <td class="td" align="center">${stat.passing_grade}</td>
                                <td class="td" align="center">${stat.correct_answers}
                                    <s:message code="label.statistics.from"/> ${stat.total_answers}</td>
                                <td class="td" align="center">${stat.grade}</td>
                                <td class="td" align="center">
                                    <c:choose>
                                        <c:when test="${stat.grade < stat.passing_grade}">
                                            <img src="${contextPath}/resources/images/incorrectAnswer.png"
                                                 alt="incorrect answer" height="13" width="13">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${contextPath}/resources/images/correctAnswer.png"
                                                 alt="correct answer" height="13" width="13">
                                        </c:otherwise>
                                    </c:choose>
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

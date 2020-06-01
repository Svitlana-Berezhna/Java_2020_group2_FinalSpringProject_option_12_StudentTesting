<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
                    <br>
                    <form name="question" action="${pageContext.request.contextPath}/test_save" method="post">
                        <c:forEach items="${allQuestionsByThemeId}" var="question" varStatus="status">
                            <c:url value="/tests/${question.theme_id}" var="pagedLink">
                                <c:param name="p" value="~"/>
                            </c:url>
                            <div ${status.first ? '' : 'style = "display:none"'}><p><b><s:message
                                    code="label.results.testResultsOnTheTheme"/> - "${question.theme}"</b> (<s:message
                                    code="label.theme.passingGrade"/> ${question.passing_grade}%):
                                <div ${total_grade < question.passing_grade ? 'style = "color:red; display:inline"' :
                                        'style = "color:green"'}>
                                    <b><s:message code="${total_grade < question.passing_grade? 'label.results.failure' :
                                        'label.results.success'}"/></b>
                                </div>
                                <div style="color:black; display:inline">
                                    (<s:message code="label.results.correctAnswers"/>: ${correct_answers};
                                    <s:message code="label.results.totalQuestions"/>: ${total_questions};
                                    <s:message code="label.user.grade"/>: ${total_grade}%)
                                </div>
                            </div>
                            <br>
                            <input type="hidden" name="theme_id" value="${question.theme_id}"/>
                            <input type="hidden" name="question_id" value="${question.question_id}"/>
                            <input type="hidden" id="option1_en" value="${question.option1_en}">
                            <input type="hidden" id="option2_en" value="${question.option2_en}">
                            <input type="hidden" id="option3_en" value="${question.option3_en}">
                            <input type="hidden" id="option4_en" value="${question.option4_en}">
                            <input type="hidden" id="grade" value="${question.grade}">
                            <input type="hidden" id="answer" value="${question.answer}">
                            <div id="question" class="question">
                                <br>
                                <p>
                                    <c:choose>
                                        <c:when test="${question.grade == '1'}">
                                            <img src="${contextPath}/resources/images/correctAnswer.png"
                                             alt="correct answer" height="13" width="13">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${contextPath}/resources/images/incorrectAnswer.png"
                                             alt="incorrect answer" height="13" width="13">
                                        </c:otherwise>
                                    </c:choose>
                                    <b>${status.count}. ${question.question}</b><br>
                                </p>
                                <p>
                                    <input type="radio" disabled='true'
                                            <c:choose>
                                                <c:when test="${question.answer == question.option1 ||
                                                    question.answer == question.option1_en}">
                                                    checked='checked'
                                                </c:when>
                                            </c:choose>
                                    />${question.option1}<br>
                                    <input type="radio" disabled='true'
                                            <c:choose>
                                                <c:when test="${question.answer == question.option2 ||
                                                    question.answer == question.option2_en}">
                                                    checked='checked'
                                                </c:when>
                                            </c:choose>
                                    />${question.option2}<br>
                                    <input type="radio" disabled='true'
                                            <c:choose>
                                                <c:when test="${question.answer == question.option3 ||
                                                    question.answer == question.option3_en}">
                                                    checked='checked'
                                                </c:when>
                                            </c:choose>
                                    />${question.option3}<br>
                                    <input type="radio" disabled='true'
                                            <c:choose>
                                                <c:when test="${question.answer == question.option4 ||
                                                    question.answer == question.option4_en}">
                                                    checked='checked'
                                                </c:when>
                                            </c:choose>
                                    />${question.option4}<br>
                                    <p><b><s:message code="label.results.correctAnswer"/>: </b>
                                        ${question.correct_answer}<br>
                                    </p>
                                    <p><b><s:message code="label.results.explanation"/>: </b>
                                            ${question.explanation}<br><br>
                                    </p>
                                </p>
                            </div>
                        </c:forEach>
                        <br>
                    </form>
                </main>
            </div>
            <%@include file="fragments/menu.jsp" %>
        </div>
    </div>
    <br>
    <%@include file="fragments/footer.jsp" %>
</body>
</html>

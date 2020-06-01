<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                    <h3><s:message code="label.questions.title"/></h3>
                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <thead class="table-dark">
                                <th class="text-center"><s:message code="label.theme.theme"/> ID</th>
                                <th class="text-center">ID</th>
                                <th class="text-center"><s:message code="label.questions.question"/></th>
                                <th class="text-center"><s:message code="label.questions.option"/> 1</th>
                                <th class="text-center"><s:message code="label.questions.option"/> 2</th>
                                <th class="text-center"><s:message code="label.questions.option"/> 3</th>
                                <th class="text-center"><s:message code="label.questions.option"/> 4</th>
                                <th class="text-center"><s:message code="label.questions.correctAnswer"/></th>
                                <th class="text-center"></th>
                                <th class="text-center"><input type="button" class="btn btn-success"
                                                           value="<s:message code="link.questions.newQuestion"/>"
                                                           onClick='location.href="${pageContext.request.contextPath}/question"'>
                                </th>
                            </thead>
                        </tr>
                        <tbody>
                            <c:forEach items="${allQuestions}" var="question">
                                <tr>
                                    <td class="td" align="center">${question.theme_id}</td>
                                    <td class="td" align="center">${question.question_id}</td>
                                    <td class="td">${question.question}</td>
                                    <td class="td">${question.option1}</td>
                                    <td class="td">${question.option2}</td>
                                    <td class="td">${question.option3}</td>
                                    <td class="td">${question.option4}</td>
                                    <td class="td">${question.correct_answer}</td>
                                    <td>
                                        <input type="button" class="btn btn-info" value="<s:message code="button.edit"/>"
                                            onClick='location.href=
                                                    "${pageContext.request.contextPath}/question/${question.question_id}"'>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/questions" method="post">
                                            <input type="hidden" name="questionId" value="${question.question_id}"/>
                                            <input type="hidden" name="action" value="delete"/>
                                            <button type="submit" class="btn btn-danger"><s:message code="button.delete"/></button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </main>
            </div>
            <%@include file="fragments/menu.jsp" %>
        </div>
    </div>
    <br><br><br>
    <%@include file="fragments/footer.jsp" %>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title><s:message code="label.questions.title"/></title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body onload="ch();">
    <div class="wrapper">
        <%@include file="fragments/header.jsp" %>
        <div class="middle1">
            <div class="container1">
                <main class="content1">
                    <form name="question" action="${pageContext.request.contextPath}/test_save" method="post">
                        <c:forEach items="${pagedListHolder.pageList}" var="question">
                            <jsp:useBean id="pagedListHolder" scope="request"
                                         type="org.springframework.beans.support.PagedListHolder"/>
                            <c:url value="/tests/${question.theme_id}" var="pagedLink">
                                <c:param name="p" value="~"/>
                            </c:url>
                            <input type="hidden" name="theme_id" value="${question.theme_id}"/>
                            <input type="hidden" name="question_id" value="${question.question_id}"/>
                            <input type="hidden" id="option1_en" value="${question.option1_en}">
                            <input type="hidden" id="option2_en" value="${question.option2_en}">
                            <input type="hidden" id="option3_en" value="${question.option3_en}">
                            <input type="hidden" id="option4_en" value="${question.option4_en}">
                            <input type="hidden" id="answer" value="${question.answer}">
                            <input type="hidden" name="page" value="${pagedListHolder.page}"/>
                            <input type="hidden" name="pageCount" value="${pagedListHolder.pageCount}"/>
                            <br>
                            <div id="question" class="question">
                                <br>
                                <p><b>${question.question}</b><br></p>
                                <p>
                                    <input type="radio" id="option1" name="answer" value="${question.option1}">
                                        ${question.option1}<br>
                                    <input type="radio" id="option2" name="answer" value="${question.option2}">
                                        ${question.option2}<br>
                                    <input type="radio" id="option3" name="answer" value="${question.option3}">
                                        ${question.option3}<br>
                                    <input type="radio" id="option4" name="answer" value="${question.option4}">
                                        ${question.option4}<br>
                                </p>
                                <br>
                            </div>
                            <br>
                            <p><input type="submit" class="btn btn-primary" value="<s:message code='label.user.submit'/>">
                                <input type="reset" class="btn btn-secondary" value="<s:message code='button.test.clear'/>">&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="button" class="btn btn-danger" value="<s:message code="button.test.finishTest"/>"
                                       onClick='location.href="${pageContext.request.contextPath}/results/${question.theme_id}"'>
                            </p>
                        </c:forEach>
                        <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}"/>
                        <br>
                    </form>
                </main>
            </div>
            <%@include file="fragments/menu.jsp" %>
        </div>
    </div>
    <%@include file="fragments/footer.jsp" %>
    <script type="text/javascript">
        function ch() {
            if (document.getElementById("option1").value == document.getElementById("answer").value ||
                document.getElementById("option1_en").value == document.getElementById("answer").value)
                document.getElementById("option1").checked = true;
            if (document.getElementById("option2").value == document.getElementById("answer").value ||
                document.getElementById("option2_en").value == document.getElementById("answer").value)
                document.getElementById("option2").checked = true;
            if (document.getElementById("option3").value == document.getElementById("answer").value ||
                document.getElementById("option3_en").value == document.getElementById("answer").value)
                document.getElementById("option3").checked = true;
            if (document.getElementById("option4").value == document.getElementById("answer").value ||
                document.getElementById("option4_en").value == document.getElementById("answer").value)
                document.getElementById("option4").checked = true;
        }
    </script>
</body>
</html>

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
            <c:when test="${question.question_id == null}">
                <s:message code="link.questions.newQuestion"/>
            </c:when>
            <c:otherwise>
                <s:message code="link.questions.editQuestion"/>
            </c:otherwise>
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
                        <c:when test="${question.question_id == null}">
                            <h3><s:message code="link.questions.newQuestion"/></h3>
                            <form class="formOne" action="${pageContext.request.contextPath}/question_save" method="post">
                        </c:when>
                        <c:otherwise>
                            <h3><s:message code="link.questions.editQuestion"/></h3>
                            <form class="formOne" action="${pageContext.request.contextPath}/question" method="post">
                        </c:otherwise>
                    </c:choose>
                    <fieldset>
                        <table>
                            <tr>
                                <td>
                                    <select required="required" name="theme_id" id="select">
                                        <option disabled="disabled" selected="selected">
                                            <s:message code="label.test.select"/>
                                        </option>
                                        <c:forEach items="${allThemes}" var="theme">
                                            <option value="${theme.id}">${theme.theme}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <s:message code="label.questions.question"/> <input type="text" id="question"
                                            name="question" placeholder="<s:message code="label.questions.question"/>"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.question}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <s:message code="label.question.questionEn"/> <input type="text" id="question_en"
                                            name="question_en" placeholder="<s:message code="label.question.questionEn"/>"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.question_en}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <s:message code="label.questions.option"/> 1 <input type="text" id="option1"
                                            name="option1" placeholder="<s:message code="label.questions.option"/> 1"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.option1}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <s:message code="label.question.optionEn"/> 1 <input type="text" id="option1_en"
                                            name="option1_en" placeholder="<s:message code="label.question.optionEn"/> 1"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.option1_en}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <s:message code="label.questions.option"/> 2 <input type="text" id="option2"
                                            name="option2" placeholder="<s:message code="label.questions.option"/> 2"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.option2}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <s:message code="label.question.optionEn"/> 2 <input type="text" id="option2_en"
                                            name="option2_en" placeholder="<s:message code="label.question.optionEn"/> 2"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.option2_en}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <s:message code="label.questions.option"/> 3 <input type="text" id="option3"
                                            name="option3" placeholder="<s:message code="label.questions.option"/> 3"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.option3}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <s:message code="label.question.optionEn"/> 3 <input type="text" id="option3_en"
                                            name="option3_en" placeholder="<s:message code="label.question.optionEn"/> 3"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.option3_en}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <s:message code="label.questions.option"/> 4 <input type="text" id="option4"
                                            name="option4" placeholder="<s:message code="label.questions.option"/> 4"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.option4}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <s:message code="label.question.optionEn"/> 4 <input type="text" id="option4_en"
                                            name="option4_en" placeholder="<s:message code="label.question.optionEn"/> 4"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.option4_en}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <s:message code="label.questions.correctAnswer"/> <input type="text" id="correctAnswer"
                                            name="correct_answer" placeholder="<s:message code="label.questions.correctAnswer"/>"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.correct_answer}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                                <td>
                                    <label>
                                        <s:message code="label.question.correctAnswerEn"/> <input type="text" id="correctAnswer_en"
                                            name="correct_answer_en" placeholder="<s:message code="label.question.correctAnswerEn"/>"
                                        <c:choose>
                                            <c:when test="${question.question_id != null}">
                                                value="<c:out value="${question.correct_answer_en}"/>"
                                            </c:when>
                                        </c:choose>
                                        />
                                    </label>
                                </td>
                            </tr>
                        </table>
                        <input type="hidden" name="id" value="${question.question_id}"/>
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

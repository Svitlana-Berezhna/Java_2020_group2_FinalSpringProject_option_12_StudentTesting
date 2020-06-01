<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<aside class="left-sidebar1">
    <sec:authorize access="!isAuthenticated()">
        <button class="btn btn-light" onclick="window.location.href='/login'">
            <s:message code="label.index.signIn"/>
        </button>
        <button class="btn btn-light" onclick="window.location.href='/registration'">
            <s:message code="label.index.register"/>
        </button>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <form action="${pageContext.request.contextPath}/user/${0}" method="post">
            <input type="hidden" name="email" value="${pageContext.request.userPrincipal.name}"/>
            <button type="submit" class="btn btn-light"><s:message code="label.index.myProfile"/></button>
        </form>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <button class="btn btn-light" onclick="window.location.href='/users'">
                <s:message code="label.index.users"/>
            </button>
            <button class="btn btn-light" onclick="window.location.href='/themes'">
                <s:message code="label.index.themes"/>
            </button>
            <button class="btn btn-light" onclick="window.location.href='/questions'">
                <s:message code="label.index.questions"/>
            </button>
            <button class="btn btn-light" onclick="window.location.href='/statistics'">
                <s:message code="label.index.statistics"/>
            </button>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
            <button class="btn btn-light" onclick="window.location.href='/tests'">
                <s:message code="label.index.tests"/>
            </button>
            <button class="btn btn-light" onclick="window.location.href='/results'">
                <s:message code="label.index.results"/>
            </button>
        </sec:authorize>
    </sec:authorize>
</aside>

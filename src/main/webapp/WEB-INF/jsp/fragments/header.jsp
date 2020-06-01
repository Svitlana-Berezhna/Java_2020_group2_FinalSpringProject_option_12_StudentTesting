<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<header class="header">
    <div>
        <span>
            <a href="?lang=ua">
                <img src="${contextPath}/resources/images/langUa.png" width="25" height="25" border="0" alt="lang ua">
            </a>
            <a href="?lang=en">
                <img src="${contextPath}/resources/images/langEn.png" width="25" height="25" border="0" alt="lang en">
            </a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/"><s:message code="link.users.home"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/"><s:message code="label.index.aboutUs"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/"><s:message code="label.index.contactUs"/></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <sec:authorize access="!isAuthenticated()">
                <s:message code="label.header.hi"/>, <s:message code="label.header.guest"/>!
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <s:message code="label.header.hi"/>, ${pageContext.request.userPrincipal.name}!&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="/logout"><s:message code="label.index.signOut"/></a>
            </sec:authorize>
         </span>
    </div>
</header>

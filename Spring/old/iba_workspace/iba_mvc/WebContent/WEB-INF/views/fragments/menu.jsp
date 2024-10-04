<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/"     var="urlHome" />
<spring:url value="/role" var="role" />
<spring:url value="/category" var="category" />
<spring:url value="/registry" var="registry" />
<div class="topnav">
	<a href="${role}">Role</a>
	<a href="${category}">Category</a>
	<a href="${registry}">Registry</a>
</div> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header container-fluid">
	<div class="row">
		<div class="col-md-10">	
			<h1>IBA Header</h1>
		</div>
		<div class="col-md-1" style="padding-top: 10px;">
			<spring:url value="/resources/core/images/unknown_user.png" var="defaultUserImage" />
			<img alt="Default-user" src="${defaultUserImage}" style="border-radius: 50%; height: 50px; border: 1px solid black;">
			
		</div>
		<div class="col-md-1">
			<c:choose>
				<c:when test="${user == null}">
        			<a href="register">Register</a>
				</c:when>
				<c:otherwise>
        			<p><c:out value = "${user.firstName}"/>, <c:out value = "${user.lastName}"/></p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
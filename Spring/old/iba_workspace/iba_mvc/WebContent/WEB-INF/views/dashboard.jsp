<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
	<title>IBA - Dashboard - Test</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- IBA Custom Style -->
	<spring:url value="/resources/core/css/iba.css" var="ibaCss" />
	<link href="${ibaCss}" rel="stylesheet" />
	
	
	<!-- Bootstrap -->
	<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
	<link href="${bootstrapCss}" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/fragments/header.jsp" />
	<jsp:include page="/WEB-INF/views/fragments/menu.jsp" />
	<div class="container-fluid">
						User<c:out value = "${user.firstName}"/>
						<c:out value = "${user.lastName}"/>
						Email<c:out value = "${user.email}"/>
		<div class="col-md-5 right_col">
			<h3>Current Users</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Email</th>
					</tr>
				</thead>
				<tbody> 
					<c:forEach items = "${users}" var="user">
					<tr>
						<td><c:out value = "${user.firstName}"/></td>
						<td><c:out value = "${user.lastName}"/></td>
						<td><c:out value = "${user.email}"/></td>
					</tr>
		      		</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- jQuery -->
	<spring:url value="/resources/core/js/jquery-3.3.1.min.js" var="jqueryJs"/>
    <script src="${jqueryJs}"></script>
    <!-- bootstrap -->
	<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs"/>
	<script src="${bootstrapJs}"></script>
	
	<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>
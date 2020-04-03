<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
<title>IBA - Role</title>
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-10 col-md-offset-1 pageTitle">
				<h1>Role</h1> 
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-1"
				style="border-style: dotted; padding:30px; border-color: #337ab7; border-width: thick;">
				<div style="text-align: center;">
					<h3>New Role</h3>
				</div>
				<form:form class="form-horizontal" method="post" modelAttribute="newRole" action="newRole">
					<div class="form-group" >
						<spring:bind path="roleName">
							<label class="control-label" style="padding-left:20px">Role Name</label>
							<form:input path="roleName" type="text" class="form-control" id="roleName" placeholder="Role Name" />
							<form:errors path="roleName" class="control-label error-label" />
						</spring:bind>
					</div>
					<div class="form-group" >
						<spring:bind path="roleDescription">
							<label class="control-label" style="padding-left:20px">Role Name</label>
							<form:input path="roleDescription" type="text" class="form-control" id="roleDescription" placeholder="Role Description" />
							<form:errors path="roleDescription" class="control-label error-label" />
						</spring:bind>
					</div>
					<br />
					<br />

					<div class="row" style="text-align: center;">
						<button class="btn btn-primary" type="submit">Add new
							Role</button>
					</div>
				</form:form>
			</div>
			<div class="col-md-4 col-md-offset-2" style="text-align: center;">
				<br />
				<h3>Role Report</h3>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th scope="col">Role ID</th>
							<th scope="col">Role Name</th>
							<th scope="col">Role Description</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${roles}" var="role">
							<tr>
								<td><c:out value="${role.roleId}" /></td>
								<td><c:out value="${role.roleName}" /></td>
								<td><c:out value="${role.roleDescription}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
	<!-- jQuery -->
	<spring:url value="/resources/core/js/jquery-3.3.1.min.js"
		var="jqueryJs" />
	<script src="${jqueryJs}"></script>
	<!-- bootstrap -->
	<spring:url value="/resources/core/js/bootstrap.min.js"
		var="bootstrapJs" />
	<script src="${bootstrapJs}"></script>

	<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>
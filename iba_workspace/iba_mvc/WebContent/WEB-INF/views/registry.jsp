<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
<title>IBA - Registry</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- IBA Custom Style -->
<spring:url value="/resources/core/css/iba.css" var="ibaCss" />
<link href="${ibaCss}" rel="stylesheet" />

<!-- Bootstrap -->
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="/WEB-INF/views/fragments/header.jsp" />
	<div class="outer">
	<div class="container content" style="width: 95%;" >
		<div class="row">
			<div class="col-md-10 col-md-offset-1 title">
				<h1>Registry</h1> 
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 box">
				<div class="sub-title">
					<h3>New Registry</h3>
					<p>Enter registry data</p>
				</div>
				<form:form method="post" modelAttribute="newRegistry" action="newRegistry">
					<!-- Amount -->
					<div class="row general-input" >
						<div class="col-md-2" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-dollar-sign"></i>
						</div>
						<div class="col-md-10 form-group ${status.error ? 'has-error' : ''}">
							<form:input id="amount" path="amount" type="number" min="0" class="form-control" placeholder="Amount" value="0" maxlength="10"/>
							<form:errors path="amount" class="input-error" />
						</div>
					</div>
					<!-- Created On -->
					<div class="row general-input" >
						<div class="col-md-2" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-calendar-alt"></i>
						</div>
						<div class="col-md-10 form-group ${status.error ? 'has-error' : ''}">
							<form:input id="createdOn" path="createdOn" type="date" class="form-control currency"  placeholder="Created On" />
							<form:errors path="createdOn" class="control-label error-label" />
						</div>
					</div>
					<!-- Created Time -->
					<div class="row general-input" >
						<div class="col-md-2" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-clock"></i>
						</div>
						<div class="col-md-10 form-group ${status.error ? 'has-error' : ''}">
							<form:select path="createdTime">
				                <form:option selected="selected" value="am">AM</form:option>
				                <form:option value="pm">PM</form:option>
				            </form:select>
							<form:errors path="createdTime" class="control-label error-label" />
						</div>
					</div>
					<!-- Category -->
					<div class="row general-input" >
						<div class="col-md-2" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-tag"></i>
						</div>
						<div class="col-md-10 form-group ${status.error ? 'has-error' : ''}">
							<form:select path="categoryInput" class="form-control">
								<form:option  value="NONE" label="--- Select ---" />
								<form:options items="${categoryList}" itemLabel="categoryName"/>
							</form:select>
						</div>
					</div>
					<div class="row general-input" style="text-align: center;">
						<button class="btn btn-primary" type="submit">Add new Registry</button>
					</div>
					
				</form:form>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-7 box" style="text-align: center;">
				<div class="sub-title">
					<h3>Registries</h3>
					<p>Read only registries report</p>
				</div>
				<table class="table table-hover table-bordered">
					<thead class="table-header">
						<tr>
							<th>#</th>
							<th>Amount</th>
							<th>Created On</th>
							<th>Created Time</th>
							<th>Category</th>
							<th>Created By</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${registries}" var="registry">
							<tr>
								<td><c:out value="${registry.registryId}" /></td>
								<td><c:out value="${registry.amount}" /></td>
								<td><c:out value="${registry.createdOn}" /></td>
								<td><c:out value="${registry.createdTime}" /></td>
								<td><c:out value="${registry.category.categoryName}" /></td>
								<td><c:out value="${registry.createdBy.lastName}" />,<c:out value="${registry.createdBy.firstName}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
	<!-- jQuery -->
	<spring:url value="/resources/core/js/jquery-3.3.1.min.js" var="jqueryJs" />
	<script src="${jqueryJs}"></script>
	<!-- bootstrap -->
	<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
	<script src="${bootstrapJs}"></script>
<script>
	$(document).ready ( function(){
		document.getElementById('createdOn').valueAsDate = new Date();
	});
</script>
	<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>
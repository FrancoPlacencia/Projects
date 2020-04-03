<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
<title>IBA - Category</title>
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
	<jsp:include page="/WEB-INF/views/fragments/menu.jsp" />
	<div class="outer">
	<div class="container content" style="width: 95%;" >
		<div class="row">
			<div class="col-md-10 col-md-offset-1 title">
				<h1>Category</h1> 
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 box">
				<div class="sub-title">
					<h3>New Category</h3>
					<p>Enter category name and description</p>
				</div>
				<form:form method="post" modelAttribute="newCategory" action="newCategory">
					<div class="row general-input" >
						<div class="col-md-2" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-tag"></i>
						</div>
						<div class="col-md-10 form-group ${status.error ? 'has-error' : ''}">
							<form:input path="categoryName" type="text" class="form-control" id="categoryName" placeholder="Category Name" />
							<form:errors path="categoryName" class="input-error" />
						</div>
					</div>
					<div class="row general-input" >
						<div class="col-md-2" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-clipboard-list"></i>
						</div>
						<div class="col-md-10 form-group ${status.error ? 'has-error' : ''}">
							<form:input path="categoryDescription" type="text" class="form-control" id="categoryDescription" placeholder="Category Description" />
							<form:errors path="categoryDescription" class="control-label error-label" />
						</div>
					</div>
					<div class="row general-input" style="text-align: center;">
						<button class="btn btn-primary" type="submit">Add new Category</button>
					</div>
				</form:form>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-7 box" style="text-align: center;">
				<div class="sub-title">
					<h3>Categories</h3>
					<p>Read only categories report</p>
				</div>
				<table class="table table-hover table-bordered">
					<thead class="table-header">
						<tr>
							<th>#</th>
							<th>Name</th>
							<th>Description</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${categories}" var="category">
							<tr>
								<td><c:out value="${category.categoryId}" /></td>
								<td><c:out value="${category.categoryName}" /></td>
								<td><c:out value="${category.categoryDescription}" /></td>
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

	<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
</body>
</html>
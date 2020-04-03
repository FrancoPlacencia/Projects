<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<title>IBA - Login</title>
<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />


<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />

</head>
<body>
	<div id="outer">
		<div id="container">
			<div class="row" style="text-align:center;">
				<h1>This is the login</h1>
			</div>
			<br />
			<form:form class="form-horizontal" method="post" modelAttribute="user" action="login">
			<div class="row" style="text-align:right;">
				<spring:bind path="name">
					<i class="fas fa-user"></i>
					<label class="control-label">Name</label>
					<form:input path="name" type="text" class="form-control " id="name" placeholder="Name" />				
				</spring:bind>
			</div>
			<br />
			<div class="row" style="text-align:right;">
				<spring:bind path="password">
				<div class="col-sm-6 offset-sm-3" >
					<label class="control-label">Password</label>
				</div>
				<div class="col-sm-3">
					<form:password path="password" class="form-control" id="password" placeholder="password" />				
				</div>
				</spring:bind>
			</div>
			<br />
			<div class="row" style="text-align:center;">
				<button class="btn btn-primary" type="submit">Login</button>
			</div>
			</form:form>
			<br />
			<div class="row" style="text-align:center;">
				<a href="register">Register</a>
			</div>
		</div>
	</div>
</body>
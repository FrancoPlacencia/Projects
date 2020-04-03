<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<title>IBA - Register</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- IBA Custom Style -->
<spring:url value="/resources/core/css/iba.css" var="ibaCss" />
<link href="${ibaCss}" rel="stylesheet" />
<spring:url value="/resources/core/css/fonts.css" var="fontCss" />
<link href="${fontCss}" rel="stylesheet" />

<!-- Bootstrap -->
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
</head>
<body>
	<div class="outer" style="background-color: #337ab7;">
		<div class="container content" style="width: 60%;" >
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10 login-box">
					<div class="row" style="text-align:center; padding-bottom: 20px;">
						<div style="font-size:9em; color: #93C9F5">
							<i class="fas fa-pen-square"></i>
						</div>
						<h3 style="color: #1B67A6;">Sign up now</h3>
						<p>Fill in the form below to get instant access:</p>
						<br />
					</div>
					<form:form class="form-horizontal" method="post" modelAttribute="newUser" action="newUser">
					<form:hidden path="userId" />
					<div class="row register-input">
						<div class="col-md-3" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-user"></i>
						</div>
						<spring:bind path="firstName">
						<div class="col-md-7 form-group ${status.error ? 'has-error' : ''}">
							<form:input path="firstName" type="text" class="form-control" placeholder="First Name" />
							<form:errors path="firstName" class="input-error" />	
						</div>
						</spring:bind>
					</div>
					<div class="row register-input">
						<div class="col-md-3" style="font-size:2em; color:#2e6da4; text-align:right;">
							&nbsp;
						</div>
						<spring:bind path="lastName">
						<div class="col-md-7 form-group ${status.error ? 'has-error' : ''}">
							<form:input path="lastName" type="text" class="form-control" placeholder="Last Name" />
							<form:errors path="lastName" class="input-error" />				
						</div>
						</spring:bind>
					</div>
					<div class="row register-input">
						<div class="col-md-3" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-envelope"></i>
						</div>
						<spring:bind path="email">
						<div class="col-md-7 form-group ${status.error ? 'has-error' : ''}">
							<form:input path="email" class="form-control"  placeholder="Email" />
							<form:errors path="email" class="input-error" />	
						</div>
						</spring:bind>
					</div>
					<div class="row register-input">
						<div class="col-md-3" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-key"></i>
						</div>
						<spring:bind path="password">
						<div class="col-md-7 form-group ${status.error ? 'has-error' : ''}">
							<form:password path="password" class="form-control" placeholder="Password" />
							<form:errors path="password" class="input-error" />				
						</div>
						</spring:bind>
					</div>
					<div class="row register-input">
						<div class="col-md-3" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-shield-alt"></i>
						</div>
						<spring:bind path="confirmPassword">
						<div class="col-md-7 form-group ${status.error ? 'has-error' : ''}">
							<form:password path="confirmPassword" class="form-control" placeholder="Confirm Password" />
							<form:errors path="confirmPassword" class="input-error" />				
						</div>
						</spring:bind>
					</div>
					<div class="row register-input" style="text-align:center;">
						<button class="btn btn-primary" type="submit">Register</button>
						<br>
						<div class="input-success">
							<c:out value="${registerSuccess}"></c:out>
						</div>
					</div>
					 
					</form:form>
				</div>
			</div>
			<!-- 
			<div class="row">
				<div class="col-sm-6">
					<b>Password Complexity</b>
					<ul>
						<li>A digit must occur at least once</li>
						<li>A lower case letter must occur at least once</li>
						<li>An upper case letter must occur at least once</li>
						<li>A special character must occur at least once</li>
						<li>No whitespace allowed in the entire string</li>
						<li>At least 8 characters
					</ul>
				</div>
			</div>
			
			-->
		</div>
	</div>
</body>


<!-- 
				
				 -->
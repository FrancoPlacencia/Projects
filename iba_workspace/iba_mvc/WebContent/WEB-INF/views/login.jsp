<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
<title>IBA - Index</title>
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
							<i class="fas fa-user-circle"></i>
						</div>
						<h3 style="color: #1B67A6;">Autentication Required</h3>
						<p>Enter email and password to log on:</p>
						<br />
					</div>
					<form:form action="login" method="post" modelAttribute="user" >
					<div class="row general-input">
						<div class="col-md-3" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-envelope"></i>
						</div>
						<div class="col-md-7 form-group ${status.error ? 'has-error' : ''}">
							<form:input path="email" type="text" class="form-control" placeholder="Email" />
							<br />
							<form:errors path="email" class="input-error" />	
						</div>
					</div>
					<div class="row general-input">
						<div class="col-md-3" style="font-size:2em; color:#2e6da4; text-align:right;">
							<i class="fas fa-key"></i>
						</div>
						<div class="col-md-7 form-group ${status.error ? 'has-error' : ''}">
							<form:password path="password" class="form-control" placeholder="Password" />
							<br />
							<form:errors path="password"  class="input-error" />	
						</div>
					</div>
					<br />
					<div class="row general-input">
						<div class="col-md-6" style="text-align:right;">
							<button class="btn btn-primary" type="submit">Login</button>
						</div>
						<div class="col-md-6" style="text-align:left; padding-top: 5px;">
							<spring:url value="/register" var="register" />
							<a href="${register}">Register</a>
						</div>
					</div>
					</form:form>
				</div>
				
				<div class="col-md-1"></div>
			</div>
			<jsp:include page="/WEB-INF/views/fragments/footer.jsp" />
		</div>
	</div>	
</body>
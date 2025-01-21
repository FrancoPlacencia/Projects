<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Error Page</title>
<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<spring:url value="/resources/core/css/error.css" var="errorCss" />
<spring:url value="/resources/core/css/fonts.css" var="fontCss" />

<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
<link href="${errorCss}" rel="stylesheet" />
<link href="${fontCss}" rel="stylesheet" />

</head>
<body>
	<div id="outer">
		<div id="container">
			<div class="row">
				<h1 style="font-size:100px; text-align:center;">
					<i class="material-icons" style=" font-size:70px; color:Brown">warning</i>
					&nbsp;ERROR
				</h1>
				<p style="font-size:50px; text-align:center; color: darkgray;">
					Something went wrong.
				</p>
			</div>
		</div>
	</div>
</body>
</html>
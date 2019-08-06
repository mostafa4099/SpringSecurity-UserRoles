<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<p>Welcome To Here.</p>
	
	<hr>
		<p>
			User: <s:authentication property="principal.username"/>
			<br><br>
			Role: <s:authentication property="principal.authorities"/>
		</p>
	<hr>
	
	<s:authorize access="hasRole('Manager')">
	
		<p>
			<!-- Manager Role Accessible -->
			<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
			(Manager Only.)
		</p>
	
	</s:authorize>
	
	<s:authorize access="hasRole('Admin')">
	
		<p>
			<!-- Admin Role Accessible -->
			<a href="${pageContext.request.contextPath}/systems">IT Leader Meeting</a>
			(Admin Only.)
		</p>
	
	</s:authorize>
	
	<hr>
	
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="Logout"/>
	</form:form>
	
</body>
</html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<h3>Access Denied - You are not authorize to access this resource</h3>
	
	<p>
		<a href="${pageContext.request.contextPath}/">Back to Home Page</a>
	</p>
	
</body>
</html>
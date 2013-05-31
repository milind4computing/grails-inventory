<html>
<head>
	<title>Login Page</title>
	<meta name="layout" content="main"/>
</head>

<body>
	<h1>Login</h1>
	<g:if test="${flash.message}">
		<div class="message">
			${flash.message}
		</div>
	</g:if>
	<g:form action="handleLogin" method="post">
		<table>
		<tr>
			<td width="100"><label for="login">Username:</label></td>
			<td><g:textField name="username" value='${params.username}' /></td>
		</tr>
		<tr>
			<td width="100"><label for="password">Password:</label></td>
			<td><g:passwordField name="password" value='' /></td>
		<tr>
		<g:hiddenField name="rc" value="${params.rc}"/>
		<g:if test="${params.ra}">
			<g:hiddenField name="ra" value="${params.ra}"/>
		</g:if>
		<g:if test="${params.rid}">
			<g:hiddenField name="rid" value="${params.rid}"/>
		</g:if>
		</table>
		<g:actionSubmit class="button" value="Login" action="handleLogin" />
	</g:form>
</body>
</html>
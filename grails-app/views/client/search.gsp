<html>
<head>
	<title>Client Search</title>
	<meta name="layout" content="main"/>
</head>

<body>
	<div id="main-content">
		<h1>Search</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:form action="list" method="post">
			<table>
			<tr><td><label for="username">Search by Username</label></td></tr>
			<tr>
			<td><g:textField name="username" value='${params.username}' /></td>
			<tr>
			</table>
			<g:actionSubmit class="button" value="Search" action="list" />
		</g:form>
	</div>
	<div id="options">
		<g:render template="/client/sidebar" />
	</div>
</body>
</html>
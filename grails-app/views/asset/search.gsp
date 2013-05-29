<html>
<head>
	<title>Asset Search</title>
	<meta name="layout" content="main"/>
</head>

<body>
	<g:if test="${flash.message}">
		<div class="message">
			${flash.message}
		</div>
	</g:if>
	<h1>Search</h1>
	<g:form action="list" method="post">
		<table>
		<tr><td><label for="hubId">Search by HUB ID</label></td></tr>
		<tr>
		<td><g:textField name="hubId" value='${params.hubId}' /></td>
		<tr>
		</table>
		<g:actionSubmit class="button" value="Search" action="list" />
	</g:form>
</body>
</html>
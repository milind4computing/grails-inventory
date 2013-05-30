<%@ page import="harbor.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="main-content">
		<h1><g:message code="default.list.label" args="[entityName]" /></h1>
		<div id="list-client" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>${message(code: 'client.phone.label', default: 'Phone')}</th>
						<th>${message(code: 'client.email.label', default: 'Email')}</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${clientInstanceList}" status="i" var="clientInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "firstName")} ${fieldValue(bean: clientInstance, field: "lastName")}</g:link></td>
						<td>${fieldValue(bean: clientInstance, field: "phone")}</td>
						<td><a href="mailto:${clientInstance.email}">${clientInstance.email}</a>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
		</div>
		<div id="options">
			<g:render template="/client/sidebar" />
		</div>
	</body>
</html>

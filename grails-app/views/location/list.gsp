<%@ page import="harbor.Location" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="main-content" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div id="list" class="content scaffold-list" role="main">
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="location" title="${message(code: 'location.location.label', default: 'Location')}" />
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${locationInstanceList}" status="i" var="locationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${locationInstance.id}">${fieldValue(bean: locationInstance, field: "location")} ${fieldValue(bean: locationInstance, field: "moreSpecific")}</g:link></td>
						<td><g:link action="edit" id="${locationInstance.id}">Edit</g:link></td>
						<td><g:link class="delete" action="delete" id="${locationInstance.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Delete</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${locationInstanceTotal}" />
			</div>
			</div>
		</div>
	</body>
</html>

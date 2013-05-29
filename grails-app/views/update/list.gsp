
<%@ page import="harbor.Update" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'update.label', default: 'Update')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-update" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-update" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="update.asset.label" default="Asset" /></th>
					
						<th><g:message code="update.location.label" default="Location" /></th>
					
						<th><g:message code="update.state.label" default="State" /></th>
					
						<th><g:message code="update.occurredBy.label" default="Occurred By" /></th>
					
						<g:sortableColumn property="note" title="${message(code: 'update.note.label', default: 'Note')}" />
					
						<g:sortableColumn property="occurredAt" title="${message(code: 'update.occurredAt.label', default: 'Occurred At')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${updateInstanceList}" status="i" var="updateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${updateInstance.id}">${fieldValue(bean: updateInstance, field: "asset")}</g:link></td>
					
						<td>${fieldValue(bean: updateInstance, field: "location")}</td>
					
						<td>${fieldValue(bean: updateInstance, field: "state")}</td>
					
						<td>${fieldValue(bean: updateInstance, field: "occurredBy")}</td>
					
						<td>${fieldValue(bean: updateInstance, field: "note")}</td>
					
						<td><g:formatDate date="${updateInstance.occurredAt}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${updateInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

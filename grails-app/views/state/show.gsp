
<%@ page import="harbor.State" %>
<%@ page import="harbor.Update" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'state.label', default: 'State')}" />
		<title>List Assets - ${stateInstance}</title>
	</head>
	<body>
		<div id="asset-content">
			<h1>Asset List</h1>
			<div id="list-asset" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<% def updates = Update.findAllByState(stateInstance, [max:25, sort:"occurredAt", order:"desc"]) %>			
			<g:if test="${stateInstance?.updates}">
				<table>
					<thead>
						<tr>
							<th>${message(code: 'asset.hubId.label', default: 'Hub Id')}</th>
							<th>${message(code: 'asset.serviceTag.label', default: 'Service Tag')}</th>
							<th>${message(code: 'asset.type.label', default: 'Type')}</th>
							<th>${message(code: 'update.state.label', default: 'State')}</th>
							<th>${message(code: 'update.location.label', default: 'Location')}</th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${updates}" status="i" var="update">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link controller="asset" action="show" id="${update.asset.hubId}">${update.asset.hubId}</g:link></td>
							<td>${update.asset.serviceTag}</td>
							<td><g:link controller="asset" action="listByType" id="${update.asset.type.id}">${update.asset.type}</g:link></td>
							<td><g:link controller="state" action="show" id="${update.state.id}">${update.state}</g:link></td>
							<td><g:link controller="location" action="show" id="${update.location.id}">${update.location}</g:link></td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</g:if>
		</div>
		</div>
		<div id="asset-options">
		</div>
	</body>
</html>

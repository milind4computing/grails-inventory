<%@ page import="harbor.Location" %>
<%@ page import="harbor.Asset" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'state.label', default: 'State')}" />
		<title>List Assets - ${locationInstance}</title>
	</head>
	<body>
		<div id="main-content">
			<h1>Asset List</h1>
			<div id="list" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<% def assets = Asset.list() %>			
			<g:if test="${locationInstance?.location}">
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
					<g:each in="${assets}" status="i" var="asset">
						<g:if test="${asset.location == locationInstance}">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><g:link controller="asset" action="show" id="${asset.hubId}">${asset.hubId}</g:link></td>
							<td>${asset.serviceTag}</td>
							<td><g:link controller="asset" action="listByType" id="${asset.type.id}">${asset.type}</g:link></td>
							<td><g:link controller="state" action="show" id="${asset.state.id}" class="state-${asset.state.toString().replace(" ","-")}">${asset.state}</g:link></td>
							<td><g:link controller="location" action="show" id="${asset.location.id}">${asset.location}</g:link></td>
						</tr><g:if test="${i >= 25}"><% return %></g:if>
						</g:if>
						<g:else>
							<% continue %>
						</g:else>
					</g:each>
					</tbody>
				</table>
			</g:if>
		</div>
		</div>
		<div id="options">
		</div>
	</body>
</html>
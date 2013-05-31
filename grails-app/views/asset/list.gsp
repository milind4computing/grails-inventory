<%@ page import="harbor.Asset" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="main-content">
		<h1><g:message code="default.list.label" args="[entityName]" /></h1>
		<div id="list-asset" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>			
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
				<g:each in="${assetInstanceList}" status="i" var="assetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${assetInstance.hubId}">${fieldValue(bean: assetInstance, field: "hubId")}</g:link></td>
						<td>${fieldValue(bean: assetInstance, field: "serviceTag")}</td>
						<td><g:link controller="asset" action="listByType" id="${assetInstance.type.id}">${fieldValue(bean: assetInstance, field: "type")}</g:link></td>
						<td><g:link controller="state" action="show" id="${assetInstance.getState().id}" class="state-${assetInstance.getState().toString().replace(" ","-")}">${assetInstance.getState()}</g:link></td>
						<td><g:link controller="location" action="show" id="${assetInstance.getLocation().id}">${assetInstance.getLocation()}</g:link></td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
		</div>
		<div id="options">
			<g:render template="/asset/sidebar" />
		</div>
	</body>
</html>

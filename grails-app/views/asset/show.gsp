
<%@ page import="harbor.Asset" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	<div id="asset-info">
		<div id="show-asset" class="content scaffold-show" role="main">
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div id="asset-quick-info">
			<div id="asset-quick-info-left">
			
			<ol class="property-list asset">
			
				<g:if test="${assetInstance?.hubId}">
				<li class="fieldcontain">
					<span id="hubId-label" class="property-label"><g:message code="asset.hubId.label" default="Hub Id" /></span>
						<span class="property-value" aria-labelledby="hubId-label"><h3><g:fieldValue bean="${assetInstance}" field="hubId"/></h3></span>
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.serviceTag}">
				<li class="fieldcontain">
					<span id="serviceTag-label" class="property-label"><g:message code="asset.serviceTag.label" default="Service Tag" /></span>
					
						<span class="property-value" aria-labelledby="serviceTag-label"><g:fieldValue bean="${assetInstance}" field="serviceTag"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assetInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="asset.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:link controller="type" action="show" id="${assetInstance?.type?.id}">${assetInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				</ol></div>
				<div id="asset-quick-info-right">
				<% def location = assetInstance.getLocation() %>
				<ol class="property-list asset">
				<g:if test="${location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="update.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:link controller="location" action="show" id="${location.id}">${location.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<% def state = assetInstance.getState() %>
				
				<g:if test="${state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="update.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:link controller="state" action="show" id="${state.id}">${state.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
			</ol></div>
		</div>
		<br>
		
		<% def updateInstanceList = assetInstance.getUpdateHistory() %>
		
		<div id="list-update" class="content scaffold-list clearBoth" role="main">
			<h2>Update History</h2>
			<table>
				<thead>
					<tr>
						<th><g:message code="update.location.label" default="Location" /></th>
						<th><g:message code="update.state.label" default="State" /></th>
						<th><g:message code="update.occurredBy.label" default="Occurred By" /></th>
						<g:sortableColumn property="occurredAt" title="${message(code: 'update.occurredAt.label', default: 'Occurred At')}" />
						<g:sortableColumn property="note" title="${message(code: 'update.note.label', default: 'Note')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${updateInstanceList}" status="i" var="updateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${fieldValue(bean: updateInstance, field: "location")}</td>
						<td>${fieldValue(bean: updateInstance, field: "state")}</td>
						<td>${fieldValue(bean: updateInstance, field: "occurredBy")}</td>
						<td><g:formatDate date="${updateInstance.occurredAt}" format="MMM dd yyyy" /></td>
						<td>${fieldValue(bean: updateInstance, field: "note")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${updateInstanceList.size()}" />
			</div>
		</div>
	</div>
		<div id="update-asset">
			<h2>Update Asset</h2>
			<g:form action="update">
				<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'location', 'error')} required">
					<label for="location">
						<g:message code="update.location.label" default="Location" />
					</label>
					<g:select id="location" name="locationId" from="${harbor.Location.list()}" optionKey="id" required="" value="${updateInstance?.location?.id}" class="many-to-one"/>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'state', 'error')} required">
					<label for="state">
						<g:message code="update.state.label" default="State" />
					</label>
					<g:select id="state" name="stateId" from="${harbor.State.list()}" optionKey="id" required="" value="${updateInstance?.state?.id}" class="many-to-one"/>
				</div>
				
				<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'note', 'error')} ">
					<label for="note">
						<g:message code="update.note.label" default="Note" />
						
					</label>
					<g:textArea name="note" cols="40" rows="5" maxlength="1000" value="${updateInstance?.note}"/>
				</div><br>
				<g:hiddenField name="hubId" value="${params.id}" />
				<g:submitButton name="update" class="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			</g:form>
		</div>
	</div>
	</body>
</html>

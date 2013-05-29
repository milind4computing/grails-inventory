
<%@ page import="harbor.Asset" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-asset" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list asset">
			
				<g:if test="${assetInstance?.hubId}">
				<li class="fieldcontain">
					<span id="hubId-label" class="property-label"><g:message code="asset.hubId.label" default="Hub Id" /></span>
					
						<span class="property-value" aria-labelledby="hubId-label"><g:fieldValue bean="${assetInstance}" field="hubId"/></span>
					
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
				
				<% def location = assetInstance.getLocation() %>
				
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
			
			</ol>
		</div>
	</body>
</html>

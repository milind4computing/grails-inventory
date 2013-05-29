
<%@ page import="harbor.Update" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'update.label', default: 'Update')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-update" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-update" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list update">
			
				<g:if test="${updateInstance?.asset}">
				<li class="fieldcontain">
					<span id="asset-label" class="property-label"><g:message code="update.asset.label" default="Asset" /></span>
					
						<span class="property-value" aria-labelledby="asset-label"><g:link controller="asset" action="show" id="${updateInstance?.asset?.id}">${updateInstance?.asset?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${updateInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="update.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:link controller="location" action="show" id="${updateInstance?.location?.id}">${updateInstance?.location?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${updateInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="update.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:link controller="state" action="show" id="${updateInstance?.state?.id}">${updateInstance?.state?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${updateInstance?.occurredBy}">
				<li class="fieldcontain">
					<span id="occurredBy-label" class="property-label"><g:message code="update.occurredBy.label" default="Occurred By" /></span>
					
						<span class="property-value" aria-labelledby="occurredBy-label"><g:link controller="user" action="show" id="${updateInstance?.occurredBy?.id}">${updateInstance?.occurredBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${updateInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="update.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${updateInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${updateInstance?.occurredAt}">
				<li class="fieldcontain">
					<span id="occurredAt-label" class="property-label"><g:message code="update.occurredAt.label" default="Occurred At" /></span>
					
						<span class="property-value" aria-labelledby="occurredAt-label"><g:formatDate date="${updateInstance?.occurredAt}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${updateInstance?.id}" />
					<g:link class="edit" action="edit" id="${updateInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

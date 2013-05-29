
<%@ page import="harbor.Location" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-location" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-location" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list location">
			
				<g:if test="${locationInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="location.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${locationInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.specific}">
				<li class="fieldcontain">
					<span id="specific-label" class="property-label"><g:message code="location.specific.label" default="Specific" /></span>
					
						<span class="property-value" aria-labelledby="specific-label"><g:fieldValue bean="${locationInstance}" field="specific"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${locationInstance?.updates}">
				<li class="fieldcontain">
					<span id="updates-label" class="property-label"><g:message code="location.updates.label" default="Updates" /></span>
					
						<g:each in="${locationInstance.updates}" var="u">
						<span class="property-value" aria-labelledby="updates-label"><g:link controller="update" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${locationInstance?.id}" />
					<g:link class="edit" action="edit" id="${locationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>


<%@ page import="harbor.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="main-content" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list client" style="width:450px; margin-left:20px; margin-top:20px;">
			
				<g:if test="${clientInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="client.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${clientInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="client.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${clientInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="client.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${clientInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="client.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${clientInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="client.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${clientInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.office}">
				<li class="fieldcontain">
					<span id="office-label" class="property-label"><g:message code="client.office.label" default="Office" /></span>
					
						<span class="property-value" aria-labelledby="office-label"><g:fieldValue bean="${clientInstance}" field="office"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.department}">
				<li class="fieldcontain">
					<span id="department-label" class="property-label"><g:message code="client.department.label" default="Department" /></span>
					
						<span class="property-value" aria-labelledby="department-label"><g:fieldValue bean="${clientInstance}" field="department"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="client.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${clientInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clientInstance?.assets}">
				<li class="fieldcontain">
					<span id="assets-label" class="property-label"><g:message code="client.assets.label" default="Assets" /></span>
					
						<g:each in="${clientInstance.assets}" var="a">
						<span class="property-value" aria-labelledby="assets-label"><g:link controller="asset" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
		</div>
		<div id="options">
			<g:render template="/client/sidebar" />
		</div>
	</body>
</html>

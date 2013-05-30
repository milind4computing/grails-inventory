<%@ page import="harbor.Client" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<div id="main-content">
		<a href="#create-client" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="create-client" class="content scaffold-create" role="main">
			<h1>New Client</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${clientInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${clientInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form create-client">
					<g:render template="form"/>
				</fieldset><br>
				<g:submitButton name="create" class="save button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
		</div>
	</div>
	<div id="options">
		<g:render template="/client/sidebar" />
	</div>
	</body>
</html>

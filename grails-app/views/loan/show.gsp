
<%@ page import="harbor.Loan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'loan.label', default: 'Loan')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-loan" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-loan" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list loan">
			
				<g:if test="${loanInstance?.asset}">
				<li class="fieldcontain">
					<span id="asset-label" class="property-label"><g:message code="loan.asset.label" default="Asset" /></span>
					
						<span class="property-value" aria-labelledby="asset-label"><g:link controller="asset" action="show" id="${loanInstance?.asset?.id}">${loanInstance?.asset?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.replacementAsset}">
				<li class="fieldcontain">
					<span id="replacementAsset-label" class="property-label"><g:message code="loan.replacementAsset.label" default="Replacement Asset" /></span>
					
						<span class="property-value" aria-labelledby="replacementAsset-label"><g:link controller="asset" action="show" id="${loanInstance?.replacementAsset?.id}">${loanInstance?.replacementAsset?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.client}">
				<li class="fieldcontain">
					<span id="client-label" class="property-label"><g:message code="loan.client.label" default="Client" /></span>
					
						<span class="property-value" aria-labelledby="client-label"><g:link controller="client" action="show" id="${loanInstance?.client?.id}">${loanInstance?.client?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.occurredBy}">
				<li class="fieldcontain">
					<span id="occurredBy-label" class="property-label"><g:message code="loan.occurredBy.label" default="Occurred By" /></span>
					
						<span class="property-value" aria-labelledby="occurredBy-label"><g:link controller="user" action="show" id="${loanInstance?.occurredBy?.id}">${loanInstance?.occurredBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.update}">
				<li class="fieldcontain">
					<span id="update-label" class="property-label"><g:message code="loan.update.label" default="Update" /></span>
					
						<span class="property-value" aria-labelledby="update-label"><g:link controller="update" action="show" id="${loanInstance?.update?.id}">${loanInstance?.update?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.replacementUpdate}">
				<li class="fieldcontain">
					<span id="replacementUpdate-label" class="property-label"><g:message code="loan.replacementUpdate.label" default="Replacement Update" /></span>
					
						<span class="property-value" aria-labelledby="replacementUpdate-label"><g:link controller="update" action="show" id="${loanInstance?.replacementUpdate?.id}">${loanInstance?.replacementUpdate?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.loanAction}">
				<li class="fieldcontain">
					<span id="loanAction-label" class="property-label"><g:message code="loan.loanAction.label" default="Loan Action" /></span>
					
						<span class="property-value" aria-labelledby="loanAction-label"><g:link controller="loanAction" action="show" id="${loanInstance?.loanAction?.id}">${loanInstance?.loanAction?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.loanActionReason}">
				<li class="fieldcontain">
					<span id="loanActionReason-label" class="property-label"><g:message code="loan.loanActionReason.label" default="Loan Action Reason" /></span>
					
						<span class="property-value" aria-labelledby="loanActionReason-label"><g:link controller="loanActionReason" action="show" id="${loanInstance?.loanActionReason?.id}">${loanInstance?.loanActionReason?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.occurredAt}">
				<li class="fieldcontain">
					<span id="occurredAt-label" class="property-label"><g:message code="loan.occurredAt.label" default="Occurred At" /></span>
					
						<span class="property-value" aria-labelledby="occurredAt-label"><g:formatDate date="${loanInstance?.occurredAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${loanInstance?.userDamage}">
				<li class="fieldcontain">
					<span id="userDamage-label" class="property-label"><g:message code="loan.userDamage.label" default="User Damage" /></span>
					
						<span class="property-value" aria-labelledby="userDamage-label"><g:formatBoolean boolean="${loanInstance?.userDamage}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${loanInstance?.id}" />
					<g:link class="edit" action="edit" id="${loanInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

<%@ page import="harbor.State" %>
<%@ page import="harbor.Location" %>

<g:if test="${controllerName=="asset"}">
	<g:if test="${session.user.isAdmin}">
		<div style="padding-bottom:10px;"><g:link action="create">New Asset</g:link></div>
	</g:if>
</g:if>

<g:if test="${controllerName=="asset" && actionName=="show"}">
<g:if test="${assetInstance.state.state != "Issued"}">
	<div style="padding-bottom:10px;"><a href="#" id="distribute-asset-link">Distribute Asset</a></div>
</g:if>
<br><br>
<h2>Update Asset</h2>
<g:form action="update">
	<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'location', 'error')} required">
		<label for="location">
			<g:message code="update.location.label" default="Location" />
		</label>
		<g:select id="location" name="locationId" from="${Location.list()}" optionKey="id" required="" value="${assetInstance?.location?.id}" class="many-to-one"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'state', 'error')} required">
		<label for="state">
			<g:message code="update.state.label" default="State" />
		</label>
		<g:select id="state" name="stateId" from="${State.states}" optionKey="id" required="" value="${assetInstance?.state?.id}" class="many-to-one"/>
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
</g:if>
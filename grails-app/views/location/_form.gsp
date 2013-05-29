<%@ page import="harbor.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="location.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${locationInstance?.location}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'specific', 'error')} ">
	<label for="specific">
		<g:message code="location.specific.label" default="Specific" />
		
	</label>
	<g:textField name="specific" value="${locationInstance?.specific}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'updates', 'error')} ">
	<label for="updates">
		<g:message code="location.updates.label" default="Updates" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${locationInstance?.updates?}" var="u">
    <li><g:link controller="update" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="update" action="create" params="['location.id': locationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'update.label', default: 'Update')])}</g:link>
</li>
</ul>

</div>


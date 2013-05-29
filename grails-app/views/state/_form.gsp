<%@ page import="harbor.State" %>



<div class="fieldcontain ${hasErrors(bean: stateInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="state.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" required="" value="${stateInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stateInstance, field: 'updates', 'error')} ">
	<label for="updates">
		<g:message code="state.updates.label" default="Updates" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${stateInstance?.updates?}" var="u">
    <li><g:link controller="update" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="update" action="create" params="['state.id': stateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'update.label', default: 'Update')])}</g:link>
</li>
</ul>

</div>


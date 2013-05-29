<%@ page import="harbor.Type" %>



<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="type.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${typeInstance?.type}"/>
</div>


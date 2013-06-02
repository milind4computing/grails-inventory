<%@ page import="harbor.Type" %>



<div class="fieldcontain ${hasErrors(bean: typeInstance, field: 'type', 'error')} required">
	<label for="make">
		<g:message code="type.make.label" default="Make" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="make" required="" value="${typeInstance?.make}"/>
	<label for="model">
		<g:message code="type.model.label" default="Model" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="model" required="" value="${typeInstance?.model}"/>
</div>


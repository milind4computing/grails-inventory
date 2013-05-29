<%@ page import="harbor.Asset" %>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'hubId', 'error')} required">
	<label for="hubId">
		<g:message code="asset.hubId.label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hubId" required="" value="${assetInstance?.hubId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'serviceTag', 'error')} required">
	<label for="serviceTag">
		<g:message code="asset.serviceTag.label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="serviceTag" required="" value="${assetInstance?.serviceTag}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="asset.type.label" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${harbor.Type.list()}" optionKey="id" required="" value="${assetInstance?.type?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain  required">
	<label for="location">
		<g:message code="update.location.label" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="location" name="location.id" from="${harbor.Location.list()}" optionKey="id" required="" value="" class="many-to-one"/>
</div>


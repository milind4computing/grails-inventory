<%@ page import="harbor.Asset" %>



<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'hubId', 'error')} required">
	<label for="hubId">
		<g:message code="asset.hubId.label" default="Hub Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hubId" required="" value="${assetInstance?.hubId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'serviceTag', 'error')} required">
	<label for="serviceTag">
		<g:message code="asset.serviceTag.label" default="Service Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="serviceTag" required="" value="${assetInstance?.serviceTag}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="asset.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${harbor.Type.list()}" optionKey="id" required="" value="${assetInstance?.type?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain  required">
	<label for="location">
		<g:message code="update.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="location" name="location.id" from="${harbor.Location.list()}" optionKey="id" required="" value="" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'updates', 'error')} ">
	<label for="updates">
		<g:message code="asset.updates.label" default="Updates" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${assetInstance?.updates?}" var="u">
    <li><g:link controller="update" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="update" action="create" params="['asset.id': assetInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'update.label', default: 'Update')])}</g:link>
</li>
</ul>

</div>


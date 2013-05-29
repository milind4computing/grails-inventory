<%@ page import="harbor.Update" %>



<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'asset', 'error')} required">
	<label for="asset">
		<g:message code="update.asset.label" default="Asset" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="asset" name="asset.id" from="${harbor.Asset.list()}" optionKey="id" required="" value="${updateInstance?.asset?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="update.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="location" name="location.id" from="${harbor.Location.list()}" optionKey="id" required="" value="${updateInstance?.location?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="update.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="state" name="state.id" from="${harbor.State.list()}" optionKey="id" required="" value="${updateInstance?.state?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'occurredBy', 'error')} required">
	<label for="occurredBy">
		<g:message code="update.occurredBy.label" default="Occurred By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="occurredBy" name="occurredBy.id" from="${harbor.User.list()}" optionKey="id" required="" value="${updateInstance?.occurredBy?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="update.note.label" default="Note" />
		
	</label>
	<g:textArea name="note" cols="40" rows="5" maxlength="1000" value="${updateInstance?.note}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: updateInstance, field: 'occurredAt', 'error')} required">
	<label for="occurredAt">
		<g:message code="update.occurredAt.label" default="Occurred At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="occurredAt" precision="day"  value="${updateInstance?.occurredAt}"  />
</div>


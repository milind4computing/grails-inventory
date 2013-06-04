<%@ page import="harbor.Loan" %>



<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'asset', 'error')} required">
	<label for="asset">
		<g:message code="loan.asset.label" default="Asset" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="asset" name="asset.id" from="${harbor.Asset.list()}" optionKey="id" required="" value="${loanInstance?.asset?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'replacementAsset', 'error')} ">
	<label for="replacementAsset">
		<g:message code="loan.replacementAsset.label" default="Replacement Asset" />
		
	</label>
	<g:select id="replacementAsset" name="replacementAsset.id" from="${harbor.Asset.list()}" optionKey="id" value="${loanInstance?.replacementAsset?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'client', 'error')} required">
	<label for="client">
		<g:message code="loan.client.label" default="Client" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="client" name="client.id" from="${harbor.Client.list()}" optionKey="id" required="" value="${loanInstance?.client?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'occurredBy', 'error')} required">
	<label for="occurredBy">
		<g:message code="loan.occurredBy.label" default="Occurred By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="occurredBy" name="occurredBy.id" from="${harbor.User.list()}" optionKey="id" required="" value="${loanInstance?.occurredBy?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'update', 'error')} required">
	<label for="update">
		<g:message code="loan.update.label" default="Update" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="update" name="update.id" from="${harbor.Update.list()}" optionKey="id" required="" value="${loanInstance?.update?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'replacementUpdate', 'error')} ">
	<label for="replacementUpdate">
		<g:message code="loan.replacementUpdate.label" default="Replacement Update" />
		
	</label>
	<g:select id="replacementUpdate" name="replacementUpdate.id" from="${harbor.Update.list()}" optionKey="id" value="${loanInstance?.replacementUpdate?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'loanAction', 'error')} required">
	<label for="loanAction">
		<g:message code="loan.loanAction.label" default="Loan Action" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="loanAction" name="loanAction.id" from="${harbor.LoanAction.list()}" optionKey="id" required="" value="${loanInstance?.loanAction?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'loanActionReason', 'error')} ">
	<label for="loanActionReason">
		<g:message code="loan.loanActionReason.label" default="Loan Action Reason" />
		
	</label>
	<g:select id="loanActionReason" name="loanActionReason.id" from="${harbor.LoanActionReason.list()}" optionKey="id" value="${loanInstance?.loanActionReason?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'occurredAt', 'error')} required">
	<label for="occurredAt">
		<g:message code="loan.occurredAt.label" default="Occurred At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="occurredAt" precision="day"  value="${loanInstance?.occurredAt}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: loanInstance, field: 'userDamage', 'error')} ">
	<label for="userDamage">
		<g:message code="loan.userDamage.label" default="User Damage" />
		
	</label>
	<g:checkBox name="userDamage" value="${loanInstance?.userDamage}" />
</div>


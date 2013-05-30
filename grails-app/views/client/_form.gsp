<%@ page import="harbor.Client" %>



<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="client.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${clientInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="client.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${clientInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="client.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${clientInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="client.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${clientInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="client.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${clientInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'office', 'error')} ">
	<label for="office">
		<g:message code="client.office.label" default="Office" />
		
	</label>
	<g:textField name="office" value="${clientInstance?.office}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'department', 'error')} ">
	<label for="department">
		<g:message code="client.department.label" default="Department" />
		
	</label>
	<g:textField name="department" value="${clientInstance?.department}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: clientInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="client.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="255" value="${clientInstance?.description}"/>
</div>


<%@ page import="harbor.Client" %>
<% def client = Client.get(params.id) %>
<g:form controller="asset" action="distribute">
Distributing to...<br>
<g:link controller="client" action="show" id="${params.id}">${client}</g:link><br>
<a href="mailto:${client.email}">${client.email}</a><br>
<g:textArea name="note">Note</g:textArea>
<g:hiddenField name="hubId" value="${params.hubId}" />
<g:hiddenField name="clientId" value="${params.id}" />
<g:submitButton name="distribute" value="Distribute" />
</g:form>
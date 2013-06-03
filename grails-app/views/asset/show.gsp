<%@ page import="harbor.Asset" %>
<%@ page import="harbor.State" %>
<%@ page import="harbor.Loan" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<script type="text/javascript">
		$(document).ready(function() {

		});
		</script>
	</head>
	<body>
	<div id="main-content" class="content scaffold-show" role="main">
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div id="asset-top">
			<div id="asset-left">
				<ol class="property-list asset">
					<img src="/harbor/images/laptop.png" width="64" height="64" style="float:left;padding-right:10px;padding-top:10px;"/>
					<li class="fieldcontain">
						<span id="hubId-label" class="property-label"><g:message code="asset.hubId.label" /></span>
						<span class="property-value"><b><g:fieldValue bean="${assetInstance}" field="hubId"/></b></span>
					</li>
					<li class="fieldcontain">
						<span id="type-label" class="property-label"><g:message code="asset.type.label" /></span>
						<span class="property-value"><g:link controller="asset" action="listByType" id="${assetInstance?.type?.id}" style="font-size:70%;">${assetInstance?.type?.encodeAsHTML()}</g:link></span>
					</li>
					<li class="fieldcontain">
						<span id="serviceTag-label" class="property-label"><g:message code="asset.serviceTag.label" /></span>
						<span class="property-value"><g:fieldValue bean="${assetInstance}" field="serviceTag"/></span>
					</li>
				</ol>
			</div>
			<div id="asset-right">
				<% def location = assetInstance.getLocation() %>
				<% def state = assetInstance.getState() %>
				<ol class="property-list asset">
					<li class="fieldcontain">
						<span id="location-label" class="property-label"><g:message code="update.location.label" /></span>
						<span class="property-value"><g:link controller="location" action="show" id="${location.id}">${location.encodeAsHTML()}</g:link></span>
					</li>
					<li class="fieldcontain">
						<span id="state-label" class="property-label"><g:message code="update.state.label" /></span>
						<span class="property-value"><g:link controller="state" action="show" id="${state.id}" class="state-${state.toString().replace(" ","-")}">${state.encodeAsHTML()}</g:link></span>
					</li>
				</ol>
			</div><div class="clearBoth"></div>
			<br>
			<div id="distribute-asset" class="clearBoth">
				<div style="float:left;">
					<h2>Search by Last Name</h2>
					<g:form action="list" method="post">
						<table>
						<tr><td><g:textField name="username" value='${params.username}' /></td>
						<td><g:actionSubmit class="button" value="Search" action="list" /></td>
						</tr>
						</table>
						
					</g:form>
				</div>
				<div>
					
				</div>
			</div>
		</div>
		<% def updateInstanceList = assetInstance.getUpdateHistory() %>
		<div id="list-update" class="content scaffold-list clearBoth" role="main">
			<h2>Update History</h2>
			<table>
				<thead>
					<tr>
						<th><g:message code="update.location.label" default="Location" /></th>
						<th><g:message code="update.state.label" default="State" /></th>
						<th><g:message code="update.occurredBy.label" default="Occurred By" /></th>
						<g:sortableColumn property="occurredAt" title="${message(code: 'update.occurredAt.label', default: 'Occurred At')}" />
						<g:sortableColumn property="note" title="${message(code: 'update.note.label', default: 'Note')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${updateInstanceList}" status="i" var="updateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<g:if test="${updateInstance.state == State.findByState("Issued")}">
						<% def loan = Loan.findByUpdate(updateInstance) %>
						<td><g:link controller="client" action="show" id="${loan.client.id}">${fieldValue(bean: loan, field: "client")}</g:link></td>
						</g:if>
						<g:else>
						<td><g:link controller="location" action="show" id="${updateInstance.location.id}">${fieldValue(bean: updateInstance, field: "location")}</g:link></td>
						</g:else>
						<td><g:link controller="state" action="show" id="${updateInstance.state.id}" class="state-${updateInstance.state.toString().replace(" ","-")}">${fieldValue(bean: updateInstance, field: "state")}</g:link></td>
						<td>${fieldValue(bean: updateInstance, field: "occurredBy")}</td>
						<td><g:formatDate date="${updateInstance.occurredAt}" format="MMMMM dd, yyyy" /></td>
						<td>${fieldValue(bean: updateInstance, field: "note")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</div>
	<div id="options">
		<g:render template="/asset/sidebar" />
	</div>
	</body>
</html>
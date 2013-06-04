<ul id="client-results-list">
<g:each in="${searchResults}" var="client">
	<li class="client-result"><g:remoteLink controller="client" action="showClientForDistribution" id="${client.id}" update="client-results" params="[hubId:params.hubId]">${client.firstName} ${client.lastName}</g:remoteLink></li>
</g:each>
</ul>
<div style="padding-bottom:20px;"><g:link controller="home">Home</g:link></div>
<g:if test="${session.user.isAdmin}">
	<div style="padding-bottom:20px;"><g:link controller="location" action="list">Edit Locations</g:link></div>
</g:if>
<g:if test="${session.user.isAdmin}">
	<div style="padding-bottom:20px;"><g:link controller="state" action="list">Edit States</g:link></div>
</g:if>
<g:if test="${session.user.isAdmin}">
	<div style="padding-bottom:20px;"><g:link controller="type" action="list">Edit Types</g:link></div>
</g:if>
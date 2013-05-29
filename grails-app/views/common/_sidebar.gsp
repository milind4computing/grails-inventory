<g:if test="${controllerName=="asset"}">
	<g:if test="${session.user.isAdmin}">
		<g:link action="create">New Asset</g:link>
	</g:if>
</g:if>
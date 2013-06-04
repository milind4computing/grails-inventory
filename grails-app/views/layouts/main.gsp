<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<g:javascript library="jquery" />
		<script src="/harbor/js/main.js"></script>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="topbar" role="banner">
			<span id="logo"><a href="/harbor"><h1>Harbor</h1></a></span>
			<span id="navigation">
				<ul>
					<li><g:link controller="home">Home</g:link></li>
					<li><g:link controller="asset" action="search">Assets</g:link></li>
					<li><g:link controller="client" action="search">Clients</g:link></li>
					<g:if test="${session.user}">
						<li><g:link controller="session" action="logout">Logout</g:link></li>
					</g:if><g:else>
						<li><g:link controller="session" action="login">Login</g:link></li>
					</g:else>
				</ul>
			</span>
		</div>
		<div id="content"><g:layoutBody/></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
